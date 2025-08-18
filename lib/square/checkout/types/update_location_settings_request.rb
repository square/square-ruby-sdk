
module Square
  module Checkout
    module Types
      class UpdateLocationSettingsRequest < Internal::Types::Model
        field :location_id, String, optional: false, nullable: false
        field :location_settings, Square::Types::CheckoutLocationSettings, optional: false, nullable: false

      end
    end
  end
end
