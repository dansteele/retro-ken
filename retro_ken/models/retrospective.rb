class Retrospective < ApplicationRecord

  def self.finish
    last.update(finished: true)
  end

end
