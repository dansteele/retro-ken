require 'spec_helper'

describe RetroKen::Commands::Help do
  it 'help' do
    expect(message: 'retroken help').to respond_with_slack_message(<<~HERE
      Having trouble?
      To add an idea, just tell me `+ Idea` or `- Idea`
      To add an idea anonymously, add `anon`, like this: `+ Idea anon`
      HERE
      )
  end

  describe 'when a retrospective is active' do
    before { Retrospective.create! }
    it 'help' do
      expect(message: 'retroken help').to response_with_slack_message(<<~HERE
        To start a retrospective, tell me `retro start`.
        To end a retrospective, tell me `retro stop`.
        To get a voteable list, tell me `retro message`.
        To get a summary, tell me `retro summary`.
        HERE
        )

    end
  end
end
