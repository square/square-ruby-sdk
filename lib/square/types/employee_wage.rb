# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module square.rb
# The hourly wage rate that an employee earns on a `Shift` for doing the job
#  specified by the `title` property of this object. Deprecated at version
#  2020-08-26. Use [TeamMemberWage](entity:TeamMemberWage).
  class EmployeeWage
  # @return [String] The UUID for this object.
    attr_reader :id
  # @return [String] The `Employee` that this wage is assigned to.
    attr_reader :employee_id
  # @return [String] The job title that this wage relates to.
    attr_reader :title
  # @return [square.rb::Money] Can be a custom-set hourly wage or the calculated effective hourly
#  wage based on the annual wage and hours worked per week.
    attr_reader :hourly_rate
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The UUID for this object.
    # @param employee_id [String] The `Employee` that this wage is assigned to.
    # @param title [String] The job title that this wage relates to.
    # @param hourly_rate [square.rb::Money] Can be a custom-set hourly wage or the calculated effective hourly
#  wage based on the annual wage and hours worked per week.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::EmployeeWage]
    def initialize(id: OMIT, employee_id: OMIT, title: OMIT, hourly_rate: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @employee_id = employee_id if employee_id != OMIT
      @title = title if title != OMIT
      @hourly_rate = hourly_rate if hourly_rate != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "employee_id": employee_id, "title": title, "hourly_rate": hourly_rate }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EmployeeWage
    #
    # @param json_object [String] 
    # @return [square.rb::EmployeeWage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      employee_id = parsed_json["employee_id"]
      title = parsed_json["title"]
      unless parsed_json["hourly_rate"].nil?
        hourly_rate = parsed_json["hourly_rate"].to_json
        hourly_rate = square.rb::Money.from_json(json_object: hourly_rate)
      else
        hourly_rate = nil
      end
      new(
        id: id,
        employee_id: employee_id,
        title: title,
        hourly_rate: hourly_rate,
        additional_properties: struct
      )
    end
# Serialize an instance of EmployeeWage to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.employee_id&.is_a?(String) != false || raise("Passed value for field obj.employee_id is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.hourly_rate.nil? || square.rb::Money.validate_raw(obj: obj.hourly_rate)
    end
  end
end