# frozen_string_literal: true

module Square
  class CatalogVersionUpdatedEventObject < Internal::Types::Model
    field :catalog_version, Square::CatalogVersionUpdatedEventCatalogVersion, optional: true, nullable: false

  end
end
