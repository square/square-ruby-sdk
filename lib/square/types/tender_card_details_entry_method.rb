
module Square
  class TenderCardDetailsEntryMethod
    include Square::Internal::Types::Enum
    SWIPED = "SWIPED"
    KEYED = "KEYED"
    EMV = "EMV"
    ON_FILE = "ON_FILE"
    CONTACTLESS = "CONTACTLESS"
  end
end
