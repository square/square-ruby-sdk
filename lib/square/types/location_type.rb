
module Square
  class LocationType
    includes Square::Internal::Types::Enum
    PHYSICAL = "PHYSICAL"
    MOBILE = "MOBILE"
  end
end
