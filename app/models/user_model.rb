require 'bcrypt'

# Model user log-in details
class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :user_email, String
  property :password_hash, Text

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end
end
