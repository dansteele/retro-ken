Dir[File.join(File.dirname(__FILE__), 'models', '**/*.rb')].each do |file|
  require file
end
