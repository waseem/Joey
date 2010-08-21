module Joey
  class Tag < Model
    define_properties :id, :name, :x, :y, :created_time

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
