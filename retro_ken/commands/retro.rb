module RetroKen
  module Commands
    class Retro < SlackRubyBot::Commands::Base
      command 'retro start' do |client, data, _match|
        Retrospective.create!
        client.say channel: data.channel,
                   text: 'Started! Say `RetroKen stop` to end.'
      end

      command 'retro stop' do |client, data, _match|
        Retrospective.finish
        client.say channel: data.channel,
                   text: 'Finished! Say `RetroKen summary` to summarise.'
      end

      command 'retro quick summary' do |client, data, _match|
        client.say channel: data.channel,
                   text: Retrospective.quick_summary
      end

      operator '+', '-' do |client, data, match|
        bool, message = match.captures
        is_positive = (bool == '+')
        Message.create! positive: is_positive,
                        message: message,
                        retrospective: Retrospective.last
       client.say channel: data.channel,
                  text: Message.response(is_positive)
      end
    end
  end
end
