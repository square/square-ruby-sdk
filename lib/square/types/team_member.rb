# frozen_string_literal: true
require_relative "team_member_status"
require_relative "team_member_assigned_locations"
require_relative "wage_setting"
require "ostruct"
require "json"

module SquareApiClient
# A record representing an individual team member for a business.
  class TeamMember
  # @return [String] The unique ID for the team member.
    attr_reader :id
  # @return [String] A second ID used to associate the team member with an entity in another system.
    attr_reader :reference_id
  # @return [Boolean] Whether the team member is the owner of the Square account.
    attr_reader :is_owner
  # @return [SquareApiClient::TeamMemberStatus] Describes the status of the team member.
#  See [TeamMemberStatus](#type-teammemberstatus) for possible values
    attr_reader :status
  # @return [String] The given name (that is, the first name) associated with the team member.
    attr_reader :given_name
  # @return [String] The family name (that is, the last name) associated with the team member.
    attr_reader :family_name
  # @return [String] The email address associated with the team member. After accepting the
#  invitation
#  from Square, only the team member can change this value.
    attr_reader :email_address
  # @return [String] The team member's phone number, in E.164 format. For example:
#  +14155552671 - the country code is 1 for US
#  +551155256325 - the country code is 55 for BR
    attr_reader :phone_number
  # @return [String] The timestamp when the team member was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the team member was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [SquareApiClient::TeamMemberAssignedLocations] Describes the team member's assigned locations.
    attr_reader :assigned_locations
  # @return [SquareApiClient::WageSetting] Information about the team member's overtime exemption status, job assignments,
#  and compensation.
    attr_reader :wage_setting
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The unique ID for the team member.
    # @param reference_id [String] A second ID used to associate the team member with an entity in another system.
    # @param is_owner [Boolean] Whether the team member is the owner of the Square account.
    # @param status [SquareApiClient::TeamMemberStatus] Describes the status of the team member.
#  See [TeamMemberStatus](#type-teammemberstatus) for possible values
    # @param given_name [String] The given name (that is, the first name) associated with the team member.
    # @param family_name [String] The family name (that is, the last name) associated with the team member.
    # @param email_address [String] The email address associated with the team member. After accepting the
#  invitation
#  from Square, only the team member can change this value.
    # @param phone_number [String] The team member's phone number, in E.164 format. For example:
#  +14155552671 - the country code is 1 for US
#  +551155256325 - the country code is 55 for BR
    # @param created_at [String] The timestamp when the team member was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the team member was last updated, in RFC 3339 format.
    # @param assigned_locations [SquareApiClient::TeamMemberAssignedLocations] Describes the team member's assigned locations.
    # @param wage_setting [SquareApiClient::WageSetting] Information about the team member's overtime exemption status, job assignments,
#  and compensation.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TeamMember]
    def initialize(id: OMIT, reference_id: OMIT, is_owner: OMIT, status: OMIT, given_name: OMIT, family_name: OMIT, email_address: OMIT, phone_number: OMIT, created_at: OMIT, updated_at: OMIT, assigned_locations: OMIT, wage_setting: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @reference_id = reference_id if reference_id != OMIT
      @is_owner = is_owner if is_owner != OMIT
      @status = status if status != OMIT
      @given_name = given_name if given_name != OMIT
      @family_name = family_name if family_name != OMIT
      @email_address = email_address if email_address != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @assigned_locations = assigned_locations if assigned_locations != OMIT
      @wage_setting = wage_setting if wage_setting != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "reference_id": reference_id, "is_owner": is_owner, "status": status, "given_name": given_name, "family_name": family_name, "email_address": email_address, "phone_number": phone_number, "created_at": created_at, "updated_at": updated_at, "assigned_locations": assigned_locations, "wage_setting": wage_setting }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TeamMember
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TeamMember]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      reference_id = parsed_json["reference_id"]
      is_owner = parsed_json["is_owner"]
      status = parsed_json["status"]
      given_name = parsed_json["given_name"]
      family_name = parsed_json["family_name"]
      email_address = parsed_json["email_address"]
      phone_number = parsed_json["phone_number"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      unless parsed_json["assigned_locations"].nil?
        assigned_locations = parsed_json["assigned_locations"].to_json
        assigned_locations = SquareApiClient::TeamMemberAssignedLocations.from_json(json_object: assigned_locations)
      else
        assigned_locations = nil
      end
      unless parsed_json["wage_setting"].nil?
        wage_setting = parsed_json["wage_setting"].to_json
        wage_setting = SquareApiClient::WageSetting.from_json(json_object: wage_setting)
      else
        wage_setting = nil
      end
      new(
        id: id,
        reference_id: reference_id,
        is_owner: is_owner,
        status: status,
        given_name: given_name,
        family_name: family_name,
        email_address: email_address,
        phone_number: phone_number,
        created_at: created_at,
        updated_at: updated_at,
        assigned_locations: assigned_locations,
        wage_setting: wage_setting,
        additional_properties: struct
      )
    end
# Serialize an instance of TeamMember to a JSON object
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
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.is_owner&.is_a?(Boolean) != false || raise("Passed value for field obj.is_owner is not the expected type, validation failed.")
      obj.status&.is_a?(SquareApiClient::TeamMemberStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.given_name&.is_a?(String) != false || raise("Passed value for field obj.given_name is not the expected type, validation failed.")
      obj.family_name&.is_a?(String) != false || raise("Passed value for field obj.family_name is not the expected type, validation failed.")
      obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.assigned_locations.nil? || SquareApiClient::TeamMemberAssignedLocations.validate_raw(obj: obj.assigned_locations)
      obj.wage_setting.nil? || SquareApiClient::WageSetting.validate_raw(obj: obj.wage_setting)
    end
  end
end