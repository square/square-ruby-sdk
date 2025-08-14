
module Square
  class CustomAttributeDefinitionVisibility
    includes Square::Internal::Types::Enum
    VISIBILITY_HIDDEN = "VISIBILITY_HIDDEN"
    VISIBILITY_READ_ONLY = "VISIBILITY_READ_ONLY"
    VISIBILITY_READ_WRITE_VALUES = "VISIBILITY_READ_WRITE_VALUES"
  end
end
