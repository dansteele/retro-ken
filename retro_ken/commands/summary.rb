module RetroKen
  module Commands
    class Summary < SlackRubyBot::Commands::Base
      command 'retro summary quick' do |client, data|
        client.say channel: data.channel,
                   text: Retrospective.quick_summary
      end

      command 'retro summary' do |client, data|
        res = Retrospective.summary.map do |item|
          Summary.format_reactions(item)
        end
        client.say channel: data.channel,
                   text: res.join("\n\n")
      end

      def self.format_reactions(item)
        [item[:message], " - <@#{item[:user]}>\n", item[:reactions].map do |r|
          [r[:reaction], r[:count], '       ']
        end].join
      end

    end
  end
end
