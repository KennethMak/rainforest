class User < ActiveRecord::Base
	has_secure_password
	
	has_many :products, through: :reviews
	has_many :reviews


	validates :name, presence: true
end
