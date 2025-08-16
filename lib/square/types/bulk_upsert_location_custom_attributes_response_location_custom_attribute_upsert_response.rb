# frozen_string_literal: true

module Square
  module Types
    # Represents a response for an individual upsert request in a [BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes) operation.
    class BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse < Internal::Types::Model
      field :location_id, String, optional: true, nullable: false
      field :custom_attribute, Square::CustomAttribute, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

    end
  end
end
