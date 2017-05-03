require 'sinatra/base'
require_relative 'models/link_model.rb'
require 'pry'


class Bookmark_manager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    title = params[:title]
    p "title = #{params[:title]}"
    url = params[:url]
    p "url = #{url}"
    Link.create(url: url, title: title)
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end
  

  run! if app_file == $0
end
