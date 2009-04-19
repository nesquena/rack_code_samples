# rackup basic_2/config.ru -p 3000

require 'basic_2/my_app'
use Rack::ContentLength
run MyApp.new