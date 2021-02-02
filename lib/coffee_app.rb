# Put your code here!
require_relative 'model/price_list'

CoffeeApp = -> (prices_json, orders_json, payments_json){
	# order_calculations(prices_json, orders_json)
	price_list = load_prices(prices_json)
}

def load_prices(prices_json)
	price_list = PriceList.new

	prices = JSON.parse(prices_json)

	prices.each do |price|
		price["prices"].each do |key, value|
			Prices.new(drink_name: price["drink_name"], size: key, price: value, price_list: price_list)
		end
	end

	return price_list
end


# def order_calculations(prices_json, orders_json)
# 	order_prices = []

# 	orders_json.each do |order|
# 		puts order
# 	end
# end