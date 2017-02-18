class Message < ApplicationRecord

  belongs_to :retrospective
  has_many :reactions

  before_save { |msg| msg.ts = msg.ts || rand } # TODO: Get rid of

  def self.response(is_positive)
    if is_positive
      %w(Awesome! Great! Brilliant! Insane! Sick! Awesomesauce! Schwifty!).sample
    else
      %w(Interesting. Agreed. Well\ said. Definitely. Thanks.).sample
    end
  end

end
