module Joey
  class Property < Model
    define_properties :name, :text, :href

    def validate
      errors = []
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
