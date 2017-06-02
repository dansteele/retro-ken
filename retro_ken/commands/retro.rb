module RetroKen
  module Commands
    class Retro < SlackRubyBot::Commands::Base
      command 'retro start' do |client, data|
        Retrospective.start!
        client.say channel: data.channel,
                   text: %w(Say `RetroKen retro stop` to end.  Need help?  Just ask me for `help` in a private message.
		                        https://media.giphy.com/media/26DOs997h6fgsCthu/giphy.gif).join(' ')
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
            text: m.message,
            as_user: true
          )['ts']
          m.update({ ts: ts, in_summary: true })
        end
      end

      operator '+', '-' do |client, data, match|
        bool, message = match.captures
        Message.create_from_data(data.text, data)
        if Message.contains_many?(data.text)
          client.say channel: data.channel, text: 'So many things! :sweat_smile:'
        else
          is_positive = (bool == '+')
          client.say channel: data.channel, text: Message.response(is_positive)
        end
      end
    end
  end
end
