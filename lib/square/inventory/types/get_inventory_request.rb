# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class GetInventoryRequest < Internal::Types::Model
        field :catalog_object_id, -> { String }, optional: false, nullable: false

        field :location_ids, -> { String }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true
      end
    end
  end
end
