require 'spec_helper'

describe RetroKen::Commands::Help do
  def app
    RetroKen::Bot.instance
  end
  it 'help' do
    expect(message: 'retroken help').to respond_with_slack_message('See https://github.com/dansteele/retro-ken, please.')
  end
end
