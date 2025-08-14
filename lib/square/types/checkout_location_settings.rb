# frozen_string_literal: true

module Square
    module Types
        class CheckoutLocationSettings < Square::Internal::Types::Model
            field :location_id, String, optional: true, nullable: false
            field :customer_notes_enabled, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :policies, Square::Internal::Types::Array[Square::CheckoutLocationSettingsPolicy], optional: true, nullable: false
            field :branding, Square::CheckoutLocationSettingsBranding, optional: true, nullable: false
            field :tipping, Square::CheckoutLocationSettingsTipping, optional: true, nullable: false
            field :coupons, Square::CheckoutLocationSettingsCoupons, optional: true, nullable: false
            field :updated_at, String, optional: true, nullable: false
        end
    end
end
