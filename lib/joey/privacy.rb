module Joey
  class Privacy < Model
    define_properties :value, :description, :allow, :friends, :deny

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
