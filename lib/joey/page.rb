module Joey
  class Page < Profile
        
    define_properties :id, :name, :category, :username
    
    # General
    define_properties :fan_count, :link, :picture, :has_added_app

    # Retail
    define_properties :founded, :products, :mission, :company_overview
    
    # Musicians
    define_properties :record_label, :hometown, :band_members, :genre
    
    def self.recognize?(hash)
      hash.has_key?("category")
    end
    
    def validate
      valid = true
      errors << { :message => 'id should not be nil' } if id.nil?
      errors << { :message => "name should be string but is #{name.inspect}" } unless name.is_a?(String)
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
