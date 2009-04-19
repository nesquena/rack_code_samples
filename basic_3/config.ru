# rackup basic_3/config.ru -p 3000


use Rack::ShowExceptions
use Rack::Reloader

require 'basic_3/my_app'
map '/' do
  run MyApp.new
end
map '/a' do
  run MyApp.new
end

require 'basic_3/my_app_2'
map '/b' do
  run MyApp2.new
end

require 'basic_3/my_app_3'
map '/c' do
  run MyApp3.new
end