class User < ActiveRecord::Base
  has_many :boats
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password, on: :create

  def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

end
