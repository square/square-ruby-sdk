# frozen_string_literal: true

module Square
  # Represents a [ListMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-ListMerchantCustomAttributes) response.
  # Either `custom_attributes`, an empty object, or `errors` is present in the response. If additional
  # results are available, the `cursor` field is also present along with `custom_attributes`.
  class ListMerchantCustomAttributesResponse < Internal::Types::Model
    field :custom_attributes, Internal::Types::Array[Square::CustomAttribute], optional: true, nullable: false
    field :cursor, String, optional: true, nullable: false
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
