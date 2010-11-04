module Joey
  class Affiliation < Model
    define_properties :type, :year, :name, :nid, :status

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
