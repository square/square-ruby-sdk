# frozen_string_literal: true
require_relative "employee_wage"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# The response to a request for a set of `EmployeeWage` objects. The response
#  contains
#  a set of `EmployeeWage` objects.
  class ListEmployeeWagesResponse
  # @return [Array<square.rb::EmployeeWage>] A page of `EmployeeWage` results.
    attr_reader :employee_wages
  # @return [String] The value supplied in the subsequent request to fetch the next page
#  of `EmployeeWage` results.
    attr_reader :cursor
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param employee_wages [Array<square.rb::EmployeeWage>] A page of `EmployeeWage` results.
    # @param cursor [String] The value supplied in the subsequent request to fetch the next page
#  of `EmployeeWage` results.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListEmployeeWagesResponse]
    def initialize(employee_wages: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @employee_wages = employee_wages if employee_wages != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "employee_wages": employee_wages, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListEmployeeWagesResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListEmployeeWagesResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      employee_wages = parsed_json["employee_wages"]&.map do | item |
  item = item.to_json
  square.rb::EmployeeWage.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        employee_wages: employee_wages,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListEmployeeWagesResponse to a JSON object
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
      obj.employee_wages&.is_a?(Array) != false || raise("Passed value for field obj.employee_wages is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end