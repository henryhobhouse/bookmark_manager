require 'sinatra/base'
require_relative 'models/link_model.rb'
require 'pry'

# Controller for bookmark app
class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end

  run! if app_file == $PROGRAM_NAME
end
