# frozen_string_literal: true

module Square
  module Types
    # Represents a response from deleting one or more order custom attributes.
    class BulkDeleteOrderCustomAttributesResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :values, -> { Internal::Types::Hash[String, Square::Types::DeleteOrderCustomAttributeResponse] }, optional: false, nullable: false

    end
  end
end
