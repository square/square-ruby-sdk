# frozen_string_literal: true

module Square
  module Types
    module CustomAttributeDefinitionVisibility
      extends Square::Internal::Types::Enum
      VISIBILITY_HIDDEN = "VISIBILITY_HIDDEN"
      VISIBILITY_READ_ONLY = "VISIBILITY_READ_ONLY"
      VISIBILITY_READ_WRITE_VALUES = "VISIBILITY_READ_WRITE_VALUES"end
  end
end
