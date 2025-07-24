# frozen_string_literal: true
require_relative "employee_status"
require "ostruct"
require "json"

module square.rb
# An employee object that is used by the external API.
#  DEPRECATED at version 2020-08-26. Replaced by [TeamMember](entity:TeamMember).
  class Employee
  # @return [String] UUID for this object.
    attr_reader :id
  # @return [String] The employee's first name.
    attr_reader :first_name
  # @return [String] The employee's last name.
    attr_reader :last_name
  # @return [String] The employee's email address
    attr_reader :email
  # @return [String] The employee's phone number in E.164 format, i.e. "+12125554250"
    attr_reader :phone_number
  # @return [Array<String>] A list of location IDs where this employee has access to.
    attr_reader :location_ids
  # @return [square.rb::EmployeeStatus] Specifies the status of the employees being fetched.
#  See [EmployeeStatus](#type-employeestatus) for possible values
    attr_reader :status
  # @return [Boolean] Whether this employee is the owner of the merchant. Each merchant
#  has one owner employee, and that employee has full authority over
#  the account.
    attr_reader :is_owner
  # @return [String] A read-only timestamp in RFC 3339 format.
    attr_reader :created_at
  # @return [String] A read-only timestamp in RFC 3339 format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] UUID for this object.
    # @param first_name [String] The employee's first name.
    # @param last_name [String] The employee's last name.
    # @param email [String] The employee's email address
    # @param phone_number [String] The employee's phone number in E.164 format, i.e. "+12125554250"
    # @param location_ids [Array<String>] A list of location IDs where this employee has access to.
    # @param status [square.rb::EmployeeStatus] Specifies the status of the employees being fetched.
#  See [EmployeeStatus](#type-employeestatus) for possible values
    # @param is_owner [Boolean] Whether this employee is the owner of the merchant. Each merchant
#  has one owner employee, and that employee has full authority over
#  the account.
    # @param created_at [String] A read-only timestamp in RFC 3339 format.
    # @param updated_at [String] A read-only timestamp in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Employee]
    def initialize(id: OMIT, first_name: OMIT, last_name: OMIT, email: OMIT, phone_number: OMIT, location_ids: OMIT, status: OMIT, is_owner: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @first_name = first_name if first_name != OMIT
      @last_name = last_name if last_name != OMIT
      @email = email if email != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @location_ids = location_ids if location_ids != OMIT
      @status = status if status != OMIT
      @is_owner = is_owner if is_owner != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "first_name": first_name, "last_name": last_name, "email": email, "phone_number": phone_number, "location_ids": location_ids, "status": status, "is_owner": is_owner, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Employee
    #
    # @param json_object [String] 
    # @return [square.rb::Employee]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      first_name = parsed_json["first_name"]
      last_name = parsed_json["last_name"]
      email = parsed_json["email"]
      phone_number = parsed_json["phone_number"]
      location_ids = parsed_json["location_ids"]
      status = parsed_json["status"]
      is_owner = parsed_json["is_owner"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        first_name: first_name,
        last_name: last_name,
        email: email,
        phone_number: phone_number,
        location_ids: location_ids,
        status: status,
        is_owner: is_owner,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of Employee to a JSON object
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
      obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
      obj.email&.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.location_ids&.is_a?(Array) != false || raise("Passed value for field obj.location_ids is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::EmployeeStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.is_owner&.is_a?(Boolean) != false || raise("Passed value for field obj.is_owner is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end