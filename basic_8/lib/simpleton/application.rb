require File.dirname(__FILE__) + '/responder'

module Simpleton
  class Application
    def initialize(&block)
      @route_hash = { :get => { }, :post => { }}
      self.instance_eval(&block)
      puts "Successfully loaded application with #{num_routes} routes"
    end

    def get(path, &block)
      @route_hash[:get][path] = block
    end

    def post(path, &block)
      @route_hash[:post][path] = block
    end

    def num_routes
      @route_hash[:get].keys.size + @route_hash[:post].keys.size
    end

    def call(env)
      request = Rack::Request.new(env)
      verb_symbol = request.request_method.downcase.to_sym
      path, body_block = @route_hash[verb_symbol].find { |path, body| /^#{path}$/ =~ request.path_info }
      Responder.new(request).render(body_block)
    end
  end
end
