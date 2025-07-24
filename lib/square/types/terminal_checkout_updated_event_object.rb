# frozen_string_literal: true
require_relative "terminal_checkout"
require "ostruct"
require "json"

module square.rb
  class TerminalCheckoutUpdatedEventObject
  # @return [square.rb::TerminalCheckout] The updated terminal checkout
    attr_reader :checkout
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param checkout [square.rb::TerminalCheckout] The updated terminal checkout
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::TerminalCheckoutUpdatedEventObject]
    def initialize(checkout: OMIT, additional_properties: nil)
      @checkout = checkout if checkout != OMIT
      @additional_properties = additional_properties
      @_field_set = { "checkout": checkout }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TerminalCheckoutUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::TerminalCheckoutUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["checkout"].nil?
        checkout = parsed_json["checkout"].to_json
        checkout = square.rb::TerminalCheckout.from_json(json_object: checkout)
      else
        checkout = nil
      end
      new(checkout: checkout, additional_properties: struct)
    end
# Serialize an instance of TerminalCheckoutUpdatedEventObject to a JSON object
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
      obj.checkout.nil? || square.rb::TerminalCheckout.validate_raw(obj: obj.checkout)
    end
  end
end