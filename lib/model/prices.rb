class Prices
	attr_accessor :drink_name, :size, :price
  attr_reader :price_list

	def initialize(drink_name:, size:, price:, price_list:)
		@drink_name = drink_name
		@size = size
		@price = price
		@prices_list = price_list

		@prices_list.prices << self
	end
end