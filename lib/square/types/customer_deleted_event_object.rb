# frozen_string_literal: true
require_relative "customer"
require_relative "customer_deleted_event_event_context"
require "ostruct"
require "json"

module square.rb
# An object that contains the customer associated with the event.
  class CustomerDeletedEventObject
  # @return [square.rb::Customer] The deleted customer.
    attr_reader :customer
  # @return [square.rb::CustomerDeletedEventEventContext] Information about the change that triggered the event. This field is returned
#  only if the customer is deleted by a merge operation.
    attr_reader :event_context
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param customer [square.rb::Customer] The deleted customer.
    # @param event_context [square.rb::CustomerDeletedEventEventContext] Information about the change that triggered the event. This field is returned
#  only if the customer is deleted by a merge operation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerDeletedEventObject]
    def initialize(customer: OMIT, event_context: OMIT, additional_properties: nil)
      @customer = customer if customer != OMIT
      @event_context = event_context if event_context != OMIT
      @additional_properties = additional_properties
      @_field_set = { "customer": customer, "event_context": event_context }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerDeletedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerDeletedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["customer"].nil?
        customer = parsed_json["customer"].to_json
        customer = square.rb::Customer.from_json(json_object: customer)
      else
        customer = nil
      end
      unless parsed_json["event_context"].nil?
        event_context = parsed_json["event_context"].to_json
        event_context = square.rb::CustomerDeletedEventEventContext.from_json(json_object: event_context)
      else
        event_context = nil
      end
      new(
        customer: customer,
        event_context: event_context,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerDeletedEventObject to a JSON object
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
      obj.customer.nil? || square.rb::Customer.validate_raw(obj: obj.customer)
      obj.event_context.nil? || square.rb::CustomerDeletedEventEventContext.validate_raw(obj: obj.event_context)
    end
  end
end