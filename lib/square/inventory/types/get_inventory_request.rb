# frozen_string_literal: true

module Square
  module Inventory
    module Types
      class GetInventoryRequest < Internal::Types::Model
        field :catalog_object_id, -> { String }, optional: false, nullable: false
        field :location_ids, -> { String }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
      end
    end
  end
end
