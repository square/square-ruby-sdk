# frozen_string_literal: true
require_relative "error"
require_relative "customer_group"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the
#  [RetrieveCustomerGroup](api-endpoint:CustomerGroups-RetrieveCustomerGroup)
#  endpoint.
#  Either `errors` or `group` is present in a given response (never both).
  class GetCustomerGroupResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::CustomerGroup] The retrieved customer group.
    attr_reader :group
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param group [square.rb::CustomerGroup] The retrieved customer group.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetCustomerGroupResponse]
    def initialize(errors: OMIT, group: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @group = group if group != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "group": group }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetCustomerGroupResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetCustomerGroupResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["group"].nil?
        group = parsed_json["group"].to_json
        group = square.rb::CustomerGroup.from_json(json_object: group)
      else
        group = nil
      end
      new(
        errors: errors,
        group: group,
        additional_properties: struct
      )
    end
# Serialize an instance of GetCustomerGroupResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.group.nil? || square.rb::CustomerGroup.validate_raw(obj: obj.group)
    end
  end
end