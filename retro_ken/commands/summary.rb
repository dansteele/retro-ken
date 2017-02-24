module RetroKen
  module Commands
    class Summary < SlackRubyBot::Commands::Base
      command 'retro summary quick' do |client, data|
        client.say channel: data.channel,
                   text: Retrospective.quick_summary
      end

      command 'retro summary' do |client, data|
        client.say channel: data.channel,
                   text: Retrospective.summary
      end
    end
  end
end
