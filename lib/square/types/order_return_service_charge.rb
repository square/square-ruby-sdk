# frozen_string_literal: true

module Square
  module Types
    # Represents the service charge applied to the original order.
    class OrderReturnServiceCharge < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: false
      field :source_service_charge_uid, -> { String }, optional: true, nullable: false
      field :name, -> { String }, optional: true, nullable: false
      field :catalog_object_id, -> { String }, optional: true, nullable: false
      field :catalog_version, -> { Integer }, optional: true, nullable: false
      field :percentage, -> { String }, optional: true, nullable: false
      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :total_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :total_tax_money, -> { Square::Types::Money }, optional: true, nullable: false
      field :calculation_phase, -> { Square::Types::OrderServiceChargeCalculationPhase }, optional: true, nullable: false
      field :taxable, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :applied_taxes, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedTax] }, optional: true, nullable: false
      field :treatment_type, -> { Square::Types::OrderServiceChargeTreatmentType }, optional: true, nullable: false
      field :scope, -> { Square::Types::OrderServiceChargeScope }, optional: true, nullable: false
      field :type, -> { Square::Types::OrderServiceChargeType }, optional: true, nullable: false
    end
  end
end
