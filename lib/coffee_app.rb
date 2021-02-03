# Put your code here!
require_relative 'model/price_list'
require_relative 'model/users'

CoffeeApp = -> (prices_json, orders_json, payments_json){
	price_list = load_prices(prices_json)
	load_orders(orders_json)
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

def load_orders(orders_json)
	users = Users.new

	orders = JSON.parse(orders_json)

	orders.each do |order|
		puts "TEST"
		puts order
		puts "TEST"
	end
	
end
