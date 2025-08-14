# frozen_string_literal: true

module Square
    module Types
        # Represents a [ListMerchantCustomAttributeDefinitions](api-endpoint:MerchantCustomAttributes-ListMerchantCustomAttributeDefinitions) response.
        # Either `custom_attribute_definitions`, an empty object, or `errors` is present in the response.
        # If additional results are available, the `cursor` field is also present along with `custom_attribute_definitions`.
        class ListMerchantCustomAttributeDefinitionsResponse < Internal::Types::Model
            field :custom_attribute_definitions, Internal::Types::Array[Square::CustomAttributeDefinition], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
        end
    end
end
