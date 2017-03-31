ROOT_LOCATION = File.dirname(__FILE__).freeze
require 'rubygems'
require 'bundler'

Bundler.setup

unless ENV['RACK_ENV'] == 'production'
  require 'rspec/core'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task default: [:rubocop, :spec]
end

Dir[File.join(ROOT_LOCATION, 'tasks', '**/*.rb')].each do |file|
  require file
end
