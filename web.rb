require 'sinatra/base'

module RetroKen
  class Web < Sinatra::Base
    get '/' do
      'Hello World'
    end
  end
end
