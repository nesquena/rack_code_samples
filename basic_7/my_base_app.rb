require 'haml'

class MyBaseApp
  # respond :path => 'banana'
  def respond(options={})
    response = Rack::Response.new
    template_path = File.join("basic_7", "views", "#{options[:path]}.haml")
    status_code, haml_text = render_haml_template(template_path)
    response.status = status_code
    response.write(haml_text)
    response.finish
  end
  
  def render_haml_template(template_path, status_code=200)
    return render_haml_template("basic_7/views/404.haml", 404) unless File.exist?(template_path)
    haml_text = File.open(template_path).read
    haml_engine = Haml::Engine.new(haml_text)
    html_text = haml_engine.render
    [status_code, html_text]
  end
end