require_relative "user_order"

class Users
	attr_accessor :users
	
	def initialize
		@users = []
	end

	def find_user(user_name:)
		users.each do |user|
			return user if user.user_name == user_name
		end
		return []
	end

end