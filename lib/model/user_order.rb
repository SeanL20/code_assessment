require_relative "order_drinks"

class UserOrder
	attr_accessor :user_name, :drinks, :total_price, :payment_total, :balance
  attr_reader :users
	
	# initialize user class to contain user name, total price, payment_total and balance as well as the call back for the user class and hold multiple order drinks class.
	def initialize(user_name:, users:, total_price: nil, payment_total: nil, balance:nil)
		@user_name = user_name
		@drinks = []
		@users = users
		@total_price = total_price
		@payment_total = payment_total
		@balance = balance

		@users.users << self
	end

	# check if there is a user order class and returns false if there is an user order class.
	def empty?
		return false if self
	end
end