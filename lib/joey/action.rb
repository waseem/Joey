module Joey
  class Action < Model
    define_properties :name, :link

    def validate
      errors << { :message => "name should String but is #{name.inspect}" } unless name.is_a?(String)
      errors << { :message => "link should String but is #{link.inspect}" } unless link.is_a?(String)
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
