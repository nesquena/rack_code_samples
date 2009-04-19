# rackup basic_7/config.ru -p 3000

require 'basic_7/my_base_app'
require 'basic_7/my_app'
use Rack::ShowExceptions
use Rack::Reloader
run MyApp.new