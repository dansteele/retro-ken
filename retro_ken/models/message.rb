class Message < ApplicationRecord

  ANONYMOUS_WORDS = ['anon', 'anon ', 'anonymous', 'anonymous '].freeze

  belongs_to :retrospective
  has_many :reactions

  before_save do |msg|
    msg.ts = msg.ts || rand # TODO: Get rid of
    msg.user = 'Anon' if anon?
    msg.message = clean_message
  end

  class << self

    def response(is_positive)
      if is_positive
        %w(Awesome! Great! Brilliant! Insane! Sick! Awesomesauce! Schwifty!).sample
      else
        %w(Interesting. Agreed. Well\ said. Definitely. Thanks.).sample
      end
    end

    def contains_many?(message)
      split_messages(message).length > 0
    end

    def split_messages(message)
      previous = []
      message.split("\n").map_with_index do |match|
        previous << match
        break if match.starts_with? '+', '-'
      end
    end

    def create_bulk_if_needed
      if contains_many?(message)
        split_messages.each do |msg|
          create_from_data(message: msg, is_positive: bool, data: data)
        end
      end
    end

    def create_from_data(message:, is_positive:, data:)
      create_bulk_if_needed
      create! message: message,
              positive: is_positive,
              retrospective: Retrospective.last,
              ts: data&.ts,
              user: data.user
    end

  end

  def anon?
    ANONYMOUS_WORDS.any? { |word| message.include? word }
  end

  def clean_message
    self.message.gsub(Regexp.union(ANONYMOUS_WORDS), '').strip
  end

  def representation
    positive? ? ':white_check_mark:' : ':no_entry_sign:'
  end

  def gather_reactions
    reactions.pluck(:reaction).each_with_object(Hash.new(0)) do |reaction, count|
      count[":#{reaction}:"] += 1
    end.map do |reaction, count|
      {
        reaction: reaction,
        count: count
      }
    end
  end
end
