# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class CheckoutLocationSettingsCoupons < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true
    end
  end
end
