# frozen_string_literal: true

module Square
  module Types
    class GetInventoryChangesResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :changes, Internal::Types::Array[Square::Types::InventoryChange], optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false

    end
  end
end
