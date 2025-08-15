# frozen_string_literal: true

module Square
  # Represents an individual delete response in a [BulkDeleteLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkDeleteLocationCustomAttributes)
  # request.
  class BulkDeleteLocationCustomAttributesResponseLocationCustomAttributeDeleteResponse < Internal::Types::Model
    field :location_id, String, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
