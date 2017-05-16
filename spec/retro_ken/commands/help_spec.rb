require 'spec_helper'

describe RetroKen::Commands::Help do
  it 'help' do
    expect(message: 'retroken help').to respond_with_slack_message("To start a retrospective, tell me `retro start`.\nTo end a retrospective, tell me `retro stop`.\nTo get a voteable list, tell me `retro message`.\nTo get a summary, tell me `retro summary`.\nSee https://github.com/dansteele/retro-ken, please.\n")
  end

  describe 'when a retrospective is active' do
    before { Retrospective.create! }
    it 'help' do
      expect(message: 'retroken help').to respond_with_slack_message("Having trouble?\nTo add an idea, just tell me `+ Idea` or `- Idea`\nTo add an idea anonymously, add `anon`, like this: `+ Idea anon`\nSee https://github.com/dansteele/retro-ken, please.\n")

    end
  end
end
