# frozen_string_literal: true

module Square
  module Types
    class CheckoutLocationSettingsBranding < Internal::Types::Model
      field :header_type, lambda {
        Square::Types::CheckoutLocationSettingsBrandingHeaderType
      }, optional: true, nullable: false
      field :button_color, -> { String }, optional: true, nullable: false
      field :button_shape, lambda {
        Square::Types::CheckoutLocationSettingsBrandingButtonShape
      }, optional: true, nullable: false
    end
  end
end
