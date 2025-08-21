# frozen_string_literal: true

module Square
  module Types
    # Represents an individual delete request in a [BulkDeleteLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkDeleteLocationCustomAttributes)
    # request. An individual request contains an optional ID of the associated custom attribute definition
    # and optional key of the associated custom attribute definition.
    class BulkDeleteLocationCustomAttributesRequestLocationCustomAttributeDeleteRequest < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false
    end
  end
end
