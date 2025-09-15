# frozen_string_literal: true

module Square
  module Types
    module TenderCardDetailsEntryMethod
      extend Square::Internal::Types::Enum

      SWIPED = "SWIPED"
      KEYED = "KEYED"
      EMV = "EMV"
      ON_FILE = "ON_FILE"
      CONTACTLESS = "CONTACTLESS"
    end
  end
end
