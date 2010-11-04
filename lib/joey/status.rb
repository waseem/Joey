module Joey
  class Status < Model
    define_properties :time, :status_id, :message

    def validate
      valid = true
    end

    def valid?
      self.validate
      puts self.errors.inspect unless self.errors.empty?
      self.errors.empty?
    end
  end
end
