# frozen_string_literal: true

module Square
  module Types
    # Represents an individual upsert request in a [BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes)
    # request. An individual request contains a merchant ID, the custom attribute to create or update,
    # and an optional idempotency key.
    class BulkUpsertMerchantCustomAttributesRequestMerchantCustomAttributeUpsertRequest < Internal::Types::Model
      field :merchant_id, String, optional: false, nullable: false
      field :custom_attribute, Square::Types::CustomAttribute, optional: false, nullable: false
      field :idempotency_key, String, optional: true, nullable: false

    end
  end
end
