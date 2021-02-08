require 'spec_helper'
require_relative '../lib/model/users'

RSpec.describe "integration" do
  let(:orders_json) {
    <<-JSON
      [
        { "user": "coach", "drink": "long black", "size": "medium" },
        { "user": "ellis", "drink": "long black", "size": "small" },
        { "user": "rochelle", "drink": "flat white", "size": "large" },
        { "user": "coach", "drink": "flat white", "size": "large" },
        { "user": "zoey", "drink": "long black", "size": "medium" },
        { "user": "zoey", "drink": "short espresso", "size": "small" }
      ]
    JSON
  }

  describe OrderDrinks do
    subject(:users) do
      users = Users.new

      orders = JSON.parse(orders_json)

      orders.each do |order|
        user_check = users.find_user(user_name: order["user"])

        if user_check.empty?
          user = UserOrder.new(user_name: order["user"], users: users)
        else
          user = users.find_user(user_name: order["user"])
        end
        OrderDrinks.new(drink_name: order["drink"], size: order["size"], user_order: user)
      end

      return users
    end

    # checks if users class users attribute drinks attribute is an instance of the OrderDrinks class.
    it "order drinks has been initailized" do
      expect(users.users[0].drinks[0]).to be_a OrderDrinks
      expect(users.users[1].drinks[0]).to be_a OrderDrinks
      expect(users.users[2].drinks[0]).to be_a OrderDrinks
      expect(users.users[3].drinks[0]).to be_a OrderDrinks
    end

    # checks if users class users attribute drinks attribute has user names.
    it "has users drinks drink names" do
      expect(users.users[0].drinks[0].drink_name).to eq "long black"
      expect(users.users[0].drinks[1].drink_name).to eq "flat white"
      expect(users.users[1].drinks[0].drink_name).to eq "long black"
      expect(users.users[2].drinks[0].drink_name).to eq "flat white"
      expect(users.users[3].drinks[0].drink_name).to eq "long black"
      expect(users.users[3].drinks[1].drink_name).to eq "short espresso"
    end

    # checks if users class users attribute drinks attribute has size.
    it "has users drinks size" do
      expect(users.users[0].drinks[0].size).to eq "medium"
      expect(users.users[0].drinks[1].size).to eq "large"
      expect(users.users[1].drinks[0].size).to eq "small"
      expect(users.users[2].drinks[0].size).to eq "large"
      expect(users.users[3].drinks[0].size).to eq "medium"
      expect(users.users[3].drinks[1].size).to eq "small"
    end
  end

end
