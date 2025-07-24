# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Additional details about Afterpay payments.
  class AfterpayDetails
  # @return [String] Email address on the buyer's Afterpay account.
    attr_reader :email_address
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email_address [String] Email address on the buyer's Afterpay account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::AfterpayDetails]
    def initialize(email_address: OMIT, additional_properties: nil)
      @email_address = email_address if email_address != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email_address": email_address }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AfterpayDetails
    #
    # @param json_object [String] 
    # @return [square.rb::AfterpayDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email_address = parsed_json["email_address"]
      new(email_address: email_address, additional_properties: struct)
    end
# Serialize an instance of AfterpayDetails to a JSON object
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
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
    end
  end
end