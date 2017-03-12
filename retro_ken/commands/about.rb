module RetroKen
  module Commands
    class Default < SlackRubyBot::Commands::Base
      match(/^(?<bot>\w*)$/) do |client, data, _match|
        client.say(channel: data.channel, text: RetroKen::ABOUT, gif: 'retro robot')
      end
    end
  end
end
