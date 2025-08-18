# frozen_string_literal: true

module Square
  module Types
    # Represents a [RetrieveMerchantCustomAttribute](api-endpoint:MerchantCustomAttributes-RetrieveMerchantCustomAttribute) response.
    # Either `custom_attribute_definition` or `errors` is present in the response.
    class RetrieveMerchantCustomAttributeResponse < Internal::Types::Model
      field :custom_attribute, Square::Types::CustomAttribute, optional: true, nullable: false
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false

    end
  end
end
