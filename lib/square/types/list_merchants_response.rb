# frozen_string_literal: true

module Square
    module Types
        # The response object returned by the [ListMerchant](api-endpoint:Merchants-ListMerchants) endpoint.
        class ListMerchantsResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :merchant, Internal::Types::Array[Square::Merchant], optional: true, nullable: false
            field :cursor, Integer, optional: true, nullable: false
        end
    end
end
