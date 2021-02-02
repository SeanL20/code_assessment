require_relative "prices"

class PriceList
	attr_accessor :prices
	
	def initialize
		@prices = []
	end
end