require 'spec_helper'

describe RetroKen::Commands::Retro do
  it 'starts a retrospective' do
    expect(message: 'retroken retro start').to(
      respond_with_slack_message(
        'Say `RetroKen retro stop` to end. https://media.giphy.com/media/26DOs997h6fgsCthu/giphy.gif'
      )
    )
  end

  describe 'when a retrospective is active' do
    before { Retrospective.create! }

    it 'stops a retrospective' do
      expect(message: 'retroken retro stop').to(
        respond_with_slack_message(
          'Finished! Say `RetroKen retro messages` to create voteable messages.'
        )
      )
    end

    it 'adds a positive message to the retrospective' do
      expect(message: '+ I love all the things', ts: 1234.5).to(
        respond_with_slack_message(/!/)
      )
      expect(Message.count).to be 1
      expect(Message.last.positive?).to be true
    end

    it 'adds a negative message to the retrospective' do
      expect(message: '- I hate all the things').to(
        respond_with_slack_message(/./)
      )
      expect(Message.count).to be 1
      expect(Message.last.positive?).to be false
    end

    describe 'anonymity'
      it 'is not given if not requested' do
        expect(message: '+ I am being public').to(
          respond_with_slack_message(/./)
        )
        expect(Message.last.user).to eq 'user'
      end

      it 'is given if requested' do
        expect(message: '- I am not being public anon').to(
          respond_with_slack_message(/./)
        )
        expect(Message.last.user).to eq 'Anon'
      end
  end

  describe 'after a retrospective' do
    before { SpecHelper.setup_retrospective }

    it 'prints a quick summary' do
      expect(message: 'retroken retro summary quick').to(
        respond_with_slack_message(<<-RESPONSE
          There were 4 positive and 4 negative comments.
        RESPONSE
        .strip
        )
      )
    end

    it 'prints a full summary' do
      expect(message: 'retroken retro summary').to(
        respond_with_slack_message(pattern: "#{Message.last.message} - <@#{Message.last.user}>")
      )
    end

    it 'accepts reactions' do
      skip
    end

  end

end
