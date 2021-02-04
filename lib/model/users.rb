require_relative "user_order"

class Users
	attr_accessor :users
	
	# initialize user class to contain multiple user order class.
	def initialize
		@users = []
	end

	# search the user order class with the user name. 
	def find_user(user_name:)
		users.each do |user|
			return user if user.user_name == user_name
		end
		return []
	end

end