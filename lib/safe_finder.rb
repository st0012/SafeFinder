require "safe_finder/null_object_generator"
require "safe_finder/null_object"
require "safe_finder/finder"
require "safe_finder/version"

module SafeFinder

  def self.included(base)
    base.extend(ClassMethods)
    base.singleton_class.class_eval do
      attr_accessor :null_object_attributes, :null_object_methods
    end
    base.class_eval do
      self.null_object_attributes = {}
      self.null_object_methods = {}
    end
  end

  module ClassMethods
    def null_object
      @null_object ||= SafeFinder::NullObjectGenerator.new(self).generate
    end

    def safe_attribute(key, value)
      null_object_attributes[key.to_sym] = value
    end

    def safe_method(method_name, &block)
      null_object_methods[method_name.to_sym] = block
    end
  end
end
