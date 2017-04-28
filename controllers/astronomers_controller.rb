require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/astronomer.rb')
require('pry-byebug')

get '/astronomers' do
  @astronomer = Astronomer.all()
  erb(:"astronomers/index")
end

get '/astronomers/new' do
  erb(:"astronomers/new")
end

get '/astronomers/:id' do
  @astronomer = Astronomer.find(params[:id].to_i)
  erb(:"astronomers/show")
end

post '/astronomers' do
  @astronomer = Astronomer.new(params)
  @astronomer.save
  erb(:"astronomers/create")
end

get '/astronomers/:id/edit' do
  @astronomer = Astronomer.find(params[:id])
  erb(:"astronomers/edit")
end

post '/astronomers/:id' do
  @astronomer = Astronomer.new(params)
  @astronomer.update
  redirect to "/astronomers/#{@astronomer.id}"
end

post '/astronomers/:id/delete' do
  @astronomer = Astronomer.find(params[:id])
  @astronomer.delete
    redirect to '/astronomers'
end