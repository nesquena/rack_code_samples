require 'haml'

class BaseController
  @@route_hash = { :get => { }, :post => { }}
  
  def self.get(path, &block) 
    @@route_hash[:get][path] = block.call 
  end
  
  def self.post(path, &block) 
    @@route_hash[:post][path] = block.call 
  end
  
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    verb_symbol = request.request_method.downcase.to_sym
    path, body = @@route_hash[verb_symbol].find { |path, body| /^#{path}$/ =~ request.path_info  }
    response.status = 404 if body.nil?
    body ||= self.class.render_haml_template('404')
    response.write(body)
    response.finish
  end
  
  def self.respond_with(options={})
    template_path = File.join("basic_8", "views", "#{options[:path]}.haml")
    render_haml_template(template_path)
  end
  
  def self.render_haml_template(template_path, status_code=200)
    return render_haml_template("basic_8/views/404.haml", 404) unless File.exist?(template_path)
    haml_text = File.open(template_path).read
    haml_engine = Haml::Engine.new(haml_text)
    haml_engine.render
  end
end