# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Describes a custom form field to add to the checkout page to collect more
#  information from buyers during checkout.
#  For more information,
#  see [Specify checkout
#  /docs/checkout-api/optional-checkout-configurations#specify-checkout-options-1).
  class CustomField
  # @return [String] The title of the custom field.
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title of the custom field.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CustomField]
    def initialize(title:, additional_properties: nil)
      @title = title
      @additional_properties = additional_properties
      @_field_set = { "title": title }
    end
# Deserialize a JSON object to an instance of CustomField
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CustomField]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      new(title: title, additional_properties: struct)
    end
# Serialize an instance of CustomField to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end