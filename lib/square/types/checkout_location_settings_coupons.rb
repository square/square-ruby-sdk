# frozen_string_literal: true

module Square
    module Types
        class CheckoutLocationSettingsCoupons < Square::Internal::Types::Model
            field :enabled, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
