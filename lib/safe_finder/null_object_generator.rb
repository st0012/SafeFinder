module SafeFinder
  class NullObjectGenerator
    attr_reader :original_class, :original_class_name

    def initialize(original_class)
      @original_class = original_class
      @original_class_name = original_class.to_s
    end

    def generate
      null_class.new
    end

    def null_class
      @null_class ||= Object.const_set("Null#{original_class_name}", Class.new(NullObject))
    end

    def set_columns
    end
  end
end
