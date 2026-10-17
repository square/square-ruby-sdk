# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectAvailabilityPeriod < CatalogObjectBase
      field :availability_period_data, -> { Square::Types::CatalogAvailabilityPeriod }, optional: true, nullable: false
    end
  end
end
