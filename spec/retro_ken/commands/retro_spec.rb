require 'spec_helper'

describe RetroKen::Commands::Retro do
  def app
    RetroKen::Bot.instance
  end

  it 'starts a retrospective' do
    expect(message: 'retroken retro start').to(
      respond_with_slack_message('Started! Say `RetroKen retro stop` to end.')
    )
  end

  describe 'when a retrospective is active' do
    before { Retrospective.create! }

    it 'stops a retrospective' do
      expect(message: 'retroken retro stop').to(
        respond_with_slack_message(
          'Finished! Say `RetroKen retro summary quick` to summarise.'
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
      expect(message: '- I have all the things').to(
        respond_with_slack_message(/./)
      )
      expect(Message.count).to be 1
      expect(Message.last.positive?).to be false
    end
  end

  describe 'after a retrospective' do
    before do
      retro = Retrospective.create!
      8.times do |t|
        Message.create positive: t.even?,
                       message: Faker::Company.catch_phrase,
                       retrospective: retro
      end
    end

    it 'prints a quick summary' do
      expect(message: 'retroken retro summary quick').to(
        respond_with_slack_message(<<-RESPONSE
          There were 4 positive and 4 negative comments.
        RESPONSE
        .strip
        )
      )
    end

    it 'accepts reactions' do
      skip 'TODO'
    end

  end

end
