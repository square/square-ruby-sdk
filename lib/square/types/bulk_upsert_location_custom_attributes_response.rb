# frozen_string_literal: true

module Square
  module Types
    # Represents a [BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes) response,
    # which contains a map of responses that each corresponds to an individual upsert request.
    class BulkUpsertLocationCustomAttributesResponse < Internal::Types::Model
      field :values, lambda {
        Internal::Types::Hash[String, Square::Types::BulkUpsertLocationCustomAttributesResponseLocationCustomAttributeUpsertResponse]
      }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
