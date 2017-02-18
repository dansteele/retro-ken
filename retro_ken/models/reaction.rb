class Reaction < ApplicationRecord

  belongs_to :message

  before_save { |react| react.ts = react.ts || rand } # TODO: Get rid of

  before_create do |react|
    react.positive = Reaction.is_positive?(react.reaction)
  end

  def self.is_positive?(emoji)
    %w(+1 hype smile).include? emoji
  end

end
