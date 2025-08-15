
module Square
  class PayoutType
    include Square::Internal::Types::Enum
    BATCH = "BATCH"
    SIMPLE = "SIMPLE"
  end
end
