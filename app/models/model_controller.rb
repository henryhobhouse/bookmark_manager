require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './link_model.rb'
require_relative './tag_model.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
                  "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
