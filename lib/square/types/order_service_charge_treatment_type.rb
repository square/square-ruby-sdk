
module Square
  class OrderServiceChargeTreatmentType
    includes Square::Internal::Types::Enum
    LINE_ITEM_TREATMENT = "LINE_ITEM_TREATMENT"
    APPORTIONED_TREATMENT = "APPORTIONED_TREATMENT"
  end
end
