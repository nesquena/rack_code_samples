class MyApp
  def call(env)
    # http://rack.rubyforge.org/doc/classes/Rack/Request.html
    request = Rack::Request.new(env)
    # http://rack.rubyforge.org/doc/classes/Rack/Response.html
    Rack::Response.new { |response| 
      response.write("<h1>Request Object from Basic 4</h1>")
      response.write("<b>URL:</b> #{request.url}")
      response.write("<br/><b>Path Info:</b> #{request.path_info}")
      response.write("<br/><b>Request Method:</b> #{request.request_method}")
      response.write("<br/><b>Params:</b> #{request.params.inspect}")
    }.finish
  end
end

# Rack::Handler::Mongrel.run MyApp.new, :Port => 3000