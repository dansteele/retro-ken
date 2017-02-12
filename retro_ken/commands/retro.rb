module RetroKen
  module Commands
    class Retro < SlackRubyBot::Commands::Base
      command 'retro start' do |client, data, match|
        Retrospective.new
      end
    end
  end
end
