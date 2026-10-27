# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module TenderBuyNowPayLaterDetailsBrand
      extend Square::Internal::Types::Enum

      OTHER_BRAND = "OTHER_BRAND"
      AFTERPAY = "AFTERPAY"
    end
  end
end
