# frozen_string_literal: true
require_relative "payout"
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class GetPayoutResponse
  # @return [square.rb::Payout] The requested payout.
    attr_reader :payout
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payout [square.rb::Payout] The requested payout.
    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetPayoutResponse]
    def initialize(payout: OMIT, errors: OMIT, additional_properties: nil)
      @payout = payout if payout != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payout": payout, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetPayoutResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetPayoutResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["payout"].nil?
        payout = parsed_json["payout"].to_json
        payout = square.rb::Payout.from_json(json_object: payout)
      else
        payout = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        payout: payout,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetPayoutResponse to a JSON object
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
      obj.payout.nil? || square.rb::Payout.validate_raw(obj: obj.payout)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end