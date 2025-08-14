# frozen_string_literal: true

module Square
    module Types
        # Additional details about Square Account payments.
        class SquareAccountDetails < Square::Internal::Types::Model
            field :payment_source_token, String, optional: true, nullable: false
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
        end
    end
end
