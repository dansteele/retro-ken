Dir[File.join(File.dirname(__FILE__), 'commands', '**/*.rb')].each do |file|
  require file
end
