module Joey
  class Model < Hashie::Dash

    class KoalaClientRequiredError < Exception; end

    attr_accessor :client

    def initialize(hash = {}, client = nil)
      self.client = client
      super(hash || {})
    end

    def self.define_properties(*args)
      args.each do |arg|
        property arg
      end
    end

    def self.recognize?(data)
      true
    end

    def self.hash_populating_accessor(method_name, *klass)
      define_method "#{method_name}=" do |hash|
        instance_variable_set("@#{method_name}", client.map_data(hash, klass))
      end

      define_method "#{method_name}" do
        instance_variable_get "@#{method_name}"
      end
      #add_creation_method(method_name,klass)
    end

    # TODO: Look out for creation of nodes in the Graph
    # me = koala_client.me
    # me.friends_create(args)
    #def self.add_creation_method(name, klass)
      #define_method "#{name}_create" do |arg|
        #params = arg.nil? ? {} : arg.post_params
        #klass_to_send = arg.nil? ? nil : klass
        #client.post("#{id}/#{name}", klass_to_send, params)
      #end
    #end
    
    def self.has_association(name, klass)
      define_method(name) do
        if (ret = instance_variable_get("@#{name}")).nil?
          ret = client.get_and_map("#{id}/#{name}", klass)
          instance_variable_set("@#{name}", ret)
        end
        return ret
      end
      
      #add_creation_method(name, klass)
    end

  end
end
