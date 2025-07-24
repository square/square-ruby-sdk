# frozen_string_literal: true
require_relative "wage_setting"
require "ostruct"
require "json"

module SquareApiClient
  class TeamMemberWageSettingUpdatedEventObject
  # @return [SquareApiClient::WageSetting] The updated team member wage setting.
    attr_reader :wage_setting
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param wage_setting [SquareApiClient::WageSetting] The updated team member wage setting.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TeamMemberWageSettingUpdatedEventObject]
    def initialize(wage_setting: OMIT, additional_properties: nil)
      @wage_setting = wage_setting if wage_setting != OMIT
      @additional_properties = additional_properties
      @_field_set = { "wage_setting": wage_setting }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  TeamMemberWageSettingUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TeamMemberWageSettingUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["wage_setting"].nil?
        wage_setting = parsed_json["wage_setting"].to_json
        wage_setting = SquareApiClient::WageSetting.from_json(json_object: wage_setting)
      else
        wage_setting = nil
      end
      new(wage_setting: wage_setting, additional_properties: struct)
    end
# Serialize an instance of TeamMemberWageSettingUpdatedEventObject to a JSON
#  object
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
      obj.wage_setting.nil? || SquareApiClient::WageSetting.validate_raw(obj: obj.wage_setting)
    end
  end
end