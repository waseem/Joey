module Joey
  class Status < Model
    define_properties :time, :status_id, :message

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
