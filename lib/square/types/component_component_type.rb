# frozen_string_literal: true

module Square
  module Types
    module ComponentComponentType
      extend Square::Internal::Types::Enum

      APPLICATION = "APPLICATION"
      CARD_READER = "CARD_READER"
      BATTERY = "BATTERY"
      WIFI = "WIFI"
      ETHERNET = "ETHERNET"
      PRINTER = "PRINTER"
    end
  end
end
