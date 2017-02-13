namespace :db do
  require 'active_record'

  desc "Creates the db"
  task :create do
    raise StandardError.new('Specify RACK_ENV') unless ENV['RACK_ENV']
    require 'pg'
    conn = PG.connect(dbname: 'postgres')
    conn.exec("CREATE DATABASE retro_ken_#{ENV['RACK_ENV']}")
  end

  desc "Migrates the db"
  task :migrate do
    require File.join(ROOT_LOCATION, 'db', 'init')
    migrations = []
    Dir[File.join(ROOT_LOCATION, 'db', 'migrations', '**/*.rb')].each do |file|
      require file
      (/\d{3}_(?<klass>[a-z_]+)/) =~ file
      migrations << klass.camelize.constantize
    end
    migrations.each { |m| puts m.migrate(:up) }
  end
end
