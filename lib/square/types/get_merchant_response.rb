# frozen_string_literal: true

module Square
    module Types
        # The response object returned by the [RetrieveMerchant](api-endpoint:Merchants-RetrieveMerchant) endpoint.
        class GetMerchantResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :merchant, Square::Merchant, optional: true, nullable: false
        end
    end
end
