require 'spec_helper'

describe RetroKen::Commands::Help do
  it 'help' do
    expect(message: 'retroken help').to respond_with_slack_message('Having trouble?
  To add an idea, just tell me `+ Idea` or `- Idea`
  To add an idea anonymously, add `anon`, like this: `+ Idea anon`')
  end
end
