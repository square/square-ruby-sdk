
module Square
  class EcomVisibility
    includes Square::Internal::Types::Enum
    UNINDEXED = "UNINDEXED"
    UNAVAILABLE = "UNAVAILABLE"
    HIDDEN = "HIDDEN"
    VISIBLE = "VISIBLE"
  end
end
