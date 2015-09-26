require "safe_finder/null_object_generator"
require "safe_finder/null_object"
require "safe_finder/version"

module SafeFinder
  def safe_attribute(key, value)
    @null_object_attributes = {} if @null_object_attributes.nil?
    @null_object_attributes[key.to_sym] = value
  end

  def null_object_attributes
    @null_object_attributes
  end
end
