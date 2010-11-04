module Joey
  class Location < Model
    define_properties :name, :zip, :country, :id, :state, :city

    def validate
      valid = true
      errors << { :message => "country should be string but is #{country.inspect}" } unless country.is_a?(String)
      errors << { :message => "city should be string but is #{city.inspect}" } unless city.is_a?(String)
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
