module Simpleton
  class Responder
    attr_reader :request, :params

    # body_block is the response body to return for a given path
    def initialize(request)
      @request = request
      @response = Rack::Response.new
    end

    def params
      request.params
    end

    def render(body_block)
      @response.status = 404 if body_block.nil?
      body_block ||= lambda { self.render_haml_template('404') }
      body_text = self.instance_eval(&body_block)
      @response.write(body_text)
      @response.finish
    end

    def respond_with(options={})
      template_path = File.join("basic_8", "views", "#{options[:path]}.haml")
      render_haml_template(template_path)
    end

    def render_haml_template(template_path, status_code=200)
      return render_haml_template("basic_8/views/404.haml", 404) unless File.exist?(template_path)
      haml_text = File.open(template_path).read
      haml_engine = Haml::Engine.new(haml_text)
      haml_engine.render
    end
  end
end
