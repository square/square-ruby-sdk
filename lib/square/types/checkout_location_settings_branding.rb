# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CheckoutLocationSettingsBranding < Internal::Types::Model
      field :header_type, -> { Square::Types::CheckoutLocationSettingsBrandingHeaderType }, optional: true, nullable: false

      field :button_color, -> { String }, optional: true, nullable: true

      field :button_shape, -> { Square::Types::CheckoutLocationSettingsBrandingButtonShape }, optional: true, nullable: false
    end
  end
end
