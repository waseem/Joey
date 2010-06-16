module Joey
  module RestAPI
    include ParserHelpers
    class UnrecognizeableClassError < Exception; end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
    end

    def me
      get_and_map('me', Joey::User)
    end

    def revoke_app_permission(ext_perm)
      # no need to boolianize. It returns true/false.
      self.rest_call("auth.revokeExtendedPermission", :perm => ext_perm.to_s)
    end

    # path can be some node id in the Facebook Graph e.g. 'me', 'me/feed', '1234567890/feed'.
    # klass is wrapper class for that node.
    def get_and_map(path, klass = nil)
      data = self.get_object(path)
      map_data(data, klass)
    end

    def get_and_map_url(url, klass = nil)
      # FIXME: following only returns a hash like {"id"=>"http://graph.facebook.com/100000637452380/feed"}
      # try to write a method in koala which can request absolute Facebook urls. See fetching_array.rb:7.
      data = self.class.get_object(url)
      map_data(data,klass)
    end

    def map_data(data, klass = nil)
      raise_error_if_necessary(data)
      hash_or_array = extract_hash_or_array(data, klass)
      hash_or_array = map_to_class(hash_or_array,klass) if klass
      hash_or_array
    end

    def extract_hash_or_array(hash_or_array, klass)
      return nil unless hash_or_array
      return hash_or_array if hash_or_array.kind_of?(Array)
      return extract_fetching_array(hash_or_array, klass) if hash_or_array.has_key?("data")
      return hash_or_array
    end

    def extract_fetching_array(hash, klass)
      f = Joey::FetchingArray.new
      f.concat(hash["data"])
      f.client = self
      f.classes = Array(klass)
      if hash["paging"]
        f.next_url = hash["paging"]["next"]
        f.previous_url = hash["paging"]["previous"]
      end
      f
    end

    def map_to_class(hash_or_array, klass)
      return nil if hash_or_array.nil?
      if hash_or_array.kind_of?(Array)
        hash_or_array.map! {|elmnt| create_instance(klass, elmnt)}
      else
        hash_or_array = create_instance(klass, hash_or_array)
      end
    end

    def create_instance(klass, data)
      klass = determine_class(klass, data)
      if klass.nil?
        raise UnrecognizeableClassError.new("unable to recognize klass for #{klass.inspect} => #{data.inspect}")
      end
      klass.new(data, self)
    end
    
    def constantize_string(klass)
      klass.is_a?(String) ? Joey.const_get(klass) : klass
    end
    
    def determine_class(klass_or_klasses, data)
      klasses = Array(klass_or_klasses).map { |k| constantize_string(k)}
      klasses.detect {|klass| puts klass.inspect; klass.recognize?(data)} || klasses.first
    end

    def raise_error_if_necessary(data)
      if data.kind_of?(Hash)
        if data.keys.size == 1 and data["error"]
          type = data["error"]["type"]
          message = data["error"]["message"]
          raise Exception.new("#{type}: #{message}")
        end
      end
    end

  end
end
