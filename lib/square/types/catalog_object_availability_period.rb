# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectAvailabilityPeriod < Internal::Types::Model
      field :availability_period_data, Square::Types::CatalogAvailabilityPeriod, optional: true, nullable: false

    end
  end
end
