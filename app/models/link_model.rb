require 'data_mapper'
require 'dm-postgres-adapter'

p 'This is actually happending!'
DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "postgres://henryhobhouse@localhost/bookmark_manager_test")

class Link

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end

DataMapper.finalize

DataMapper.auto_upgrade!
