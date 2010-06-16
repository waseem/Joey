module Joey
  class WorkHistory < Model
    define_properties :start_date, :position, :company_name, :description, :end_date

    hash_populating_accessor :location, "Location"
  end
end
