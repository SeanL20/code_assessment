require 'spec_helper'
require_relative '../lib/model/price_list'

RSpec.describe "integration" do
  describe PriceList do
    subject(:price_lists) do
      PriceList.new
    end

    # checks if prices list is a class of PriceList when initialized.
    it "price list has been initailized" do
      expect(price_lists).to be_a PriceList
    end

    # checks if prices list prices is an empty array if there is no data inputted.
    it "price list prices is an empty array" do
      expect(price_lists.prices).to eq []
    end
  end

end
