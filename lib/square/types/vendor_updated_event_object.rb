# frozen_string_literal: true
require_relative "vendor_updated_event_object_operation"
require_relative "vendor"
require "ostruct"
require "json"

module square.rb
  class VendorUpdatedEventObject
  # @return [square.rb::VENDOR_UPDATED_EVENT_OBJECT_OPERATION] The operation on the vendor that caused the event to be published. The value is
#  `UPDATED`.
#  See [Operation](#type-operation) for possible values
    attr_reader :operation
  # @return [square.rb::Vendor] The updated vendor as the result of the specified operation.
    attr_reader :vendor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param operation [square.rb::VENDOR_UPDATED_EVENT_OBJECT_OPERATION] The operation on the vendor that caused the event to be published. The value is
#  `UPDATED`.
#  See [Operation](#type-operation) for possible values
    # @param vendor [square.rb::Vendor] The updated vendor as the result of the specified operation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::VendorUpdatedEventObject]
    def initialize(operation: OMIT, vendor: OMIT, additional_properties: nil)
      @operation = operation if operation != OMIT
      @vendor = vendor if vendor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "operation": operation, "vendor": vendor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VendorUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::VendorUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      operation = parsed_json["operation"]
      unless parsed_json["vendor"].nil?
        vendor = parsed_json["vendor"].to_json
        vendor = square.rb::Vendor.from_json(json_object: vendor)
      else
        vendor = nil
      end
      new(
        operation: operation,
        vendor: vendor,
        additional_properties: struct
      )
    end
# Serialize an instance of VendorUpdatedEventObject to a JSON object
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
      obj.operation&.is_a?(String) != false || raise("Passed value for field obj.operation is not the expected type, validation failed.")
      obj.vendor.nil? || square.rb::Vendor.validate_raw(obj: obj.vendor)
    end
  end
end