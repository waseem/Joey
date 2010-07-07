module Joey
  class Privacy < Model
    define_properties :value, :description, :allow, :friends, :deny
  end
end
