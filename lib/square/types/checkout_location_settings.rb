# frozen_string_literal: true

module Square
  module Types
    class CheckoutLocationSettings < Internal::Types::Model
      field :location_id, -> { String }, optional: true, nullable: false
      field :customer_notes_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :policies, lambda {
        Internal::Types::Array[Square::Types::CheckoutLocationSettingsPolicy]
      }, optional: true, nullable: false
      field :branding, -> { Square::Types::CheckoutLocationSettingsBranding }, optional: true, nullable: false
      field :tipping, -> { Square::Types::CheckoutLocationSettingsTipping }, optional: true, nullable: false
      field :coupons, -> { Square::Types::CheckoutLocationSettingsCoupons }, optional: true, nullable: false
      field :updated_at, -> { String }, optional: true, nullable: false
    end
  end
end
