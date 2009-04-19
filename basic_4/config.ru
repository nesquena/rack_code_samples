# rackup basic_4/config.ru -p 3000

require 'basic_4/my_app'
use Rack::ShowExceptions
use Rack::Reloader
run MyApp.new