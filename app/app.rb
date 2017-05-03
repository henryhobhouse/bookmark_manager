require 'sinatra/base'
require_relative 'models/link'
require 'pry'

class Bookmark_manager < Sinatra::Base

  get '/link' do
    @links = Link.all
    erb :links
  end

  run! if app_file == $0
end
