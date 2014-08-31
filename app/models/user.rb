class User < ActiveRecord::Base
	has_secure_password

	validates :name, prescence: true
end
