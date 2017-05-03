require 'data_mapper'
require 'dm-postgres-adapter'

# Model for data_mapper database connection
class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String
end

DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')

DataMapper.finalize

DataMapper.auto_upgrade!
