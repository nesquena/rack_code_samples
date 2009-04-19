# rackup basic_8/config.ru -p 3000

require 'basic_8/my_app'
use Rack::ShowExceptions
use Rack::Reloader
run MyApp.new