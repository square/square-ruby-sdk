# frozen_string_literal: true

module Square
    module Types
        # The response object returned by the [ListMerchant](api-endpoint:Merchants-ListMerchants) endpoint.
        class ListMerchantsResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :merchant, Square::Internal::Types::Array[Square::Merchant], optional: true, nullable: false
            field :cursor, Integer, optional: true, nullable: false
        end
    end
end
