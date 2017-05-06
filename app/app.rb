ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/model_controller.rb'

# Controller for bookmark app
class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    temp_tag = Tag.create(tag_name: params[:tag])
    link = Link.create(url: params[:url], title: params[:title])
    LinkTag.create(link: link, tag: temp_tag)
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end

  run! if app_file == $PROGRAM_NAME
end
