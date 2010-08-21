module Joey
  class Relative < Model
    define_properties :uid, :relationship, :name

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
