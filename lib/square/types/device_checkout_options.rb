# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class DeviceCheckoutOptions < Internal::Types::Model
      field :device_id, -> { String }, optional: false, nullable: false

      field :skip_receipt_screen, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :collect_signature, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :tip_settings, -> { Square::Types::TipSettings }, optional: true, nullable: false

      field :show_itemized_cart, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :allow_auto_card_surcharge, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
