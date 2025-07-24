# frozen_string_literal: true
require_relative "job"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Represents an [UpdateJob](api-endpoint:Team-UpdateJob) response. Either `job` or
#  `errors`
#  is present in the response.
  class UpdateJobResponse
  # @return [SquareApiClient::Job] The updated job.
    attr_reader :job
  # @return [Array<SquareApiClient::Error>] The errors that occurred during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param job [SquareApiClient::Job] The updated job.
    # @param errors [Array<SquareApiClient::Error>] The errors that occurred during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::UpdateJobResponse]
    def initialize(job: OMIT, errors: OMIT, additional_properties: nil)
      @job = job if job != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "job": job, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UpdateJobResponse
    #
    # @param json_object [String] 
    # @return [SquareApiClient::UpdateJobResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["job"].nil?
        job = parsed_json["job"].to_json
        job = SquareApiClient::Job.from_json(json_object: job)
      else
        job = nil
      end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        job: job,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of UpdateJobResponse to a JSON object
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
      obj.job.nil? || SquareApiClient::Job.validate_raw(obj: obj.job)
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end