# frozen_string_literal: true
require_relative "catalog_discount_type"
require_relative "money"
require_relative "catalog_discount_modify_tax_basis"
require "ostruct"
require "json"

module square.rb
# A discount applicable to items.
  class CatalogDiscount
  # @return [String] The discount name. This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    attr_reader :name
  # @return [square.rb::CatalogDiscountType] Indicates whether the discount is a fixed amount or percentage, or entered at
#  the time of sale.
#  See [CatalogDiscountType](#type-catalogdiscounttype) for possible values
    attr_reader :discount_type
  # @return [String] The percentage of the discount as a string representation of a decimal number,
#  using a `.` as the decimal
#  separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`.
#  Specify a percentage of `0` if `discount_type`
#  is `VARIABLE_PERCENTAGE`.
#  Do not use this field for amount-based or variable discounts.
    attr_reader :percentage
  # @return [square.rb::Money] The amount of the discount. Specify an amount of `0` if `discount_type` is
#  `VARIABLE_AMOUNT`.
#  Do not use this field for percentage-based or variable discounts.
    attr_reader :amount_money
  # @return [Boolean] Indicates whether a mobile staff member needs to enter their PIN to apply the
#  discount to a payment in the Square Point of Sale app.
    attr_reader :pin_required
  # @return [String] The color of the discount display label in the Square Point of Sale app. This
#  must be a valid hex color code.
    attr_reader :label_color
  # @return [square.rb::CatalogDiscountModifyTaxBasis] Indicates whether this discount should reduce the price used to calculate tax.
#  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances
#  taxes must
#  be calculated based on an item's price, ignoring a particular discount. For
#  example,
#  in many US jurisdictions, a manufacturer coupon or instant rebate reduces the
#  price a
#  customer pays but does not reduce the sale price used to calculate how much
#  sales tax is
#  due. In this case, the discount representing that manufacturer coupon should
#  have
#  `DO_NOT_MODIFY_TAX_BASIS` for this field.
#  If you are unsure whether you need to use this field, consult your tax
#  professional.
#  See [CatalogDiscountModifyTaxBasis](#type-catalogdiscountmodifytaxbasis) for
#  possible values
    attr_reader :modify_tax_basis
  # @return [square.rb::Money] For a percentage discount, the maximum absolute value of the discount. For
#  example, if a
#  50% discount has a `maximum_amount_money` of $20, a $100 purchase will yield a
#  $20 discount,
#  not a $50 discount.
    attr_reader :maximum_amount_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The discount name. This is a searchable attribute for use in applicable query
#  filters, and its value length is of Unicode code points.
    # @param discount_type [square.rb::CatalogDiscountType] Indicates whether the discount is a fixed amount or percentage, or entered at
#  the time of sale.
#  See [CatalogDiscountType](#type-catalogdiscounttype) for possible values
    # @param percentage [String] The percentage of the discount as a string representation of a decimal number,
#  using a `.` as the decimal
#  separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`.
#  Specify a percentage of `0` if `discount_type`
#  is `VARIABLE_PERCENTAGE`.
#  Do not use this field for amount-based or variable discounts.
    # @param amount_money [square.rb::Money] The amount of the discount. Specify an amount of `0` if `discount_type` is
#  `VARIABLE_AMOUNT`.
#  Do not use this field for percentage-based or variable discounts.
    # @param pin_required [Boolean] Indicates whether a mobile staff member needs to enter their PIN to apply the
#  discount to a payment in the Square Point of Sale app.
    # @param label_color [String] The color of the discount display label in the Square Point of Sale app. This
#  must be a valid hex color code.
    # @param modify_tax_basis [square.rb::CatalogDiscountModifyTaxBasis] Indicates whether this discount should reduce the price used to calculate tax.
#  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances
#  taxes must
#  be calculated based on an item's price, ignoring a particular discount. For
#  example,
#  in many US jurisdictions, a manufacturer coupon or instant rebate reduces the
#  price a
#  customer pays but does not reduce the sale price used to calculate how much
#  sales tax is
#  due. In this case, the discount representing that manufacturer coupon should
#  have
#  `DO_NOT_MODIFY_TAX_BASIS` for this field.
#  If you are unsure whether you need to use this field, consult your tax
#  professional.
#  See [CatalogDiscountModifyTaxBasis](#type-catalogdiscountmodifytaxbasis) for
#  possible values
    # @param maximum_amount_money [square.rb::Money] For a percentage discount, the maximum absolute value of the discount. For
#  example, if a
#  50% discount has a `maximum_amount_money` of $20, a $100 purchase will yield a
#  $20 discount,
#  not a $50 discount.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogDiscount]
    def initialize(name: OMIT, discount_type: OMIT, percentage: OMIT, amount_money: OMIT, pin_required: OMIT, label_color: OMIT, modify_tax_basis: OMIT, maximum_amount_money: OMIT, additional_properties: nil)
      @name = name if name != OMIT
      @discount_type = discount_type if discount_type != OMIT
      @percentage = percentage if percentage != OMIT
      @amount_money = amount_money if amount_money != OMIT
      @pin_required = pin_required if pin_required != OMIT
      @label_color = label_color if label_color != OMIT
      @modify_tax_basis = modify_tax_basis if modify_tax_basis != OMIT
      @maximum_amount_money = maximum_amount_money if maximum_amount_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "discount_type": discount_type, "percentage": percentage, "amount_money": amount_money, "pin_required": pin_required, "label_color": label_color, "modify_tax_basis": modify_tax_basis, "maximum_amount_money": maximum_amount_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogDiscount
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogDiscount]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      discount_type = parsed_json["discount_type"]
      percentage = parsed_json["percentage"]
      unless parsed_json["amount_money"].nil?
        amount_money = parsed_json["amount_money"].to_json
        amount_money = square.rb::Money.from_json(json_object: amount_money)
      else
        amount_money = nil
      end
      pin_required = parsed_json["pin_required"]
      label_color = parsed_json["label_color"]
      modify_tax_basis = parsed_json["modify_tax_basis"]
      unless parsed_json["maximum_amount_money"].nil?
        maximum_amount_money = parsed_json["maximum_amount_money"].to_json
        maximum_amount_money = square.rb::Money.from_json(json_object: maximum_amount_money)
      else
        maximum_amount_money = nil
      end
      new(
        name: name,
        discount_type: discount_type,
        percentage: percentage,
        amount_money: amount_money,
        pin_required: pin_required,
        label_color: label_color,
        modify_tax_basis: modify_tax_basis,
        maximum_amount_money: maximum_amount_money,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogDiscount to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.discount_type&.is_a?(square.rb::CatalogDiscountType) != false || raise("Passed value for field obj.discount_type is not the expected type, validation failed.")
      obj.percentage&.is_a?(String) != false || raise("Passed value for field obj.percentage is not the expected type, validation failed.")
      obj.amount_money.nil? || square.rb::Money.validate_raw(obj: obj.amount_money)
      obj.pin_required&.is_a?(Boolean) != false || raise("Passed value for field obj.pin_required is not the expected type, validation failed.")
      obj.label_color&.is_a?(String) != false || raise("Passed value for field obj.label_color is not the expected type, validation failed.")
      obj.modify_tax_basis&.is_a?(square.rb::CatalogDiscountModifyTaxBasis) != false || raise("Passed value for field obj.modify_tax_basis is not the expected type, validation failed.")
      obj.maximum_amount_money.nil? || square.rb::Money.validate_raw(obj: obj.maximum_amount_money)
    end
  end
end