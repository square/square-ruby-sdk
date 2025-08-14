# frozen_string_literal: true

module Square
    module Types
        # A response returned by the API call.
        class DeleteLoyaltyRewardResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
