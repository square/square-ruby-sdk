# frozen_string_literal: true

module Square
  module Types
    # Represents a [BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes) response,
    # which contains a map of responses that each corresponds to an individual upsert request.
    class BulkUpsertMerchantCustomAttributesResponse < Internal::Types::Model
      field :values, -> { Internal::Types::Hash[String, Square::Types::BulkUpsertMerchantCustomAttributesResponseMerchantCustomAttributeUpsertResponse] }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false

    end
  end
end
