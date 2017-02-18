Dir[File.join(File.dirname(__FILE__), 'hooks', '**/*.rb')].each do |file|
  require file
end
