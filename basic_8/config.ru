# rackup basic_8/config.ru -p 3000

require 'basic_8/lib/simpleton/builder'

use Rack::ShowExceptions
use Rack::Reloader
run Simpleton::Builder.application('basic_8/basic_app.rb')