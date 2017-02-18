class Retrospective < ApplicationRecord

  has_many :messages

  def self.finish
    last.update(finished: true)
  end

end
