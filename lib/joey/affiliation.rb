module Joey
  class Affiliation < Model
    define_properties :type, :year, :name, :nid, :status

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
