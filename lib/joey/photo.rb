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
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
