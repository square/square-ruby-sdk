
module Square
  class LocationType
    include Square::Internal::Types::Enum
    PHYSICAL = "PHYSICAL"
    MOBILE = "MOBILE"
  end
end
