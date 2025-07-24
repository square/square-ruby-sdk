# frozen_string_literal: true
require_relative "employee_wage"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# A response to a request to get an `EmployeeWage`. The response contains
#  the requested `EmployeeWage` objects and might contain a set of `Error` objects
#  if
#  the request resulted in errors.
  class GetEmployeeWageResponse
  # @return [SquareApiClient::EmployeeWage] The requested `EmployeeWage` object.
    attr_reader :employee_wage
  # @return [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param employee_wage [SquareApiClient::EmployeeWage] The requested `EmployeeWage` object.
    # @param errors [Array<SquareApiClient::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GetEmployeeWageResponse]
    def initialize(employee_wage: OMIT, errors: OMIT, additional_properties: nil)
      @employee_wage = employee_wage if employee_wage != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "employee_wage": employee_wage, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetEmployeeWageResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GetEmployeeWageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["employee_wage"].nil?
        employee_wage = parsed_json["employee_wage"].to_json
        employee_wage = SquareApiClient::EmployeeWage.from_json(json_object: employee_wage)
      else
        employee_wage = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        employee_wage: employee_wage,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetEmployeeWageResponse to a JSON object
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
      obj.employee_wage.nil? || SquareApiClient::EmployeeWage.validate_raw(obj: obj.employee_wage)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end