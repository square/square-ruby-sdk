# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    module OrderServiceChargeTreatmentType
      extend Square::Internal::Types::Enum

      LINE_ITEM_TREATMENT = "LINE_ITEM_TREATMENT"
      APPORTIONED_TREATMENT = "APPORTIONED_TREATMENT"
    end
  end
end
