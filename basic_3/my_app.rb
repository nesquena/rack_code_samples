class MyApp
  def call(env)
    # http://rack.rubyforge.org/doc/classes/Rack/Response.html
    Rack::Response.new { |response| 
      response['Content-Type'] = 'text/html'
      response.write("Hello from Basic 3 (A)")
    }.finish
  end
end

# Rack::Handler::Mongrel.run MyApp.new, :Port => 3000