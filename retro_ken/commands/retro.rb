module RetroKen
  module Commands
    class Retro < SlackRubyBot::Commands::Base

      command 'retro start' do |client, data|
        Retrospective.start!
        client.say channel: data.channel,
                   text: 'Started! Say `RetroKen retro stop` to end.'
      end

      command 'retro stop' do |client, data|
        Retrospective.finish!
        client.say channel: data.channel,
                   text: 'Finished! Say `RetroKen retro summary quick` to summarise.'
      end

      command 'retro summary quick' do |client, data|
        client.say channel: data.channel,
                   text: Retrospective.quick_summary
      end

      command 'retro summary best' do |client, data|
        client.say channel: data.channel,
                   text: Retrospective.quick_summary
      end

      operator '+', '-' do |client, data, match|
        bool, message = match.captures
        is_positive = (bool == '+')
        Message.create! message: message,
                        positive: is_positive,
                        retrospective: Retrospective.last,
                        ts: data&.ts
       client.say channel: data.channel,
                  text: Message.response(is_positive)
      end
    end
  end
end
