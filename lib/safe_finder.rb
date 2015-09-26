require "safe_finder/null_object_generator"
require "safe_finder/null_object"
require "safe_finder/version"

module SafeFinder

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def safe_attribute(key, value)
      @null_object_attributes = {} if @null_object_attributes.nil?
      @null_object_attributes[key.to_sym] = value
    end

    def safe_method(method_name, &block)
      @null_object_methods = {} if @null_object_methods.nil?
      @null_object_methods[method_name.to_sym] = block
    end

    def null_object_attributes
      @null_object_attributes
    end

    def null_object_methods
      @null_object_methods
    end
  end
end
