module Joey
  class Television < Model
    define_properties :name, :category, :id
    
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
