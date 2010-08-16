module Joey
  class Post < Model
        
    define_properties :id, :message, :picture, :link, :name, :caption, 
      :description, :source, :icon, :attribution, :actions, :likes,
      :created_time, :updated_time, :type
    
    #creation_properties :message, :picture, :link, :name, :description
        
    hash_populating_accessor :actions, "Action"
    hash_populating_accessor :comments, "Comment"
    hash_populating_accessor :from, "User", "Page"
    hash_populating_accessor :to, "User", "Page"
    hash_populating_accessor :privacy, "Privacy"
    
    #def likes_create
      #client.post("#{id}/likes",nil,{})
    #end
  end
end
