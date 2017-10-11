module InstanceCounter
  module ClassMethods
    attr_accessor :count_of_instances
    
    def instances
      count_of_instances
    end
  end

  module InstancesMethods
    def register_instance
      self.class.count_of_instances += 1
    end
  end
end
