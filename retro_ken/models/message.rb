class Message < ApplicationRecord

  belongs_to :retrospective
  has_many :reactions

  before_save do |msg|
    msg.ts = msg.ts || rand # TODO: Get rid of
    msg.message = message.strip
    msg.user = anon? ? 'Anon' : msg.user
  end

  def self.response(is_positive)
    if is_positive
      %w(Awesome! Great! Brilliant! Insane! Sick! Awesomesauce! Schwifty!).sample
    else
      %w(Interesting. Agreed. Well\ said. Definitely. Thanks.).sample
    end
  end

  def anon?
    ['anon', 'anon ', 'anonymous', 'anonymous '].any? { |word| message.include? word }
  end

  def representation
    positive? ? ':white_check_mark:' : ':no_entry_sign:'
  end

  def gather_reactions
    reactions.pluck(:reaction).each_with_object(Hash.new(0)) do |reaction, count|
      count[":#{reaction}:"] += 1
    end.map do |combo|
      {
        reaction: combo.first,
        count: combo.second
      }
    end
  end
end
