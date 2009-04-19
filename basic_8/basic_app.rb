get '/banana' do
  respond_with :path => 'banana'
end

get '/foo' do
  "HEY: #{params.inspect}"
end

get '/carrot' do
  respond_with :path => 'carrot'
end

get '/lovel(i|y)' do
  respond_with :path => 'lovely'
end

get '/ball' do
  "This is a ball"
end
