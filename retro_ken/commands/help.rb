module RetroKen
  module Commands
    class Help < SlackRubyBot::Commands::Base
      githublink = "See https://github.com/dansteele/retro-ken, please."
      command 'help' do |client, data, _match|
      	if Retrospective.last.nil? || Retrospective.last.finished?
          client.say(channel: data.channel, gif: 'help', text: <<~HERE
            To start a retrospective, tell me `retro start`.
            To end a retrospective, tell me `retro stop`.
            To get a voteable list, tell me `retro message`.
            To get a summary, tell me `retro summary`.
            #{githublink}
            HERE
            )
        else
          client.say(channel: data.channel, gif: 'help', text: <<~HERE
            Having trouble?
            To add an idea, just tell me `+ Idea` or `- Idea`
            To add an idea anonymously, add `anon`, like this: `+ Idea anon`
            #{githublink}
            HERE
            )
      	end
      end
    end
  end
end
