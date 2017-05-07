ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/model_controller.rb'

# Controller for bookmark app
class BookmarkManager < Sinatra::Base
  get '/' do
    erb :sign_up
  end

  get '/sign-in' do
    erb :sign_in
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    erb :links
  end

  post '/links' do
    link = Link.first_or_create(url: params[:url].downcase,
                                title: params[:title])
    tags = params[:tag].downcase.split(/\s*,\s*/)
    tags.each { |tag| link.tags << Tag.first_or_create(tag_name: tag) }
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end

  get '/tag/:name' do
    page_tag = Tag.first(tag_name: params[:name])
    @tag_links = page_tag.links
    erb :tag_links
  end

  run! if app_file == $PROGRAM_NAME
end
