# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A Square API V1 identifier of an item, including the object ID and its associated location ID.
    class CatalogV1Id < Internal::Types::Model
      field :catalog_v_1_id, -> { String }, optional: true, nullable: true, api_name: "catalog_v1_id"

      field :location_id, -> { String }, optional: true, nullable: true
    end
  end
end
