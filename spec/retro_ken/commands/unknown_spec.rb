require 'spec_helper'

describe SlackRubyBot::Commands::Unknown do
  def app
    RetroKen::Bot.instance
  end
  let(:client) { app.send(:client) }
  it 'invalid command' do
    expect(message: 'retroken foobar').to respond_with_slack_message("Sorry <@user>, I don't understand that command!")
  end
end
