class MyApp < MyBaseApp
  def call(env)
    request = Rack::Request.new(env)
    respond :path => request.path_info
  end
end

# Rack::Handler::Mongrel.run MyApp.new, :Port => 3000
