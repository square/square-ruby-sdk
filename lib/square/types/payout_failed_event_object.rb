# frozen_string_literal: true
require_relative "payout"
require "ostruct"
require "json"

module square.rb
  class PayoutFailedEventObject
  # @return [square.rb::Payout] The payout that failed.
    attr_reader :payout
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payout [square.rb::Payout] The payout that failed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PayoutFailedEventObject]
    def initialize(payout: OMIT, additional_properties: nil)
      @payout = payout if payout != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payout": payout }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PayoutFailedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::PayoutFailedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["payout"].nil?
        payout = parsed_json["payout"].to_json
        payout = square.rb::Payout.from_json(json_object: payout)
      else
        payout = nil
      end
      new(payout: payout, additional_properties: struct)
    end
# Serialize an instance of PayoutFailedEventObject to a JSON object
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
    end
  end
end