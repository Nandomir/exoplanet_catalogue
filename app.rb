require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('./controllers/astronomers_controller.rb')
require_relative('./controllers/exoplanets_controller.rb')
require_relative('./controllers/discoveries_controller.rb')


get '/' do
  erb(:index)
end