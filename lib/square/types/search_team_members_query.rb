# frozen_string_literal: true
require_relative "search_team_members_filter"
require "ostruct"
require "json"

module square.rb
# Represents the parameters in a search for `TeamMember` objects.
  class SearchTeamMembersQuery
  # @return [square.rb::SearchTeamMembersFilter] The options to filter by.
    attr_reader :filter
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param filter [square.rb::SearchTeamMembersFilter] The options to filter by.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchTeamMembersQuery]
    def initialize(filter: OMIT, additional_properties: nil)
      @filter = filter if filter != OMIT
      @additional_properties = additional_properties
      @_field_set = { "filter": filter }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchTeamMembersQuery
    #
    # @param json_object [String] 
    # @return [square.rb::SearchTeamMembersQuery]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["filter"].nil?
        filter = parsed_json["filter"].to_json
        filter = square.rb::SearchTeamMembersFilter.from_json(json_object: filter)
      else
        filter = nil
      end
      new(filter: filter, additional_properties: struct)
    end
# Serialize an instance of SearchTeamMembersQuery to a JSON object
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
      obj.filter.nil? || square.rb::SearchTeamMembersFilter.validate_raw(obj: obj.filter)
    end
  end
end