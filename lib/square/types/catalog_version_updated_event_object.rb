# frozen_string_literal: true

module Square
  module Types
    class CatalogVersionUpdatedEventObject < Internal::Types::Model
      field :catalog_version, -> { Square::Types::CatalogVersionUpdatedEventCatalogVersion }, optional: true, nullable: false

    end
  end
end
