# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module Weekday
      extend Square::Internal::Types::Enum

      MON = "MON"
      TUE = "TUE"
      WED = "WED"
      THU = "THU"
      FRI = "FRI"
      SAT = "SAT"
      SUN = "SUN"
    end
  end
end
