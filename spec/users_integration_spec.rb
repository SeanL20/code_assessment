require 'spec_helper'
require_relative '../lib/model/users'

RSpec.describe "integration" do
  describe Users do
    subject(:users) do
      Users.new
    end

    # checks if users is a class of Users when initialized.
    it "users has been initailized" do
      expect(users).to be_a Users
    end

    # checks if users class users attribute is an empty array if there is no data inputted.
    it "users class users attribute is an empty array" do
      expect(users.users).to eq []
    end
  end

end
