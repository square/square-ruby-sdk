
module Square
  class PayoutType
    includes Square::Internal::Types::Enum
    BATCH = "BATCH"
    SIMPLE = "SIMPLE"
  end
end
