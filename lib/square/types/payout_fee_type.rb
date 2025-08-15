
module Square
  class PayoutFeeType
    include Square::Internal::Types::Enum
    TRANSFER_FEE = "TRANSFER_FEE"
    TAX_ON_TRANSFER_FEE = "TAX_ON_TRANSFER_FEE"
  end
end
