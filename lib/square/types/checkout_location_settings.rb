# frozen_string_literal: true

module Square
  class CheckoutLocationSettings < Internal::Types::Model
    field :location_id, String, optional: true, nullable: false
    field :customer_notes_enabled, Internal::Types::Boolean, optional: true, nullable: false
    field :policies, Internal::Types::Array[Square::CheckoutLocationSettingsPolicy], optional: true, nullable: false
    field :branding, Square::CheckoutLocationSettingsBranding, optional: true, nullable: false
    field :tipping, Square::CheckoutLocationSettingsTipping, optional: true, nullable: false
    field :coupons, Square::CheckoutLocationSettingsCoupons, optional: true, nullable: false
    field :updated_at, String, optional: true, nullable: false

  end
end
