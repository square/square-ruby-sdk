# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class CollectedData
  # @return [String] The buyer's input text.
    attr_reader :input_text
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param input_text [String] The buyer's input text.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CollectedData]
    def initialize(input_text: OMIT, additional_properties: nil)
      @input_text = input_text if input_text != OMIT
      @additional_properties = additional_properties
      @_field_set = { "input_text": input_text }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CollectedData
    #
    # @param json_object [String] 
    # @return [square.rb::CollectedData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      input_text = parsed_json["input_text"]
      new(input_text: input_text, additional_properties: struct)
    end
# Serialize an instance of CollectedData to a JSON object
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
      obj.input_text&.is_a?(String) != false || raise("Passed value for field obj.input_text is not the expected type, validation failed.")
    end
  end
end