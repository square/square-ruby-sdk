# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents one delete within the bulk operation.
    class BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false

      field :order_id, -> { String }, optional: false, nullable: false
    end
  end
end
