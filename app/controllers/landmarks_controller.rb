class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

 get '/landmarks/new' do
   erb :'landmarks/new'
 end

 get '/landmarks/:id' do
   @landmark = Landmark.find(params[:id])
   erb :'landmarks/show'
end

get '/landmarks/:id/edit' do
  @landmark = Landmark.find(params[:id])
  erb :'landmarks/edit'
end

  post '/landmarks' do
    @landmark = Landmark.create(name: params[:landmark][:name])
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save
    redirect ("/landmarks/#{@landmark.id}")
  end

  post '/landmarks/:id' do
    if !params[:landmark][:name].empty?
    @landmark = Landmark.update(params[:id], name: params[:landmark][:name])
    end
    if !params[:landmark][:year_completed].empty?
    @landmark = Landmark.update(params[:id], year_completed: params[:landmark][:year_completed])
    end
    @landmark.save
    redirect
     ("/landmarks/#{@landmark.id}")
  end


end
