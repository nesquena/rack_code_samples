# rackup basic_6/config.ru -p 3000

require 'basic_6/my_app'
require 'basic_6/simple_middleware'
use Rack::ShowExceptions
use Rack::Reloader
use SimpleMiddleware
run MyApp.new