
module Square
  class MerchantStatus
    include Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    INACTIVE = "INACTIVE"
  end
end
