module Joey
  class FetchingArray < Array
    attr_accessor :next_url, :previous_url, :client, :classes, :count
    
    def fetch_next
      return [] if next_url.blank?
      # FIXME: following only returns a hash like {"id"=>"http://graph.facebook.com/100000637452380/feed"}
      # try to write a method in koala which can request absolute urls
      additions = client.get_and_map_url(next_url, classes)
      self.next_url = additions.next_url
      self.concat(additions)
      additions
    end
    
    def fetch_previous
      return [] if previous_url.blank?
      # FIXME: following only returns a hash like {"id"=>"http://graph.facebook.com/100000637452380/feed"}
      # try to write a method in koala which can request absolute urls
      additions = client.get_and_map_url(previous_url, classes)
      self.previous_url = additions.previous_url
      self.unshift(*additions)
      additions
    end

  end
end
