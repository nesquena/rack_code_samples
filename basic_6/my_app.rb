class MyApp
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.write("<h1>Response from Basic 6</h1>")
    case request.path_info
      when "/" then response.write('Path is on root')
      when "/banana" then response.write('I want a banana')
      else response.write("Path is #{request.path_info}")
    end
    response.finish
  end
end

# Rack::Handler::Mongrel.run MyApp.new, :Port => 3000
