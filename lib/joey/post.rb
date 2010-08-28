module Joey
  class Post < Model

    define_properties :id, :message, :picture, :link, :name, :caption, 
      :description, :source, :icon, :attribution, :likes,
      :created_time, :updated_time, :type

    #creation_properties :message, :picture, :link, :name, :description

    hash_populating_accessor :actions, "Action"
    hash_populating_accessor :comments, "Comment"
    hash_populating_accessor :from, "User", "Page"
    hash_populating_accessor :to, "User", "Page"
    hash_populating_accessor :privacy, "Privacy"

    def validate
      created_time.to_time rescue errors << { :message => 'created_time is not compatible' }
      updated_time.to_time rescue errors << { :message => 'updated_time is not compatible' }
      errors << { :message => 'id should not be nil' } if id.nil?
      errors << { :message => "name is neither string nor nil but is #{name.inspect}" } unless name.is_a?(String) || name.nil?
      errors << { :message => "message is neither string nor nil but is #{message.inspect}" } unless message.is_a?(String) || message.nil?
      errors << { :message => "likes is neither string nor nil but is #{likes.inspect}" } unless likes.is_a?(Integer) || likes.nil?
      errors << { :message => "icon is neither string nor nil but is #{icon.inspect}" } unless icon.is_a?(String) || icon.nil?
      errors << { :message => "attribution is neither string nor nil but is #{attribution.inspect}" } unless attribution.is_a?(String) || attribution.nil?

      unless ['music', 'photo', 'video', 'status', 'link'].include?(type)
        errors << { :message => "type should be one of 'music', 'video', 'status', or 'link' but is #{type}" }
      end

      if type == 'picture' && !picture.is_a?(String)
        errors << { :message => "picture is not present for picture post and is #{picture.inspect}" }
      end

      if type == 'link' && !link.is_a?(String)
        errors << { :message => "picture is not present for picture post and is #{picture.inspect}" }
      end

      errors << { :message => "from is not a Joey::User or Joey::Page and is #{from.inspect}" } unless from.is_a?(Joey::User) || from.is_a?(Joey::Page)

      errors << { :message => "to is neither an array nor nil and is #{to.inspect}" }  unless to.is_a?(Array) || to.nil?
      if to.is_a?(Array) && !(to.collect(&:class).uniq - [Joey::User, Joey::Page]).empty?
        errors << { :message => 'to is not an array of Joey::User or Joey::Page' }
      end

      # TODO: Explore following approach.
      # errors << { :message => 'Comments is not valid' }, unless comment.nil? || (comments.collect(&:valid?).uniq - [true]).empty?

      # Sometimes comments is a single Joey::Comment object
      errors << { :message => "comments is not an array nor nil and is #{comments.inspect}" } unless comments.is_a?(Array) || comments.nil?
      if comments.is_a?(Array) && !(comments.collect(&:class).uniq - [Joey::Comment]).empty?
        errors << { :message => 'comments is not an array of Joey::Comment' }
      end
    end

    def valid?
      self.validate
      self.errors.empty?
    end

    #def likes_create
    #client.post("#{id}/likes",nil,{})
    #end
  end
end
