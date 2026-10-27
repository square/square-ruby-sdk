# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OrderServiceChargeScope
      extend Square::Internal::Types::Enum

      OTHER_SERVICE_CHARGE_SCOPE = "OTHER_SERVICE_CHARGE_SCOPE"
      LINE_ITEM = "LINE_ITEM"
      ORDER = "ORDER"
    end
  end
end
