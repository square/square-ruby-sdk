# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents options for an individual publish request in a
#  [BulkPublishScheduledShifts](api-endpoint:Labor-BulkPublishScheduledShifts)
#  operation, provided as the value in a key-value pair.
  class BulkPublishScheduledShiftsData
  # @return [Integer] The current version of the scheduled shift, used to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control. If the provided version doesn't match the server version, the request
#  fails.
#  If omitted, Square executes a blind write, potentially overwriting data from
#  another publish request.
    attr_reader :version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param version [Integer] The current version of the scheduled shift, used to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control. If the provided version doesn't match the server version, the request
#  fails.
#  If omitted, Square executes a blind write, potentially overwriting data from
#  another publish request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::BulkPublishScheduledShiftsData]
    def initialize(version: OMIT, additional_properties: nil)
      @version = version if version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "version": version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of BulkPublishScheduledShiftsData
    #
    # @param json_object [String] 
    # @return [SquareApiClient::BulkPublishScheduledShiftsData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      version = parsed_json["version"]
      new(version: version, additional_properties: struct)
    end
# Serialize an instance of BulkPublishScheduledShiftsData to a JSON object
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
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
    end
  end
end