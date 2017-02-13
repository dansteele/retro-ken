ROOT_LOCATION = File.dirname(__FILE__).freeze
require 'rubygems'
require 'bundler'

Bundler.setup :default, :development, :test

require 'pry'

unless ENV['RACK_ENV'] == 'production'
  require 'rspec/core'
  require 'rspec/core/rake_task'

  Dir[File.join(ROOT_LOCATION, 'tasks', '**/*.rb')].each do |file|
    require file
  end

  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task default: [:rubocop, :spec]
end
