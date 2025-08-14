
module Square
  class LocationStatus
    include Square::Internal::Types::Enum
    ACTIVE = "ACTIVE"
    INACTIVE = "INACTIVE"
  end
end
