module Joey
  class Album < Model
    
    define_properties :id, :name, :description, :link, :count, :created_time, :updated_time, :privacy, :location
    #creation_properties :name, :message
    
    hash_populating_accessor :from, "User", "Page"
    hash_populating_accessor :comments, "Comment"
    has_association :photos, "Photo"
    has_association :comments, "Comment"
    
    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
