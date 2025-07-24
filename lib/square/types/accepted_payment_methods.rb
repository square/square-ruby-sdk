# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
  class AcceptedPaymentMethods
  # @return [Boolean] Whether Apple Pay is accepted at checkout.
    attr_reader :apple_pay
  # @return [Boolean] Whether Google Pay is accepted at checkout.
    attr_reader :google_pay
  # @return [Boolean] Whether Cash App Pay is accepted at checkout.
    attr_reader :cash_app_pay
  # @return [Boolean] Whether Afterpay/Clearpay is accepted at checkout.
    attr_reader :afterpay_clearpay
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param apple_pay [Boolean] Whether Apple Pay is accepted at checkout.
    # @param google_pay [Boolean] Whether Google Pay is accepted at checkout.
    # @param cash_app_pay [Boolean] Whether Cash App Pay is accepted at checkout.
    # @param afterpay_clearpay [Boolean] Whether Afterpay/Clearpay is accepted at checkout.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::AcceptedPaymentMethods]
    def initialize(apple_pay: OMIT, google_pay: OMIT, cash_app_pay: OMIT, afterpay_clearpay: OMIT, additional_properties: nil)
      @apple_pay = apple_pay if apple_pay != OMIT
      @google_pay = google_pay if google_pay != OMIT
      @cash_app_pay = cash_app_pay if cash_app_pay != OMIT
      @afterpay_clearpay = afterpay_clearpay if afterpay_clearpay != OMIT
      @additional_properties = additional_properties
      @_field_set = { "apple_pay": apple_pay, "google_pay": google_pay, "cash_app_pay": cash_app_pay, "afterpay_clearpay": afterpay_clearpay }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AcceptedPaymentMethods
    #
    # @param json_object [String] 
    # @return [SquareApiClient::AcceptedPaymentMethods]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      apple_pay = parsed_json["apple_pay"]
      google_pay = parsed_json["google_pay"]
      cash_app_pay = parsed_json["cash_app_pay"]
      afterpay_clearpay = parsed_json["afterpay_clearpay"]
      new(
        apple_pay: apple_pay,
        google_pay: google_pay,
        cash_app_pay: cash_app_pay,
        afterpay_clearpay: afterpay_clearpay,
        additional_properties: struct
      )
    end
# Serialize an instance of AcceptedPaymentMethods to a JSON object
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
      obj.apple_pay&.is_a?(Boolean) != false || raise("Passed value for field obj.apple_pay is not the expected type, validation failed.")
      obj.google_pay&.is_a?(Boolean) != false || raise("Passed value for field obj.google_pay is not the expected type, validation failed.")
      obj.cash_app_pay&.is_a?(Boolean) != false || raise("Passed value for field obj.cash_app_pay is not the expected type, validation failed.")
      obj.afterpay_clearpay&.is_a?(Boolean) != false || raise("Passed value for field obj.afterpay_clearpay is not the expected type, validation failed.")
    end
  end
end