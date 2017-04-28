require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/discovery.rb')
require_relative('../models/exoplanet.rb')
require_relative('../models/astronomer.rb')
require_relative('../models/detection.rb')
require('pry-byebug')

get '/discoveries' do
  @detection = Discovery.detections()
  erb(:"discoveries/index")
end

get '/discoveries/:id' do
  @detection = Discovery.find_detection(params[:id])
  erb(:"discoveries/show")
end

post '/discoveries/:id/delete' do
  @discovery = Discovery.find_detection(params[:id])
  @discovery.delete()
    redirect to '/discoveries'
end