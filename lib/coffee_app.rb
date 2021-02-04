# Put your code here!
require_relative 'model/price_list'
require_relative 'model/users'

CoffeeApp = -> (prices_json, orders_json, payments_json){
	# loads the price into the price_list variable
	@price_list = load_prices(prices_json)
	# loads the price into the iser_orders variable
	@user_orders = load_orders(orders_json)
	# calculate the total price and store it in the user_order.
	calculate_total_price
	# loads and calculate the payment from payments_json.
	load_payment(payments_json)

	result_json = @user_orders.users.map { |uo| {
		user: uo.user_name,
		order_total: uo.total_price,
		payment_total: uo.payment_total,
		balance: 0,
	}}.to_json

	return result_json
}

def load_prices(prices_json)
	# initialize the prizelist.
	price_list = PriceList.new

	# parse the prices_json to json so that it could be used.
	prices = JSON.parse(prices_json)

	# goes through the price json so that it would be loaded into the prices class.
	prices.each do |price|
		price["prices"].each do |key, value|
			# create class instance for each drinks.
			Prices.new(drink_name: price["drink_name"], size: key, price: value, price_list: price_list)
		end
	end

	# returns the price list so that other functions can use it.
	return price_list
end

def load_orders(orders_json)
	# initialize the users 
	users = Users.new

	# parse the orders_json to json so that it could be used.
	orders = JSON.parse(orders_json)

	# goes through the orders json so that it would be loaded into the users class.
	orders.each do |order|
		# call the function to create a user class instance or retrieve existing class instance.
		user = get_user(order["user"], users)

		# create class instance for each drink order and add it to the user class.
		OrderDrinks.new(drink_name: order["drink"], size: order["size"], user_order: user)
	end

	# returns the users so that other functions can use it.
	return users
end

# function to create an user class or retrieve an existing class.
def get_user(user_name, users)
	# find for the user order class with the user name.
	user_check = users.find_user(user_name: user_name)

	# check if the user order class retrieved existed.
	if user_check.empty?
		# if the user order class does not exists then it would create a new user class. 
		user = UserOrder.new(user_name: user_name, users: users)
	else
		# if the user order class does exists then retrieve the user class.
		user = users.find_user(user_name: user_name)
	end

	# returns the user order class
	return user
end

# function for the calculation of the total price.
def calculate_total_price
	@user_orders.users.each do |user_order|
		# get the total price of the user order by calling the get total price by calculating each user order.
		total_price = get_total(user_order.drinks)
		# set the user's total price with the the total price calculated. 
		user_order.total_price = total_price
	end
end

def get_total(drinks)
	total_price = 0
	drinks.each do |drink|
		# retrieve the price of the drink by finding the drink name and size.
		drink_price = @price_list.find_by_name_size(drink_name: drink.drink_name, size: drink.size)
		# add the price of the drink retrieved to the total price.
		total_price = total_price + drink_price.price
	end

	# returns the total price.
	return total_price
end

def load_payment(payments_json)
	# parse the payments_json to json so that it could be used.
	payments = JSON.parse(payments_json)
	
	payments.each do |payment|
		# call the function to calculate the payment and puts it into the user order payment total attribute.
		calculate_payment_total(payment)
	end

end

def calculate_payment_total(payment)
	# retrieve user by finding the user from the user_name.
	user = @user_orders.find_user(user_name: payment["user"])

	# check if the user payment total is nil
	if user.payment_total.nil?
		# if the user payment total is nil then set it with payment["amount"]
		user.payment_total = payment["amount"].to_f
	else
		# if the user payment total is not nil then add the payment total with payment["amount"]
		user.payment_total = user.payment_total + payment["amount"].to_f
	end
end