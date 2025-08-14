# frozen_string_literal: true

module Square
    module Types
        # Represents a service charge applied to an order.
        class OrderServiceCharge < Square::Internal::Types::Model
            field :uid, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
            field :catalog_object_id, String, optional: true, nullable: false
            field :catalog_version, Integer, optional: true, nullable: false
            field :percentage, String, optional: true, nullable: false
            field :amount_money, Square::Money, optional: true, nullable: false
            field :applied_money, Square::Money, optional: true, nullable: false
            field :total_money, Square::Money, optional: true, nullable: false
            field :total_tax_money, Square::Money, optional: true, nullable: false
            field :calculation_phase, Square::OrderServiceChargeCalculationPhase, optional: true, nullable: false
            field :taxable, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :applied_taxes, Square::Internal::Types::Array[Square::OrderLineItemAppliedTax], optional: true, nullable: false
            field :metadata, Square::Internal::Types::Hash[String, String], optional: true, nullable: false
            field :type, Square::OrderServiceChargeType, optional: true, nullable: false
            field :treatment_type, Square::OrderServiceChargeTreatmentType, optional: true, nullable: false
            field :scope, Square::OrderServiceChargeScope, optional: true, nullable: false
        end
    end
end
