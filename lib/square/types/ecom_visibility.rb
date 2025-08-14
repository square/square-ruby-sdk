
module Square
  class EcomVisibility
    include Square::Internal::Types::Enum
    UNINDEXED = "UNINDEXED"
    UNAVAILABLE = "UNAVAILABLE"
    HIDDEN = "HIDDEN"
    VISIBLE = "VISIBLE"
  end
end
