# frozen_string_literal: true
require_relative "invoice_canceled_event_object"
require "ostruct"
require "json"

module square.rb
  class InvoiceCanceledEventData
  # @return [String] Name of the affected object’s type, `"invoice"`.
    attr_reader :type
  # @return [String] ID of the affected invoice.
    attr_reader :id
  # @return [square.rb::InvoiceCanceledEventObject] An object containing the canceled invoice.
    attr_reader :object
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] Name of the affected object’s type, `"invoice"`.
    # @param id [String] ID of the affected invoice.
    # @param object [square.rb::InvoiceCanceledEventObject] An object containing the canceled invoice.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoiceCanceledEventData]
    def initialize(type: OMIT, id: OMIT, object: OMIT, additional_properties: nil)
      @type = type if type != OMIT
      @id = id if id != OMIT
      @object = object if object != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "id": id, "object": object }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceCanceledEventData
    #
    # @param json_object [String] 
    # @return [square.rb::InvoiceCanceledEventData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      id = parsed_json["id"]
      unless parsed_json["object"].nil?
        object = parsed_json["object"].to_json
        object = square.rb::InvoiceCanceledEventObject.from_json(json_object: object)
      else
        object = nil
      end
      new(
        type: type,
        id: id,
        object: object,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceCanceledEventData to a JSON object
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
      obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.object.nil? || square.rb::InvoiceCanceledEventObject.validate_raw(obj: obj.object)
    end
  end
end