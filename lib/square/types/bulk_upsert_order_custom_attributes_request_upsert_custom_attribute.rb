# frozen_string_literal: true

module Square
  # Represents one upsert within the bulk operation.
  class BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute < Internal::Types::Model
    field :custom_attribute, Square::CustomAttribute, optional: false, nullable: false
    field :idempotency_key, String, optional: true, nullable: false
    field :order_id, String, optional: false, nullable: false

  end
end
