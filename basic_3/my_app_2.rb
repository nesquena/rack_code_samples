class MyApp2
  def call(env)
    # http://rack.rubyforge.org/doc/classes/Rack/Response.html
    response = Rack::Response.new
    response.write("Hello from Basic 3 (B)")
    response.finish
  end
end

# Rack::Handler::Mongrel.run MyApp2.new, :Port => 3000