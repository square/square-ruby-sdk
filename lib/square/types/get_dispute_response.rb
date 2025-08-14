# frozen_string_literal: true

module Square
    module Types
        # Defines fields in a `RetrieveDispute` response.
        class GetDisputeResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :dispute, Square::Dispute, optional: true, nullable: false
        end
    end
end
