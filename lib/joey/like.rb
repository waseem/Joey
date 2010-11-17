module Joey
  class Like < Model

    define_properties :name, :id, :count

    def validate
    end

    def valid?
      true
    end
  end
end
