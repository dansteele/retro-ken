require File.join(File.dirname(__FILE__), 'models', 'application_record')
Dir[File.join(File.dirname(__FILE__), 'models', '**/*.rb')].each do |file|
  require file
end
