module Joey
  class Comment < Model
    define_properties :id, :message, :created_time, :count
    #creation_properties :message
    hash_populating_accessor :from, "User","Page"

    def validate
      created_time.to_time rescue errors << { :message => 'created_time is not compatible' }
      # updated_time.to_time rescue errors << { :message => 'updated_time is not compatible' }
      errors << { :message => 'id should not be nil' } if id.nil?
      errors << { :message => 'from is not a Joey::User or Joey::Page' } unless from.is_a?(Joey::User) || from.is_a?(Joey::Page)
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
