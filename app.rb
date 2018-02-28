require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**.*.rb')
require('./lib/customer')
require('./lib/product')
require('./lib/purchase')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'point_of_sale'})

get('/') do
  @products = Product.all
  # @customers = Customer.all
  # @purchases = Purchase.all
  erb(:home)
end

get('/admin') do
  @products = Product.all
  erb(:admin)
end

post('/') do
  product_name = params.fetch("product")
  product_price = params.fetch("price").to_i
  @products = Product.create({:name => product_name, :price => product_price})
  @products = Product.all
  erb(:home)
end

get('/product_add') do
  @products = Product.all
  erb(:home)
end

get '/products/:id' do
  @products = Product.find(params.fetch("id").to_i())
  erb(:product)
end

get '/purchase_page/:id' do
  @purchase = Purchase.all
  @products = Product.find(params.fetch("id").to_i())
  erb(:purchase_page)
end

post '/purchase_page/:id' do
  customer_name = params.fetch("name")
  customer_age = params.fetch("age").to_i
  purchase_method = params.fetch("payment")
  @customer = Customer.create({:name => customer_name, :age => customer_age})
  @products = Product.find(params.fetch("id").to_i())
  @one_purchase = Purchase.create({:payment => purchase_method, :product_id => @products.id, :customer_id => @customer.id})
  @customer_specific = Customer.where(id: @one_purchase.customer_id).first
  @product_specific = Product.where(id: @one_purchase.product_id).first
  erb(:success_page)
end

delete '/product_delete/:id' do
  @products = Product.find(params.fetch("id").to_i())
  @products.delete()
  @products = Product.all()
  erb(:admin)
end
