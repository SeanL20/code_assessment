# Put your code here!
require_relative 'lib/model/price_list'

CoffeeApp = -> (prices_json, orders_json, payments_json){
	# order_calculations(prices_json, orders_json)
	load_prices(prices_json)
}

def load_prices(prices_json)
	price_list = PriceList.new
end


# def order_calculations(prices_json, orders_json)
# 	order_prices = []

# 	orders_json.each do |order|
# 		puts order
# 	end
# end