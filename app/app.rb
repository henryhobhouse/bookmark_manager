ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/model_controller.rb'

# Controller for  bookmark app
class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:current_user_id])
    end
  end

  get '/' do
    erb :sign_up
  end

  get '/sign-in' do
    erb :sign_in
  end

  get '/links' do
    @links = Link.all
    @tags = Tag.all
    current_user
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

  post '/user' do
    user = User.create(user_email: params[:email], password: params[:password])
    session[:current_user_id] = user.id
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
