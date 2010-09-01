module Joey
  class Photo < Model
    define_properties :id, :name, :picture, :source, :height, :width, :link, :icon,
      :created_time, :updated_time
    #creation_properties :message
    
    hash_populating_accessor :from, "User","Page"
    hash_populating_accessor :comments, "Comment"
    hash_populating_accessor :tags, "Tag"
    #has_association :comments, "Comment"

    def validate
      created_time.to_time rescue errors << { :message => 'created_time is not compatible' }
      updated_time.to_time rescue errors << { :message => 'updated_time is not compatible' }
      errors << { :message => 'id should not be nil' } if id.nil?
      errors << { :message => "name is neither string nor nil but is #{name.inspect}" } unless name.is_a?(String) || name.nil?
      errors << { :message => "source is neither string nor nil but is #{source.inspect}" } unless source.is_a?(String) || source.nil?
      errors << { :message => "height is neither integer nor nil but is #{height.inspect}" } unless height.is_a?(Integer) || height.nil?
      errors << { :message => "icon is neither string nor nil but is #{icon.inspect}" } unless icon.is_a?(String) || icon.nil?
      errors << { :message => "width is neither integer nor nil but is #{width.inspect}" } unless width.is_a?(Integer) || width.nil?
      errors << { :message => "from is not a Joey::User or Joey::Page and is #{from.inspect}" } unless from.is_a?(Joey::User) || from.is_a?(Joey::Page)

      errors << { :message => "comments is not an array nor nil and is #{comments.inspect}" } unless comments.is_a?(Array) || comments.nil?
      if comments.is_a?(Array) && !(comments.collect(&:class).uniq - [Joey::Comment]).empty?
        errors << { :message => 'comments is not an array of Joey::Comment' }
      end

      errors << { :message => "tags is not an array nor nil and is #{tags.inspect}" } unless tags.is_a?(Array) || tags.nil?
      if tags.is_a?(Array) && !(tags.collect(&:class).uniq - [Joey::Tag]).empty?
        errors << { :message => 'tags is not an array of Joey::Comment' }
      end
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
