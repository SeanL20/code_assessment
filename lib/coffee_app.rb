# Put your code here!
require_relative 'model/price_list'
require_relative 'model/users'

CoffeeApp = -> (prices_json, orders_json, payments_json){
	price_list = load_prices(prices_json)
	user_orders = load_orders(orders_json)
	calculate_total_price(user_orders.users, price_list)
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
		user = get_user(order["user"], users)

		OrderDrinks.new(drink_name: order["drink"], size: order["size"], user_order: user)
	end

	return users
end

def get_user(user_name, users)
	user_check = users.find_user(user_name: user_name)

	if user_check.empty?
		user = UserOrder.new(user_name: user_name, users: users)
	else
		user = users.find_user(user_name: user_name)
	end

	return user
end

def calculate_total_price(user_orders, price_list)
	user_orders.each do |user_order|
		total_price = get_total(user_order.drinks, price_list)
		user_order.total_price = total_price
	end
end

def get_total(drinks, price_list)
	total_price = 0
	drinks.each do |drink|
		drink_price = price_list.find_by_name_size(drink_name: drink.drink_name, size: drink.size)

		total_price = total_price + drink_price.price
	end

	return total_price
end