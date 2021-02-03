require_relative "order_drinks"

class UserOrder
	attr_accessor :user_name, :drinks, :total_price
  attr_reader :users
	
	def initialize(user_name:, users:, total_price: nil)
		@user_name = user_name
		@drinks = []
		@users = users
		@total_price = total_price

		@users.users << self
	end

	def empty?
		return false if self
	end
end