# frozen_string_literal: true

module Square
  module Types
    # A Square API V1 identifier of an item, including the object ID and its associated location ID.
    class CatalogV1Id < Internal::Types::Model
      field :catalog_v_1_id, String, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false

    end
  end
end
