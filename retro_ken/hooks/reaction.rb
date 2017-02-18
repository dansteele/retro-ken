module RetroKen
  class Lel < SlackRubyBot::Server
    on 'reaction_added' do |_client, data, _match|
      reaction = Reaction.new(ts: data.ts, reaction: data.reaction)
      Message.find_by_ts(data.item.ts).reactions << reaction
    end
  end
end
