module Joey
  class HsInfo < Model
    define_properties :hs1_name, :hs2_name, :grad_year

    def validate
      valid = true
    end

    def valid?
      self.validate
      self.errors.empty?
    end
  end
end
