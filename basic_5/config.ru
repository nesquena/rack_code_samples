# rackup basic_5/config.ru -p 3000

require 'basic_5/my_app'
use Rack::ShowExceptions
use Rack::Reloader
run MyApp.new