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

  erb(:home)
end

get('/output') do
  erb(:output)
end
