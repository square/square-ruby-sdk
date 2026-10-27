# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module MeasurementUnitTime
      extend Square::Internal::Types::Enum

      GENERIC_MILLISECOND = "GENERIC_MILLISECOND"
      GENERIC_SECOND = "GENERIC_SECOND"
      GENERIC_MINUTE = "GENERIC_MINUTE"
      GENERIC_HOUR = "GENERIC_HOUR"
      GENERIC_DAY = "GENERIC_DAY"
    end
  end
end
