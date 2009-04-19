require 'haml'
require File.dirname(__FILE__) + '/application'

module Simpleton
  class Builder
    def self.application(file_name)
      raise "The application file '#{file_name}' does not exist!" unless File.exist?(file_name)
      app_code = File.open(file_name).read
      eval("Simpleton::Application.new { #{app_code} }")
    end
  end
end
