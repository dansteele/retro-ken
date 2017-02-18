class Retrospective < ApplicationRecord

  has_many :messages

  class << self

    def finish
      last.update(finished: true)
    end

    def quick_summary
      msgs = last.messages
      "There were #{msgs.where(positive: true).size} positive and " +
        "#{msgs.where(positive: false).size} negative comments."
    end

  end
end
