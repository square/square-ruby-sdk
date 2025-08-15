# frozen_string_literal: true

module Square
  # Represents an individual upsert request in a [BulkUpsertCustomerCustomAttributes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes)
  # request. An individual request contains a customer ID, the custom attribute to create or update,
  # and an optional idempotency key.
  class BatchUpsertCustomerCustomAttributesRequestCustomerCustomAttributeUpsertRequest < Internal::Types::Model
    field :customer_id, String, optional: false, nullable: false
    field :custom_attribute, Square::CustomAttribute, optional: false, nullable: false
    field :idempotency_key, String, optional: true, nullable: false

  end
end
