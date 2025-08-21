# frozen_string_literal: true

module Square
  module Types
    module MeasurementUnitUnitType
      extend Square::Internal::Types::Enum

      TYPE_CUSTOM = "TYPE_CUSTOM"
      TYPE_AREA = "TYPE_AREA"
      TYPE_LENGTH = "TYPE_LENGTH"
      TYPE_VOLUME = "TYPE_VOLUME"
      TYPE_WEIGHT = "TYPE_WEIGHT"
      TYPE_GENERIC = "TYPE_GENERIC"end
  end
end
