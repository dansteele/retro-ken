ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  password: ENV['RETRO_KEN_DATABASE_PASSWORD'],
  database: "retro_ken_#{ENV['RACK_ENV']}"
)
