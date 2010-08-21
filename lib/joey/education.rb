module Joey
  class Education < Model
    
    define_properties :start_date, :end_date, :degree
    
    hash_populating_accessor :school, "Page"
    hash_populating_accessor :year, "Page"
    hash_populating_accessor :concentration, "Page"

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
