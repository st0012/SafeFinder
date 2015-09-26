module SafeFinder
  class ClassWrapper
    attr_reader :safely, :wrapped_class

    def initialize(target_class, safely = false)
      @wrapped_class = target_class
      @safely = safely
    end

    def find(id)
      wrapped_class.find(id)
    rescue ActiveRecord::RecordNotFound => e
      if safely
        wrapped_class.null_object
      else
        raise e
      end
    end
  end

  module FinderMethods
    def safely
      ClassWrapper.new(self, true)
    end
  end
end
