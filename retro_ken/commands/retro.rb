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
                   text: 'Finished! Say `RetroKen retro messages` to create voteable messages.'
      end

      command 'retro messages' do |client, data|
        Retrospective.last.messages.each do |m|
          ts = client.web_client.chat_postMessage(
            channel: data.channel,
            text: [m.representation, m.message].join(' '),
            as_user: false,
            id: m.id
          )['ts']
          Message.create ts: ts,
                         in_summary: true,
                         message: m.message,
                         positive: m.positive?,
                         retrospective: Retrospective.last
        end
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
