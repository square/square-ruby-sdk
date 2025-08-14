# frozen_string_literal: true

module Square
    module Types
        class AcceptedPaymentMethods < Square::Internal::Types::Model
            field :apple_pay, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :google_pay, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :cash_app_pay, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :afterpay_clearpay, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
