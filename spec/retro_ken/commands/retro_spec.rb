require 'spec_helper'

describe RetroKen::Commands::Retro do
  def app
    RetroKen::Bot.instance
  end

  it 'starts a retrospective' do
    expect(message: 'retroken retro start').to(
      respond_with_slack_message('Started! Say `RetroKen stop` to end.')
    )
  end

  describe 'when a retrospective is active' do

    before { Retrospective.create! }

    it 'stops a retrospective' do
      expect(message: 'retroken retro stop').to(
      respond_with_slack_message('Finished! Say `RetroKen summary` to summarise.')
      )
    end

    it 'adds a positive message to the retrospective' do
      expect(message: '+ I love all the things').to(
        respond_with_slack_message(/!/)
      )
      expect(Message.count).to be 1
      expect(Message.last.positive?).to be true
    end
  end
end
