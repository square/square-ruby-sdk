# frozen_string_literal: true

module Square
    module Types
        class ConfirmationDecision < Square::Internal::Types::Model
            field :has_agreed, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
