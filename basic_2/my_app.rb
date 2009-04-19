class MyApp
  def call(env)
    [200, { "Content-Type" => "text/html" }, "Hello from Basic 2"]
  end
end

# Rack::Handler::Mongrel.run MyApp.new, :Port => 3000
