# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# A collection of various money amounts.
  class OrderMoneyAmounts
  # @return [square.rb::Money] The total money.
    attr_reader :total_money
  # @return [square.rb::Money] The money associated with taxes.
    attr_reader :tax_money
  # @return [square.rb::Money] The money associated with discounts.
    attr_reader :discount_money
  # @return [square.rb::Money] The money associated with tips.
    attr_reader :tip_money
  # @return [square.rb::Money] The money associated with service charges.
    attr_reader :service_charge_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param total_money [square.rb::Money] The total money.
    # @param tax_money [square.rb::Money] The money associated with taxes.
    # @param discount_money [square.rb::Money] The money associated with discounts.
    # @param tip_money [square.rb::Money] The money associated with tips.
    # @param service_charge_money [square.rb::Money] The money associated with service charges.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OrderMoneyAmounts]
    def initialize(total_money: OMIT, tax_money: OMIT, discount_money: OMIT, tip_money: OMIT, service_charge_money: OMIT, additional_properties: nil)
      @total_money = total_money if total_money != OMIT
      @tax_money = tax_money if tax_money != OMIT
      @discount_money = discount_money if discount_money != OMIT
      @tip_money = tip_money if tip_money != OMIT
      @service_charge_money = service_charge_money if service_charge_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "total_money": total_money, "tax_money": tax_money, "discount_money": discount_money, "tip_money": tip_money, "service_charge_money": service_charge_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrderMoneyAmounts
    #
    # @param json_object [String] 
    # @return [square.rb::OrderMoneyAmounts]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["total_money"].nil?
        total_money = parsed_json["total_money"].to_json
        total_money = square.rb::Money.from_json(json_object: total_money)
      else
        total_money = nil
      end
      unless parsed_json["tax_money"].nil?
        tax_money = parsed_json["tax_money"].to_json
        tax_money = square.rb::Money.from_json(json_object: tax_money)
      else
        tax_money = nil
      end
      unless parsed_json["discount_money"].nil?
        discount_money = parsed_json["discount_money"].to_json
        discount_money = square.rb::Money.from_json(json_object: discount_money)
      else
        discount_money = nil
      end
      unless parsed_json["tip_money"].nil?
        tip_money = parsed_json["tip_money"].to_json
        tip_money = square.rb::Money.from_json(json_object: tip_money)
      else
        tip_money = nil
      end
      unless parsed_json["service_charge_money"].nil?
        service_charge_money = parsed_json["service_charge_money"].to_json
        service_charge_money = square.rb::Money.from_json(json_object: service_charge_money)
      else
        service_charge_money = nil
      end
      new(
        total_money: total_money,
        tax_money: tax_money,
        discount_money: discount_money,
        tip_money: tip_money,
        service_charge_money: service_charge_money,
        additional_properties: struct
      )
    end
# Serialize an instance of OrderMoneyAmounts to a JSON object
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
      obj.total_money.nil? || square.rb::Money.validate_raw(obj: obj.total_money)
      obj.tax_money.nil? || square.rb::Money.validate_raw(obj: obj.tax_money)
      obj.discount_money.nil? || square.rb::Money.validate_raw(obj: obj.discount_money)
      obj.tip_money.nil? || square.rb::Money.validate_raw(obj: obj.tip_money)
      obj.service_charge_money.nil? || square.rb::Money.validate_raw(obj: obj.service_charge_money)
    end
  end
end