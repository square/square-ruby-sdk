# frozen_string_literal: true

module Square
  module Types
    # Represents an individual delete request in a
    # [BulkDeleteMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkDeleteMerchantCustomAttributes)
    # request. An individual request contains an optional ID of the associated custom attribute definition
    # and optional key of the associated custom attribute definition.
    class BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest < Internal::Types::Model
      field :key, -> { String }, optional: true, nullable: false
    end
  end
end
