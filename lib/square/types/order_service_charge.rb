# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # Represents a service charge applied to an order.
    class OrderServiceCharge < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :catalog_object_id, -> { String }, optional: true, nullable: true

      field :catalog_version, -> { Integer }, optional: true, nullable: true

      field :percentage, -> { String }, optional: true, nullable: true

      field :amount_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :applied_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_tax_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :calculation_phase, -> { Square::Types::OrderServiceChargeCalculationPhase }, optional: true, nullable: false

      field :taxable, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :applied_taxes, -> { Internal::Types::Array[Square::Types::OrderLineItemAppliedTax] }, optional: true, nullable: true

      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: true

      field :type, -> { Square::Types::OrderServiceChargeType }, optional: true, nullable: false

      field :treatment_type, -> { Square::Types::OrderServiceChargeTreatmentType }, optional: true, nullable: false

      field :scope, -> { Square::Types::OrderServiceChargeScope }, optional: true, nullable: false
    end
  end
end
