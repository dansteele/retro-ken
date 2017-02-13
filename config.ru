$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'retro_ken'
require 'web'

Thread.new do
  begin
    RetroKen::Bot.run
  rescue StandardError => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run RetroKen::Web
