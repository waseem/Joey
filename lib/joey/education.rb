module Joey
  class Education < Model
    
    define_properties :start_date, :end_date, :degree, :type
    
    hash_populating_accessor :school, "Page"
    hash_populating_accessor :year, "Page"
    hash_populating_accessor :concentration, "Page"

    def validate
      valid = true
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
