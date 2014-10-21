class User < ActiveRecord::Base
  has_secure_password
  before_save :format_email!

  def format_email!
    email.downcase!
  end
end
