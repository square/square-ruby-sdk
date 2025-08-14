
module Square
  class VendorStatus
    include Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    INACTIVE = "INACTIVE"
  end
end
