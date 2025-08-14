# frozen_string_literal: true

module Square
    module Types
        class CheckoutLocationSettingsBranding < Square::Internal::Types::Model
            field :header_type, Square::CheckoutLocationSettingsBrandingHeaderType, optional: true, nullable: false
            field :button_color, String, optional: true, nullable: false
            field :button_shape, Square::CheckoutLocationSettingsBrandingButtonShape, optional: true, nullable: false
        end
    end
end
