# frozen_string_literal: true
require_relative "money"
require_relative "order_service_charge_calculation_phase"
require_relative "order_line_item_applied_tax"
require_relative "order_service_charge_treatment_type"
require_relative "order_service_charge_scope"
require "ostruct"
require "json"

module square.rb
# Represents the service charge applied to the original order.
  class OrderReturnServiceCharge
  # @return [String] A unique ID that identifies the return service charge only within this order.
    attr_reader :uid
  # @return [String] The service charge `uid` from the order containing the original
#  service charge. `source_service_charge_uid` is `null` for
#  unlinked returns.
    attr_reader :source_service_charge_uid
  # @return [String] The name of the service charge.
    attr_reader :name
  # @return [String] The catalog object ID of the associated
#  [OrderServiceCharge](entity:OrderServiceCharge).
    attr_reader :catalog_object_id
  # @return [Long] The version of the catalog object that this service charge references.
    attr_reader :catalog_version
  # @return [String] The percentage of the service charge, as a string representation of
#  a decimal number. For example, a value of `"7.25"` corresponds to a
#  percentage of 7.25%.
#  Either `percentage` or `amount_money` should be set, but not both.
    attr_reader :percentage
  # @return [square.rb::Money] The amount of a non-percentage-based service charge.
#  Either `percentage` or `amount_money` should be set, but not both.
    attr_reader :amount_money
  # @return [square.rb::Money] The amount of money applied to the order by the service charge, including
#  any inclusive tax amounts, as calculated by Square.
#  - For fixed-amount service charges, `applied_money` is equal to `amount_money`.
#  - For percentage-based service charges, `applied_money` is the money calculated
#  using the percentage.
    attr_reader :applied_money
  # @return [square.rb::Money] The total amount of money to collect for the service charge.
#  __NOTE__: If an inclusive tax is applied to the service charge, `total_money`
#  does not equal `applied_money` plus `total_tax_money` because the inclusive
#  tax amount is already included in both `applied_money` and `total_tax_money`.
    attr_reader :total_money
  # @return [square.rb::Money] The total amount of tax money to collect for the service charge.
    attr_reader :total_tax_money
  # @return [square.rb::OrderServiceChargeCalculationPhase] The calculation phase after which to apply the service charge.
#  See
#  [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase)
#  for possible values
    attr_reader :calculation_phase
  # @return [Boolean] Indicates whether the surcharge can be taxed. Service charges
#  calculated in the `TOTAL_PHASE` cannot be marked as taxable.
    attr_reader :taxable
  # @return [Array<square.rb::OrderLineItemAppliedTax>] The list of references to `OrderReturnTax` entities applied to the
#  `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid`
#  that references the `uid` of a top-level `OrderReturnTax` that is being
#  applied to the `OrderReturnServiceCharge`. On reads, the applied amount is
#  populated.
    attr_reader :applied_taxes
  # @return [square.rb::OrderServiceChargeTreatmentType] The treatment type of the service charge.
#  See [OrderServiceChargeTreatmentType](#type-orderservicechargetreatmenttype) for
#  possible values
    attr_reader :treatment_type
  # @return [square.rb::OrderServiceChargeScope] Indicates the level at which the apportioned service charge applies. For `ORDER`
#  scoped service charges, Square generates references in `applied_service_charges`
#  on
#  all order line items that do not have them. For `LINE_ITEM` scoped service
#  charges,
#  the service charge only applies to line items with a service charge reference in
#  their
#  `applied_service_charges` field.
#  This field is immutable. To change the scope of an apportioned service charge,
#  you must delete
#  the apportioned service charge and re-add it as a new apportioned service
#  charge.
#  See [OrderServiceChargeScope](#type-orderservicechargescope) for possible values
    attr_reader :scope
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID that identifies the return service charge only within this order.
    # @param source_service_charge_uid [String] The service charge `uid` from the order containing the original
#  service charge. `source_service_charge_uid` is `null` for
#  unlinked returns.
    # @param name [String] The name of the service charge.
    # @param catalog_object_id [String] The catalog object ID of the associated
#  [OrderServiceCharge](entity:OrderServiceCharge).
    # @param catalog_version [Long] The version of the catalog object that this service charge references.
    # @param percentage [String] The percentage of the service charge, as a string representation of
#  a decimal number. For example, a value of `"7.25"` corresponds to a
#  percentage of 7.25%.
#  Either `percentage` or `amount_money` should be set, but not both.
    # @param amount_money [square.rb::Money] The amount of a non-percentage-based service charge.
#  Either `percentage` or `amount_money` should be set, but not both.
    # @param applied_money [square.rb::Money] The amount of money applied to the order by the service charge, including
#  any inclusive tax amounts, as calculated by Square.
#  - For fixed-amount service charges, `applied_money` is equal to `amount_money`.
#  - For percentage-based service charges, `applied_money` is the money calculated
#  using the percentage.
    # @param total_money [square.rb::Money] The total amount of money to collect for the service charge.
#  __NOTE__: If an inclusive tax is applied to the service charge, `total_money`
#  does not equal `applied_money` plus `total_tax_money` because the inclusive
#  tax amount is already included in both `applied_money` and `total_tax_money`.
    # @param total_tax_money [square.rb::Money] The total amount of tax money to collect for the service charge.
    # @param calculation_phase [square.rb::OrderServiceChargeCalculationPhase] The calculation phase after which to apply the service charge.
#  See
#  [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase)
#  for possible values
    # @param taxable [Boolean] Indicates whether the surcharge can be taxed. Service charges
#  calculated in the `TOTAL_PHASE` cannot be marked as taxable.
    # @param applied_taxes [Array<square.rb::OrderLineItemAppliedTax>] The list of references to `OrderReturnTax` entities applied to the
#  `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid`
#  that references the `uid` of a top-level `OrderReturnTax` that is being
#  applied to the `OrderReturnServiceCharge`. On reads, the applied amount is
#  populated.
    # @param treatment_type [square.rb::OrderServiceChargeTreatmentType] The treatment type of the service charge.
#  See [OrderServiceChargeTreatmentType](#type-orderservicechargetreatmenttype) for
#  possible values
    # @param scope [square.rb::OrderServiceChargeScope] Indicates the level at which the apportioned service charge applies. For `ORDER`
#  scoped service charges, Square generates references in `applied_service_charges`
#  on
#  all order line items that do not have them. For `LINE_ITEM` scoped service
#  charges,
#  the service charge only applies to line items with a service charge reference in
#  their
#  `applied_service_charges` field.
#  This field is immutable. To change the scope of an apportioned service charge,
#  you must delete
#  the apportioned service charge and re-add it as a new apportioned service
#  charge.
#  See [OrderServiceChargeScope](#type-orderservicechargescope) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderReturnServiceCharge]
    def initialize(uid: OMIT, source_service_charge_uid: OMIT, name: OMIT, catalog_object_id: OMIT, catalog_version: OMIT, percentage: OMIT, amount_money: OMIT, applied_money: OMIT, total_money: OMIT, total_tax_money: OMIT, calculation_phase: OMIT, taxable: OMIT, applied_taxes: OMIT, treatment_type: OMIT, scope: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @source_service_charge_uid = source_service_charge_uid if source_service_charge_uid != OMIT
      @name = name if name != OMIT
      @catalog_object_id = catalog_object_id if catalog_object_id != OMIT
      @catalog_version = catalog_version if catalog_version != OMIT
      @percentage = percentage if percentage != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @applied_money = applied_money if applied_money != OMIT
      @total_money = total_money if total_money != OMIT
      @total_tax_money = total_tax_money if total_tax_money != OMIT
      @calculation_phase = calculation_phase if calculation_phase != OMIT
      @taxable = taxable if taxable != OMIT
      @applied_taxes = applied_taxes if applied_taxes != OMIT
      @treatment_type = treatment_type if treatment_type != OMIT
      @scope = scope if scope != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "source_service_charge_uid": source_service_charge_uid, "name": name, "catalog_object_id": catalog_object_id, "catalog_version": catalog_version, "percentage": percentage, "amount_money": amount_money, "applied_money": applied_money, "total_money": total_money, "total_tax_money": total_tax_money, "calculation_phase": calculation_phase, "taxable": taxable, "applied_taxes": applied_taxes, "treatment_type": treatment_type, "scope": scope }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderReturnServiceCharge
    #
    # @param json_object [String] 
    # @return [square.rb::OrderReturnServiceCharge]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      source_service_charge_uid = parsed_json["source_service_charge_uid"]
      name = parsed_json["name"]
      catalog_object_id = parsed_json["catalog_object_id"]
      catalog_version = parsed_json["catalog_version"]
      percentage = parsed_json["percentage"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      unless parsed_json["applied_money"].nil?
        applied_money = parsed_json["applied_money"].to_json
        applied_money = square.rb::Money.from_json(json_object: applied_money)
      else
        applied_money = nil
      end
      unless parsed_json["total_money"].nil?
        total_money = parsed_json["total_money"].to_json
        total_money = square.rb::Money.from_json(json_object: total_money)
      else
        total_money = nil
      end
      unless parsed_json["total_tax_money"].nil?
        total_tax_money = parsed_json["total_tax_money"].to_json
        total_tax_money = square.rb::Money.from_json(json_object: total_tax_money)
      else
        total_tax_money = nil
      end
      calculation_phase = parsed_json["calculation_phase"]
      taxable = parsed_json["taxable"]
      applied_taxes = parsed_json["applied_taxes"]&.map do | item |
  item = item.to_json
  square.rb::OrderLineItemAppliedTax.from_json(json_object: item)
end
      treatment_type = parsed_json["treatment_type"]
      scope = parsed_json["scope"]
      new(
        uid: uid,
        source_service_charge_uid: source_service_charge_uid,
        name: name,
        catalog_object_id: catalog_object_id,
        catalog_version: catalog_version,
        percentage: percentage,
        amount_money: amount_money,
        applied_money: applied_money,
        total_money: total_money,
        total_tax_money: total_tax_money,
        calculation_phase: calculation_phase,
        taxable: taxable,
        applied_taxes: applied_taxes,
        treatment_type: treatment_type,
        scope: scope,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderReturnServiceCharge to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.source_service_charge_uid&.is_a?(String) != false || raise("Passed value for field obj.source_service_charge_uid is not the expected type, validation failed.")
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.catalog_object_id&.is_a?(String) != false || raise("Passed value for field obj.catalog_object_id is not the expected type, validation failed.")
      obj.catalog_version&.is_a?(Long) != false || raise("Passed value for field obj.catalog_version is not the expected type, validation failed.")
      obj.percentage&.is_a?(String) != false || raise("Passed value for field obj.percentage is not the expected type, validation failed.")
      obj.amount_money.nil? || square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.applied_money.nil? || square.rb::Money.validate_raw(obj: obj.applied_money)
      obj.total_money.nil? || square.rb::Money.validate_raw(obj: obj.total_money)
      obj.total_tax_money.nil? || square.rb::Money.validate_raw(obj: obj.total_tax_money)
      obj.calculation_phase&.is_a?(square.rb::OrderServiceChargeCalculationPhase) != false || raise("Passed value for field obj.calculation_phase is not the expected type, validation failed.")
      obj.taxable&.is_a?(Boolean) != false || raise("Passed value for field obj.taxable is not the expected type, validation failed.")
      obj.applied_taxes&.is_a?(Array) != false || raise("Passed value for field obj.applied_taxes is not the expected type, validation failed.")
      obj.treatment_type&.is_a?(square.rb::OrderServiceChargeTreatmentType) != false || raise("Passed value for field obj.treatment_type is not the expected type, validation failed.")
      obj.scope&.is_a?(square.rb::OrderServiceChargeScope) != false || raise("Passed value for field obj.scope is not the expected type, validation failed.")
    end
  end
end