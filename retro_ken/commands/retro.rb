module RetroKen
  module Commands
    class Retro < SlackRubyBot::Commands::Base
      command 'retro start' do |client, data, match|
        Retrospective.create!
        client.say channel: data.channel,
                   text: 'Started! Say `RetroKen stop` to end.'
      end

      command 'retro stop' do |client, data, match|
        Retrospective.finish
        client.say channel: data.channel,
                   text: 'Finished! Say `RetroKen summary` to summarise.'
      end
    end
  end
end
