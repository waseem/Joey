module Joey
  class Work < Model
    
    define_properties :start_date, :end_date, :description
    
    hash_populating_accessor :employer, "Page"
    hash_populating_accessor :location, "Page"
    hash_populating_accessor :position, "Page"

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
