# rackup basic_6/config.ru -p 3000

require 'basic_6/my_app'
use Rack::ShowExceptions
use Rack::Reloader
run MyApp.new