module Joey
  class EducationHistory < Model
    define_properties :name, :degree, :year, :school_type, :concentrations

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
