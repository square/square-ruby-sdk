# frozen_string_literal: true

module Square
  module Types
    # Represents a response from a bulk upsert of order custom attributes.
    class BulkUpsertOrderCustomAttributesResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :values, lambda {
        Internal::Types::Hash[String, Square::Types::UpsertOrderCustomAttributeResponse]
      }, optional: false, nullable: false
    end
  end
end
