ENV['RACK_ENV'] = 'test'

require("rspec")
require("pg")
require("sinatra/activerecord")
require("customer")
require("product")
require("purchase")

RSpec.configure do |config| # clear db between spec runs
  config.after(:each) do
    Customer.all.each do |customer|
      customer.destroy
    end
    Purchase.all.each do |purchase|
      purchase.destroy
    end
    Product.all.each do |product|
      product.destroy
    end
  end
end
