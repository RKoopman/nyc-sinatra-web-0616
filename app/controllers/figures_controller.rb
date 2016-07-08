class FiguresController < ApplicationController

  # new /gets the new form
  get '/figures/new' do
    erb :'figures/new'
  end

  # create /posts filled in form to index
  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
    @figure.titles << @title
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  # show /show a particular entry
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  # index / show all entries
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  # edit / find an entry
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    redirect "/figures/#{figure.id}"
  end
end