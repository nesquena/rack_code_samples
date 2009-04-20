require 'rubygems'
require 'rack'

class MyApp2
  def call(env)
    [200, {"Content-Type" => "text/html"}, "Hello from Rack Basic 1 (B)!"]
  end
end

builder = Rack::Builder.new { 
  # rackup contents are in here
  use Rack::ShowExceptions
  run MyApp2.new
}

Rack::Handler::Mongrel.run builder, :Port => 3000
