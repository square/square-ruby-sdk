# frozen_string_literal: true
require_relative "loyalty_program"
require "ostruct"
require "json"

module square.rb
# An object that contains the loyalty program associated with a
#  `loyalty.program.created` event.
  class LoyaltyProgramCreatedEventObject
  # @return [square.rb::LoyaltyProgram] The loyalty program that was created.
    attr_reader :loyalty_program
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param loyalty_program [square.rb::LoyaltyProgram] The loyalty program that was created.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::LoyaltyProgramCreatedEventObject]
    def initialize(loyalty_program: OMIT, additional_properties: nil)
      @loyalty_program = loyalty_program if loyalty_program != OMIT
      @additional_properties = additional_properties
      @_field_set = { "loyalty_program": loyalty_program }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of LoyaltyProgramCreatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::LoyaltyProgramCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["loyalty_program"].nil?
        loyalty_program = parsed_json["loyalty_program"].to_json
        loyalty_program = square.rb::LoyaltyProgram.from_json(json_object: loyalty_program)
      else
        loyalty_program = nil
      end
      new(loyalty_program: loyalty_program, additional_properties: struct)
    end
# Serialize an instance of LoyaltyProgramCreatedEventObject to a JSON object
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
      obj.loyalty_program.nil? || square.rb::LoyaltyProgram.validate_raw(obj: obj.loyalty_program)
    end
  end
end