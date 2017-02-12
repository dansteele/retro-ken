namespace :db do
  desc "Migrates the db"
  task :migrate do
    require 'active_record'
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
