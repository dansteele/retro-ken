module RetroKen
  module Commands
    class Default < SlackRubyBot::Commands::Base
      match(/^retro-ken$/) do |client, data|
        client.say(channel: data.channel, text: RetroKen::ABOUT, gif: 'retro robot')
      end
    end
  end
end
