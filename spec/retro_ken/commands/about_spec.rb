require 'spec_helper'

describe RetroKen::Commands::Default do
  def app
    RetroKen::Bot.instance
  end
  it 'responds to lowercase retroken' do
    expect(message: 'retroken').to respond_with_slack_message(RetroKen::ABOUT)
  end
  it 'responds to Capitalised Retroken' do
    expect(message: 'Retroken').to respond_with_slack_message(RetroKen::ABOUT)
  end
  it 'responds to CamelCased RetroKen' do
    expect(message: 'RetroKen').to respond_with_slack_message(RetroKen::ABOUT)
  end
end
