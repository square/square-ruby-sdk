
module Square
  class ChangeTiming
    includes Square::Internal::Types::Enum
    IMMEDIATE = "IMMEDIATE"
    END_OF_BILLING_CYCLE = "END_OF_BILLING_CYCLE"
  end
end
