# frozen_string_literal: true

module Square
  module Types
    class CatalogObjectTimePeriod < CatalogObjectBase
      field :time_period_data, -> { Square::Types::CatalogTimePeriod }, optional: true, nullable: false
    end
  end
end
