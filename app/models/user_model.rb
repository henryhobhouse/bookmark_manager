require 'bcrypt'


# Model user log-in details
class User
  include DataMapper::Resource
  include BCrypt
  attr_reader :password
  attr_accessor :password_confirmation



  property :id, Serial
  property :email, String
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
