# frozen_string_literal: true

module Square
    module Types
        # Describes receipt action fields.
        class ReceiptOptions < Square::Internal::Types::Model
            field :payment_id, String, optional: false, nullable: false
            field :print_only, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :is_duplicate, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
