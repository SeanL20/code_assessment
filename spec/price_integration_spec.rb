require 'spec_helper'
require_relative '../lib/model/price_list'

RSpec.describe "integration" do
  let(:prices_json) {
    <<-JSON
      [
        { "drink_name": "short espresso", "prices": { "small": 3.03 } },
        { "drink_name": "latte", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "flat white", "prices": { "small": 3.50, "medium": 4.00, "large": 4.50 } },
        { "drink_name": "long black", "prices": { "small": 3.25, "medium": 3.50 } },
        { "drink_name": "mocha", "prices": { "small": 4.00, "medium": 4.50, "large": 5.00 } },
        { "drink_name": "supermochacrapucaramelcream", "prices": { "large": 5.00, "huge": 5.50, "mega": 6.00, "ultra": 7.00 } }
      ]
    JSON
  }

  describe Price do
    subject(:price_lists) do
      price_list = PriceList.new

      prices = JSON.parse(prices_json)

      prices.each do |price|
        price["prices"].each do |key, value|
          # create class instance for each drinks.
          Prices.new(drink_name: price["drink_name"], size: key, price: value, price_list: price_list)
        end
      end

      return price_list
    end

    # checks if prices list prices is an instance of the Prices class.
    it "price list prices are an instances of Prices Class" do
      expect(price_lists.prices[0]).to be_a Prices
      expect(price_lists.prices[1]).to be_a Prices
      expect(price_lists.prices[2]).to be_a Prices
      expect(price_lists.prices[3]).to be_a Prices
      expect(price_lists.prices[4]).to be_a Prices
      expect(price_lists.prices[5]).to be_a Prices
      expect(price_lists.prices[6]).to be_a Prices
      expect(price_lists.prices[7]).to be_a Prices
      expect(price_lists.prices[8]).to be_a Prices
      expect(price_lists.prices[9]).to be_a Prices
      expect(price_lists.prices[10]).to be_a Prices
      expect(price_lists.prices[11]).to be_a Prices
      expect(price_lists.prices[12]).to be_a Prices
      expect(price_lists.prices[13]).to be_a Prices
      expect(price_lists.prices[14]).to be_a Prices
      expect(price_lists.prices[15]).to be_a Prices
    end

    # checks if prices list prices has drink names.
    it "has prices drink name" do
      expect(price_lists.prices[0].drink_name).to eq "short espresso"
      expect(price_lists.prices[1].drink_name).to eq "latte"
      expect(price_lists.prices[2].drink_name).to eq "latte"
      expect(price_lists.prices[3].drink_name).to eq "latte"
      expect(price_lists.prices[4].drink_name).to eq "flat white"
      expect(price_lists.prices[5].drink_name).to eq "flat white"
      expect(price_lists.prices[6].drink_name).to eq "flat white"
      expect(price_lists.prices[7].drink_name).to eq "long black"
      expect(price_lists.prices[8].drink_name).to eq "long black"
      expect(price_lists.prices[9].drink_name).to eq "mocha"
      expect(price_lists.prices[10].drink_name).to eq "mocha"
      expect(price_lists.prices[11].drink_name).to eq "mocha"
      expect(price_lists.prices[12].drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.prices[13].drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.prices[14].drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.prices[15].drink_name).to eq "supermochacrapucaramelcream"
    end

    # checks if prices list prices has drink size.
    it "has prices drink size" do
      expect(price_lists.prices[0].size).to eq "small"
      expect(price_lists.prices[1].size).to eq "small"
      expect(price_lists.prices[2].size).to eq "medium"
      expect(price_lists.prices[3].size).to eq "large"
      expect(price_lists.prices[4].size).to eq "small"
      expect(price_lists.prices[5].size).to eq "medium"
      expect(price_lists.prices[6].size).to eq "large"
      expect(price_lists.prices[7].size).to eq "small"
      expect(price_lists.prices[8].size).to eq "medium"
      expect(price_lists.prices[9].size).to eq "small"
      expect(price_lists.prices[10].size).to eq "medium"
      expect(price_lists.prices[11].size).to eq "large"
      expect(price_lists.prices[12].size).to eq "large"
      expect(price_lists.prices[13].size).to eq "huge"
      expect(price_lists.prices[14].size).to eq "mega"
      expect(price_lists.prices[15].size).to eq "ultra"
    end

    # checks if prices list prices has drink prices.
    it "has prices drink price" do
      expect(price_lists.prices[0].price).to eq 3.03
      expect(price_lists.prices[1].price).to eq 3.50
      expect(price_lists.prices[2].price).to eq 4.00
      expect(price_lists.prices[3].price).to eq 4.50
      expect(price_lists.prices[4].price).to eq 3.50
      expect(price_lists.prices[5].price).to eq 4.00
      expect(price_lists.prices[6].price).to eq 4.50
      expect(price_lists.prices[7].price).to eq 3.25
      expect(price_lists.prices[8].price).to eq 3.50
      expect(price_lists.prices[9].price).to eq 4.00
      expect(price_lists.prices[10].price).to eq 4.50
      expect(price_lists.prices[11].price).to eq 5.00
      expect(price_lists.prices[12].price).to eq 5.00
      expect(price_lists.prices[13].price).to eq 5.50
      expect(price_lists.prices[14].price).to eq 6.00
      expect(price_lists.prices[15].price).to eq 7.00
    end

    # checks if prices list find by name size returns a item that is an instance of Prices.
    it "price list find by name size are an instances of Prices Class" do
      expect(price_lists.find_by_name_size(drink_name: "short espresso", size: "small")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "small")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "medium")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "large")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "small")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "medium")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "large")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "small")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "medium")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "small")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "medium")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "large")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "large")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "huge")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "mega")).to be_a Prices
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "ultra")).to be_a Prices
    end

    # checks if prices list find by name size of an non existed item would return an empty array.
    it "price list find by name size of invalid item returns empty array" do
      expect(price_lists.find_by_name_size(drink_name: "short espresso", size: "large")).to eq []
    end

    # checks if prices list find by name size returns the correct items drink name.
    it "price list find by name size has prices drink name" do
      expect(price_lists.find_by_name_size(drink_name: "short espresso", size: "small").drink_name).to eq "short espresso"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "small").drink_name).to eq "latte"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "medium").drink_name).to eq "latte"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "large").drink_name).to eq "latte"
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "small").drink_name).to eq "flat white"
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "medium").drink_name).to eq "flat white"
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "large").drink_name).to eq "flat white"
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "small").drink_name).to eq "long black"
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "medium").drink_name).to eq "long black"
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "small").drink_name).to eq "mocha"
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "medium").drink_name).to eq "mocha"
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "large").drink_name).to eq "mocha"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "large").drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "huge").drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "mega").drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "ultra").drink_name).to eq "supermochacrapucaramelcream"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "ultra")).to eq []
    end

    # checks if prices list find by name size returns the correct items.
    it "price list find by name size has prices drink price" do
      expect(price_lists.find_by_name_size(drink_name: "short espresso", size: "small").size).to eq "small"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "small").size).to eq "small"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "medium").size).to eq "medium"
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "large").size).to eq "large"
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "small").size).to eq "small"
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "medium").size).to eq "medium"
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "large").size).to eq "large"
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "small").size).to eq "small"
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "medium").size).to eq "medium"
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "small").size).to eq "small"
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "medium").size).to eq "medium"
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "large").size).to eq "large"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "large").size).to eq "large"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "huge").size).to eq "huge"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "mega").size).to eq "mega"
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "ultra").size).to eq "ultra"
    end

    # checks if prices list find by name size returns the correct items.
    it "price list find by name size has prices drink price" do
      expect(price_lists.find_by_name_size(drink_name: "short espresso", size: "small").price).to eq 3.03
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "small").price).to eq 3.50
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "medium").price).to eq 4.00
      expect(price_lists.find_by_name_size(drink_name: "latte", size: "large").price).to eq 4.50
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "small").price).to eq 3.50
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "medium").price).to eq 4.00
      expect(price_lists.find_by_name_size(drink_name: "flat white", size: "large").price).to eq 4.50
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "small").price).to eq 3.25
      expect(price_lists.find_by_name_size(drink_name: "long black", size: "medium").price).to eq 3.50
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "small").price).to eq 4.00
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "medium").price).to eq 4.50
      expect(price_lists.find_by_name_size(drink_name: "mocha", size: "large").price).to eq 5.00
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "large").price).to eq 5.00
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "huge").price).to eq 5.50
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "mega").price).to eq 6.00
      expect(price_lists.find_by_name_size(drink_name: "supermochacrapucaramelcream", size: "ultra").price).to eq 7.00
    end
  end

end
