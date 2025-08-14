
module Square
  class BusinessBookingProfileBookingPolicy
    include Square::Internal::Types::Enum
    ACCEPT_ALL = "ACCEPT_ALL"
    REQUIRES_ACCEPTANCE = "REQUIRES_ACCEPTANCE"
  end
end
