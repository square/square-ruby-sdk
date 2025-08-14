# frozen_string_literal: true

module Square
    module Types
        # Defines fields in a `ListDisputes` response.
        class ListDisputesResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :disputes, Square::Internal::Types::Array[Square::Dispute], optional: true, nullable: false
            field :cursor, String, optional: true, nullable: false
        end
    end
end
