require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**.*.rb')
require('./lib/customer')
require('./lib/product')
require('./lib/purchase')
require('pry')
require('pg')

get('/') do
  @products = Product.all
  # @customers = Customer.all
  # @purchases = Purchase.all
  erb(:home)
end

post('/') do
  product_name = params.fetch("product")
  product_price = params.fetch("price").to_i
  @products = Product.create({:name => product_name, :price => product_price})
  @products = Product.all
  erb(:home)
end

get('/admin') do
  erb(:admin)
end

get('/product_add') do
  @products = Product.all
  erb(:home)
end

get '/product_purchase' do
  "Hello World"
end
