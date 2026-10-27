# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents one upsert within the bulk operation.
    class BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute < Internal::Types::Model
      field :custom_attribute, -> { Square::Types::CustomAttribute }, optional: false, nullable: false

      field :idempotency_key, -> { String }, optional: true, nullable: true

      field :order_id, -> { String }, optional: false, nullable: false
    end
  end
end
