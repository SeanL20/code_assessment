require_relative "prices"

class PriceList
	attr_accessor :prices
	
	def initialize
		@prices = []
	end

	def find_by_name_size(drink_name:, size:)
		prices.each do |price|
			return price if price.drink_name == drink_name && price.size == size
		end
		return []
	end
end
