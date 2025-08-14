# frozen_string_literal: true

module Square
    module Types
        class PaymentOptions < Square::Internal::Types::Model
            field :autocomplete, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :delay_duration, String, optional: true, nullable: false
            field :accept_partial_authorization, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :delay_action, Square::PaymentOptionsDelayAction, optional: true, nullable: false
        end
    end
end
