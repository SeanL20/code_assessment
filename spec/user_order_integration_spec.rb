require 'spec_helper'
require_relative '../lib/model/users'

RSpec.describe "integration" do
  let(:users_json) {
    <<-JSON
      [
        { "user": "coach" },
        { "user": "ellis" },
        { "user": "rochelle" },
        { "user": "zoey" }
      ]
    JSON
  }

  describe UserOrder do
    subject(:users) do
      users = Users.new

      users_json_array = JSON.parse(users_json)

      users_json_array.each do |user|
        # create class instance for each users.
        UserOrder.new(user_name: user["user"], users: users)
      end

      return users
    end

    # checks if users class users attribute is an instance of the UserOrder class.
    it "users has been initailized" do
      expect(users.users[0]).to be_a UserOrder
      expect(users.users[1]).to be_a UserOrder
      expect(users.users[2]).to be_a UserOrder
      expect(users.users[3]).to be_a UserOrder
    end

    # checks if users class users attribute has user names.
    it "has users user name" do
      expect(users.users[0].user_name).to eq "coach"
      expect(users.users[1].user_name).to eq "ellis"
      expect(users.users[2].user_name).to eq "rochelle"
      expect(users.users[3].user_name).to eq "zoey"
    end

    # checks if users class users attribute has drinks and it is an empty array.
    it "has users drinks is empty" do
      expect(users.users[0].drinks).to eq []
      expect(users.users[1].drinks).to eq []
      expect(users.users[2].drinks).to eq []
      expect(users.users[3].drinks).to eq []
    end

    # checks if users class users attribute has total price and it is 0.0.
    it "has users total price is 0.0" do
      expect(users.users[0].total_price).to eq 0.0
      expect(users.users[1].total_price).to eq 0.0
      expect(users.users[2].total_price).to eq 0.0
      expect(users.users[3].total_price).to eq 0.0
    end

    # checks if users class users attribute has payment total and it is 0.0.
    it "has users payment total is 0.0" do
      expect(users.users[0].payment_total).to eq 0.0
      expect(users.users[1].payment_total).to eq 0.0
      expect(users.users[2].payment_total).to eq 0.0
      expect(users.users[3].payment_total).to eq 0.0
    end

    # checks if users class users attribute has balance and it is 0.0.
    it "has users balance is 0.0" do
      expect(users.users[0].balance).to eq 0.0
      expect(users.users[1].balance).to eq 0.0
      expect(users.users[2].balance).to eq 0.0
      expect(users.users[3].balance).to eq 0.0
    end

    # checks if users class find users returns an instance of Userorder class.
    it "has users find user is an instance of UserOrder class" do
      expect(users.find_user(user_name: "coach")).to be_a UserOrder
    end

    # checks if users class find users of an non existance user returns an empty array.
    it "has users find user is an instance of UserOrder class" do
      expect(users.find_user(user_name: "nick")).to eq []
    end

    # checks if users class find users has a user name.
    it "has users find user has the user name" do
      expect(users.find_user(user_name: "coach").user_name).to eq "coach"
    end

    # checks if users class find users has drinks and it is an empty array.
    it "has users find user has the drinks" do
      expect(users.find_user(user_name: "coach").drinks).to eq []
    end

    # checks if users class find users has a total price.
    it "has users find user has the total price" do
      expect(users.find_user(user_name: "coach").total_price).to eq 0.0
    end

    # checks if users class find users has a payment total.
    it "has users find user has the payment total" do
      expect(users.find_user(user_name: "coach").payment_total).to eq 0.0
    end

    # checks if users class find users has a balance.
    it "has users find user has the balance" do
      expect(users.find_user(user_name: "coach").balance).to eq 0.0
    end
  end

end
