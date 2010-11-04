module Joey
  class Property < Model
    define_properties :name, :text, :href

    def validate
      errors = []
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
