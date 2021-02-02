require_relative "order_drinks"

class UserOrder
	attr_accessor :user_name, :drinks
  attr_reader :users
	
	def initialize(user_name:, users:)
		@user_name = user_name
		@drinks = []
		@users = users

		@users.users << self
	end
end