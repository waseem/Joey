module Joey
  class Video < Model

    define_properties :id, :name, :description, :length, :created_time,
      :updated_time, :icon, :picture, :embed_html, :caption, :link, :source, :likes

    hash_populating_accessor :from, "User", "Page"
    hash_populating_accessor :tags, "Tag"

    has_association :comments, "Comment"

    def validate
      self.errors = []
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
