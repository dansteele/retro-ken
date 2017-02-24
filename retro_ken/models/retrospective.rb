class Retrospective < ApplicationRecord

  has_many :messages

  class << self

    def start!
      create! if last.nil? || last.finished?
    end

    def finish!
      last.update(finished: true)
    end

    def quick_summary
      msgs = last.messages
      "There were #{msgs.where(positive: true).size} positive and " +
        "#{msgs.where(positive: false).size} negative comments."
    end

    def summary
      last
        .messages
        .where(in_summary: true)
        .where.not(reactions_count: 0)
        .joins(:reactions)
        .order('positive DESC')
        .order('reactions_count DESC')
        .uniq
        .map { |m| { message: m.message, reactions: m.gather_reactions } }
    end

  end
end
