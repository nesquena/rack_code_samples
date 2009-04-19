class MyApp3
  def call(env)
    # http://rack.rubyforge.org/doc/classes/Rack/Response.html
    Rack::Response.new("Hello from Basic 3 (C)").finish
  end
end

# Rack::Handler::Mongrel.run MyApp3.new, :Port => 3000