require 'rubygems'
require 'rack'

class MyApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, "Hello Rack from Basic 1 (A)!"]
  end
end

Rack::Handler::Mongrel.run MyApp.new, :Port => 3000