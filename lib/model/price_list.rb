require_relative "prices"

class PriceList
	attr_accessor :prices
	
	# initialize price list class to contain multiple user price class.
	def initialize
		@prices = []
	end

	# search the prices class with the drink name and size. 
	def find_by_name_size(drink_name:, size:)
		prices.each do |price|
			return price if price.drink_name == drink_name && price.size == size
		end
		return []
	end
end
