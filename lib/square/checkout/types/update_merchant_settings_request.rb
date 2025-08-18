
module Square
  module Checkout
    module Types
      class UpdateMerchantSettingsRequest < Internal::Types::Model
        field :merchant_settings, -> { Square::Types::CheckoutMerchantSettings }, optional: false, nullable: false

      end
    end
  end
end
