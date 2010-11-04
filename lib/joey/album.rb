module Joey
  class Album < Model
    
    define_properties :id, :name, :description, :link, :count, :created_time, :updated_time, :privacy, :location, :type
    #creation_properties :name, :message
    
    hash_populating_accessor :from, "User", "Page"
    hash_populating_association :comments, "Comment"
    # hash_populating_accessor :photos, "Photo"
    # has_association :photos, "Photo"
    hash_populating_association :photos, "Photo"
    
    def validate
      created_time.to_time rescue errors << { :message => 'created_time is not compatible' }
      updated_time.to_time rescue errors << { :message => 'updated_time is not compatible' }
      errors << { :message => 'id should not be nil' } if id.nil?
      errors << { :message => "name is neither string nor nil but is #{name.inspect}" } unless name.is_a?(String) || name.nil?
      errors << { :message => "description is neither string nor nil but is #{description.inspect}" } unless description.is_a?(String) || description.nil?
      errors << { :message => "link is not a string but is #{link.inspect}" } unless link.is_a?(String)
      errors << { :message => "count is neither integer nor nil but is #{count.inspect}" } unless count.is_a?(Integer) || count.nil?
      errors << { :message => "location is neither string nor nil but is #{location.inspect}" } unless location.is_a?(String) || location.nil?
      errors << { :message => "from is not a Joey::User or Joey::Page and is #{from.inspect}" } unless from.is_a?(Joey::User) || from.is_a?(Joey::Page)

      errors << { :message => "comments is not an array nor nil and is #{comments.inspect}" } unless comments.is_a?(Array) || comments.nil?
      if comments.is_a?(Array) && !(comments.collect(&:class).uniq - [Joey::Comment]).empty?
        errors << { :message => 'comments is not an array of Joey::Comment' }
      end

      errors << { :message => "photos is not an array nor nil and is #{photos.inspect}" } unless photos.is_a?(Array) || photos.nil?
      if photos.is_a?(Array) && !(photos.collect(&:class).uniq - [Joey::Photo]).empty?
        errors << { :message => 'photos is not an array of Joey::Comment' }
      end
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
