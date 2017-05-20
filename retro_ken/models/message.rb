class Message < ApplicationRecord

  ANONYMOUS_WORDS = ['anon', 'anon ', 'anonymous', 'anonymous '].freeze

  belongs_to :retrospective
  has_many :reactions

  before_save do |msg|
    msg.ts = msg.ts || rand # TODO: Get rid of
    msg.user = 'Anon' if anon?
    msg.message = clean_message
  end

  def self.response(is_positive)
    if is_positive
      %w(Awesome! Great! Brilliant! Insane! Sick! Awesomesauce! Schwifty!).sample
    else
      %w(Interesting. Agreed. Well\ said. Definitely. Thanks.).sample
    end
  end

  def self.contains_many?(message)
    ['\n+', '\n-'].map do |matcher|
      binding.pry
      message.count(matcher)
    end.max > 0
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
