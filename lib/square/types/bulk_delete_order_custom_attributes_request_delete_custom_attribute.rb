# frozen_string_literal: true

module Square
  module Types
    # Represents one delete within the bulk operation.
    class BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false
      field :order_id, -> { String }, optional: false, nullable: false

    end
  end
end
