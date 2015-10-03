require "rails/generators"

module SafeFinder
  class ModelGenerator < Rails::Generators::Base
    def self.source_root
      File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
    end

    def create_model
      template "models/null_object.rb"
      File.join("app/models", "safe_finder", "null_object.rb")
    end
  end
end
