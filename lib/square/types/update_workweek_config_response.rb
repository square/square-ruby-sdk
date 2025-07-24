# frozen_string_literal: true
require_relative "workweek_config"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# The response to a request to update a `WorkweekConfig` object. The response
#  contains
#  the updated `WorkweekConfig` object and might contain a set of `Error` objects
#  if
#  the request resulted in errors.
  class UpdateWorkweekConfigResponse
  # @return [square.rb::WorkweekConfig] The response object.
    attr_reader :workweek_config
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workweek_config [square.rb::WorkweekConfig] The response object.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::UpdateWorkweekConfigResponse]
    def initialize(workweek_config: OMIT, errors: OMIT, additional_properties: nil)
      @workweek_config = workweek_config if workweek_config != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "workweek_config": workweek_config, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateWorkweekConfigResponse
    #
    # @param json_object [String] 
    # @return [square.rb::UpdateWorkweekConfigResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["workweek_config"].nil?
        workweek_config = parsed_json["workweek_config"].to_json
        workweek_config = square.rb::WorkweekConfig.from_json(json_object: workweek_config)
      else
        workweek_config = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        workweek_config: workweek_config,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateWorkweekConfigResponse to a JSON object
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
      obj.workweek_config.nil? || square.rb::WorkweekConfig.validate_raw(obj: obj.workweek_config)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end