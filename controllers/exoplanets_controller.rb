require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/exoplanet.rb')
require('pry-byebug')

get '/exoplanets' do
  @exoplanets = Exoplanet.all()
  erb(:"exoplanets/index")
end

get '/exoplanets/new' do
  erb(:"exoplanets/new")
end

get '/exoplanets/habitable' do
  @exoplanet = Exoplanet.habitable()
  erb(:"exoplanets/habitable")
end

get '/exoplanets/:id' do
  @exoplanet = Exoplanet.find(params[:id].to_i)
  erb(:"exoplanets/show")
end

post '/exoplanets' do
  @exoplanet = Exoplanet.new(params)
  @exoplanet.save
  erb(:"exoplanets/create")
end

get '/exoplanets/:id/edit' do
  @exoplanet = Exoplanet.find(params[:id])
  erb(:"exoplanets/edit")
end

post '/exoplanets/:id' do
  @exoplanet = Exoplanet.new(params)
  @exoplanet.update
  redirect to "/exoplanets/#{@exoplanet.id}"
end

post '/exoplanets/:id/delete' do
  @exoplanets = Exoplanet.find(params[:id])
  @exoplanets.delete()

    redirect to '/exoplanets'
end