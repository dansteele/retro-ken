module SpecHelper
  def self.setup_retrospective
    retro = Retrospective.create!
    8.times do |t|
      Message.create positive: t.even?,
      message: Faker::Company.catch_phrase,
      retrospective: retro,
      in_summary: true
    end
    Message.all.each_with_index do |m, i|
      next if i == 0 # Ensure there's one with no reactions
      rand(0..5).times do |t|
        m.reactions << Reaction.new(reaction: (t.even? ? '+1' : Faker::SlackEmoji.emoji.tr(':', '')))
      end
    end
  end
end
