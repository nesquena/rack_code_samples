class SimpleMiddleware
  def initialize(app)
    @app = app
  end
  
  def call(env)
    status, headers, response = @app.call(env)
    content_length = headers.delete('Content-Length')
    updated_body = response.body.to_s.gsub(/Basic 6/, 'Basic 6 (wrapped in SimpleMiddleware)')
    Rack::Response.new(updated_body, status, headers).finish
  end
end