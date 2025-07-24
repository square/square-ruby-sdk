# frozen_string_literal: true
require_relative "cash_drawer_shift"
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class GetCashDrawerShiftResponse
  # @return [square.rb::CashDrawerShift] The cash drawer shift queried for.
    attr_reader :cash_drawer_shift
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param cash_drawer_shift [square.rb::CashDrawerShift] The cash drawer shift queried for.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetCashDrawerShiftResponse]
    def initialize(cash_drawer_shift: OMIT, errors: OMIT, additional_properties: nil)
      @cash_drawer_shift = cash_drawer_shift if cash_drawer_shift != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cash_drawer_shift": cash_drawer_shift, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetCashDrawerShiftResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetCashDrawerShiftResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["cash_drawer_shift"].nil?
        cash_drawer_shift = parsed_json["cash_drawer_shift"].to_json
        cash_drawer_shift = square.rb::CashDrawerShift.from_json(json_object: cash_drawer_shift)
      else
        cash_drawer_shift = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        cash_drawer_shift: cash_drawer_shift,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetCashDrawerShiftResponse to a JSON object
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
      obj.cash_drawer_shift.nil? || square.rb::CashDrawerShift.validate_raw(obj: obj.cash_drawer_shift)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end