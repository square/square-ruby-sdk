# frozen_string_literal: true

module Square
  module Types
    # Represents a [BulkUpsertCustomerCustomAttributes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes) response,
    # which contains a map of responses that each corresponds to an individual upsert request.
    class BatchUpsertCustomerCustomAttributesResponse < Internal::Types::Model
      field :values, lambda {
        Internal::Types::Hash[String, Square::Types::BatchUpsertCustomerCustomAttributesResponseCustomerCustomAttributeUpsertResponse]
      }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
