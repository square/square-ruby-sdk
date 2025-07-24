# frozen_string_literal: true
require_relative "employee"
require_relative "error"
require "ostruct"
require "json"

module square.rb
  class GetEmployeeResponse
  # @return [square.rb::Employee] 
    attr_reader :employee
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param employee [square.rb::Employee] 
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetEmployeeResponse]
    def initialize(employee: OMIT, errors: OMIT, additional_properties: nil)
      @employee = employee if employee != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "employee": employee, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetEmployeeResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetEmployeeResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["employee"].nil?
        employee = parsed_json["employee"].to_json
        employee = square.rb::Employee.from_json(json_object: employee)
      else
        employee = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        employee: employee,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetEmployeeResponse to a JSON object
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
      obj.employee.nil? || square.rb::Employee.validate_raw(obj: obj.employee)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end