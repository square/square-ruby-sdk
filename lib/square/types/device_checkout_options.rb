# frozen_string_literal: true

module Square
    module Types
        class DeviceCheckoutOptions < Square::Internal::Types::Model
            field :device_id, String, optional: false, nullable: false
            field :skip_receipt_screen, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :collect_signature, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :tip_settings, Square::TipSettings, optional: true, nullable: false
            field :show_itemized_cart, Square::Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
