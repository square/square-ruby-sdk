# frozen_string_literal: true
require_relative "job"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Represents a [ListJobs](api-endpoint:Team-ListJobs) response. Either `jobs` or
#  `errors`
#  is present in the response. If additional results are available, the `cursor`
#  field is also present.
  class ListJobsResponse
  # @return [Array<square.rb::Job>] The retrieved jobs. A single paged response contains up to 100 jobs.
    attr_reader :jobs
  # @return [String] An opaque cursor used to retrieve the next page of results. This field is
#  present only
#  if the request succeeded and additional results are available. For more
#  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [Array<square.rb::Error>] The errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param jobs [Array<square.rb::Job>] The retrieved jobs. A single paged response contains up to 100 jobs.
    # @param cursor [String] An opaque cursor used to retrieve the next page of results. This field is
#  present only
#  if the request succeeded and additional results are available. For more
#  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param errors [Array<square.rb::Error>] The errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListJobsResponse]
    def initialize(jobs: OMIT, cursor: OMIT, errors: OMIT, additional_properties: nil)
      @jobs = jobs if jobs != OMIT
      @cursor = cursor if cursor != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "jobs": jobs, "cursor": cursor, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListJobsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListJobsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      jobs = parsed_json["jobs"]&.map do | item |
  item = item.to_json
  square.rb::Job.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      new(
        jobs: jobs,
        cursor: cursor,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of ListJobsResponse to a JSON object
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
      obj.jobs&.is_a?(Array) != false || raise("Passed value for field obj.jobs is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end