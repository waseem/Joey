module Joey
  class Tag < Model
    define_properties :id, :name, :x, :y, :created_time

    def validate
      created_time.to_time rescue errors << { :message => 'created_time is not compatible' }
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
