# frozen_string_literal: true
require_relative "team_member_wage"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# A response to a request to get a `TeamMemberWage`. The response contains
#  the requested `TeamMemberWage` objects and might contain a set of `Error`
#  objects if
#  the request resulted in errors.
  class GetTeamMemberWageResponse
  # @return [square.rb::TeamMemberWage] The requested `TeamMemberWage` object.
    attr_reader :team_member_wage
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param team_member_wage [square.rb::TeamMemberWage] The requested `TeamMemberWage` object.
    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetTeamMemberWageResponse]
    def initialize(team_member_wage: OMIT, errors: OMIT, additional_properties: nil)
      @team_member_wage = team_member_wage if team_member_wage != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "team_member_wage": team_member_wage, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetTeamMemberWageResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetTeamMemberWageResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["team_member_wage"].nil?
        team_member_wage = parsed_json["team_member_wage"].to_json
        team_member_wage = square.rb::TeamMemberWage.from_json(json_object: team_member_wage)
      else
        team_member_wage = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        team_member_wage: team_member_wage,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of GetTeamMemberWageResponse to a JSON object
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
      obj.team_member_wage.nil? || square.rb::TeamMemberWage.validate_raw(obj: obj.team_member_wage)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end