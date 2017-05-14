module RetroKen
  module Commands
    class Help < SlackRubyBot::Commands::Base
      command 'help' do |client, data, _match|
	client.say(channel: data.channel, text: 'Having trouble?
To add an idea, just tell me `+ Idea` or `- Idea`
To add an idea anonymously, add `anon`, like this: `+ Idea anon`') unless Retrospective.last.nil? || Retrospective.last.finished?
	if Retrospective.last.finished? || Retrospective.last.nil?
			client.say(channel: data.channel, text: 'To start a retrospective, tell me `retro start`.
	To end a retrospective, tell me `retro stop`.
	To get a voteable list, tell me `retro message`.
	To get a summary, tell me `retro summary`.')
	end		   
		   

        client.say(channel: data.channel, text: 'See https://github.com/dansteele/retro-ken, please.', gif: 'help')
      end
    end
  end
end
