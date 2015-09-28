module SafeFinder
  class ClassWrapper
    attr_reader :wrapped_class

    def initialize(target_class)
      @wrapped_class = target_class
    end

    def method_missing(name, *arguments, &block)
      result = wrapped_class.send(name, *arguments, &block)
      result.nil? ? wrapped_class.null_object : result
    rescue ActiveRecord::RecordNotFound => e
      wrapped_class.null_object
    end
  end
end
