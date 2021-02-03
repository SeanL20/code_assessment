class OrderDrinks
	attr_accessor :drink_name, :size
  attr_reader :user_order
	
	def initialize(drink_name:, size:, user_order:)
		@drink_name = drink_name
		@size = size
		@user_order = user_order

		@user_order.drinks << self
	end
end