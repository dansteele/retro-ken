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
      split_messages(message).length > 1
    end

    def split_messages(message)
      matches = message.scan(/([+-]+[\s\w[\\n]]*)/).flatten
      matches.each_with_object([]) { |match, arr| arr << match.chomp("\n") }
    end

    def create_from_data(message, data)
      split_messages(message).each do |msg|
        create! message: msg,
                positive: msg.starts_with?('+'),
                retrospective: Retrospective.last,
                ts: data&.ts,
                user: data.user
      end
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
