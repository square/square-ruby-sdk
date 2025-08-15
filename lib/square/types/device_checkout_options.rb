# frozen_string_literal: true

module Square
  class DeviceCheckoutOptions < Internal::Types::Model
    field :device_id, String, optional: false, nullable: false
    field :skip_receipt_screen, Internal::Types::Boolean, optional: true, nullable: false
    field :collect_signature, Internal::Types::Boolean, optional: true, nullable: false
    field :tip_settings, Square::TipSettings, optional: true, nullable: false
    field :show_itemized_cart, Internal::Types::Boolean, optional: true, nullable: false

  end
end
