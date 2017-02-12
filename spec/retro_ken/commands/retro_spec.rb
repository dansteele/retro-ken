require 'spec_helper'

describe RetroKen::Commands::Retro do
  def app
    RetroKen::Bot.instance
  end
  it 'starts a retrospective' do
    expect(message: 'retroken retro start').to respond_with_slack_message('Started.')
  end
end
