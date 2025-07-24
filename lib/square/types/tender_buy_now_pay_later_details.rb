# frozen_string_literal: true
require_relative "tender_buy_now_pay_later_details_brand"
require_relative "tender_buy_now_pay_later_details_status"
require "ostruct"
require "json"

module square.rb
# Represents the details of a tender with `type` `BUY_NOW_PAY_LATER`.
  class TenderBuyNowPayLaterDetails
  # @return [square.rb::TenderBuyNowPayLaterDetailsBrand] The Buy Now Pay Later brand.
#  See [Brand](#type-brand) for possible values
    attr_reader :buy_now_pay_later_brand
  # @return [square.rb::TenderBuyNowPayLaterDetailsStatus] The buy now pay later payment's current state (such as `AUTHORIZED` or
#  `CAPTURED`). See
#  [TenderBuyNowPayLaterDetailsStatus](entity:TenderBuyNowPayLaterDetailsStatus)
#  for possible values.
#  See [Status](#type-status) for possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param buy_now_pay_later_brand [square.rb::TenderBuyNowPayLaterDetailsBrand] The Buy Now Pay Later brand.
#  See [Brand](#type-brand) for possible values
    # @param status [square.rb::TenderBuyNowPayLaterDetailsStatus] The buy now pay later payment's current state (such as `AUTHORIZED` or
#  `CAPTURED`). See
#  [TenderBuyNowPayLaterDetailsStatus](entity:TenderBuyNowPayLaterDetailsStatus)
#  for possible values.
#  See [Status](#type-status) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TenderBuyNowPayLaterDetails]
    def initialize(buy_now_pay_later_brand: OMIT, status: OMIT, additional_properties: nil)
      @buy_now_pay_later_brand = buy_now_pay_later_brand if buy_now_pay_later_brand != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "buy_now_pay_later_brand": buy_now_pay_later_brand, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TenderBuyNowPayLaterDetails
    #
    # @param json_object [String] 
    # @return [square.rb::TenderBuyNowPayLaterDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      buy_now_pay_later_brand = parsed_json["buy_now_pay_later_brand"]
      status = parsed_json["status"]
      new(
        buy_now_pay_later_brand: buy_now_pay_later_brand,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of TenderBuyNowPayLaterDetails to a JSON object
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
      obj.buy_now_pay_later_brand&.is_a?(square.rb::TenderBuyNowPayLaterDetailsBrand) != false || raise("Passed value for field obj.buy_now_pay_later_brand is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::TenderBuyNowPayLaterDetailsStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end