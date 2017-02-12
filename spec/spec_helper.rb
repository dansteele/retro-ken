$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'slack-ruby-bot/rspec'

ENV['RACK_ENV'] = 'test'

Dir[File.join(File.dirname(__FILE__), 'support', '**/*.rb')].each do |file|
  require file
end

require 'retro_ken'
