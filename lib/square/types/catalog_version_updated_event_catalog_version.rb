# frozen_string_literal: true

module Square
  module Types
    class CatalogVersionUpdatedEventCatalogVersion < Internal::Types::Model
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
