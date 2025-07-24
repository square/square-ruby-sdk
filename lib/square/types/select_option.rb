# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class SelectOption
  # @return [String] The reference id for the option.
    attr_reader :reference_id
  # @return [String] The title text that displays in the select option button.
    attr_reader :title
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param reference_id [String] The reference id for the option.
    # @param title [String] The title text that displays in the select option button.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SelectOption]
    def initialize(reference_id:, title:, additional_properties: nil)
      @reference_id = reference_id
      @title = title
      @additional_properties = additional_properties
      @_field_set = { "reference_id": reference_id, "title": title }
    end
# Deserialize a JSON object to an instance of SelectOption
    #
    # @param json_object [String] 
    # @return [square.rb::SelectOption]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      reference_id = parsed_json["reference_id"]
      title = parsed_json["title"]
      new(
        reference_id: reference_id,
        title: title,
        additional_properties: struct
      )
    end
# Serialize an instance of SelectOption to a JSON object
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
      obj.reference_id.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
    end
  end
end