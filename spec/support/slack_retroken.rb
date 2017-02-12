RSpec.configure do |config|
  config.before do
    SlackRubyBot.config.user = 'retroken'
  end
end
