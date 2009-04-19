require 'basic_8/base_controller'

class MyApp < BaseController
  
  get '/banana' do
    respond_with :path => 'banana'
  end
  
  get '/carrot' do
    respond_with :path => 'carrot'
  end
  
  get '/lovel(i|y)' do
    respond_with :path => 'lovely'
  end

end

# Rack::Handler::Mongrel.run MyApp.new, :Port => 3000
