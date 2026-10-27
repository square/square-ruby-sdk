# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module SubscriptionPricingType
      extend Square::Internal::Types::Enum

      STATIC = "STATIC"
      RELATIVE = "RELATIVE"
    end
  end
end
