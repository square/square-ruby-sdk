# frozen_string_literal: true

module Square
  module Types
    # Represents a [BulkDeleteLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkDeleteLocationCustomAttributes) response,
    # which contains a map of responses that each corresponds to an individual delete request.
    class BulkDeleteLocationCustomAttributesResponse < Internal::Types::Model
      field :values, lambda {
        Internal::Types::Hash[String, Square::Types::BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse]
      }, optional: false, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
