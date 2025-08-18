# frozen_string_literal: true

module Square
  module Types
    class CheckoutLocationSettingsCoupons < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

    end
  end
end
