# frozen_string_literal: true
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# The hourly wage rate used to compensate a team member for a
#  [timecard](entity:Timecard).
  class TimecardWage
  # @return [String] The name of the job performed during this timecard.
    attr_reader :title
  # @return [SquareApiClient::Money] Can be a custom-set hourly wage or the calculated effective hourly
#  wage based on the annual wage and hours worked per week.
    attr_reader :hourly_rate
  # @return [String] The ID of the [job](entity:Job) performed for this timecard. Square
#  labor-reporting UIs might group timecards together by ID.
    attr_reader :job_id
  # @return [Boolean] Whether team members are eligible for tips when working this job.
    attr_reader :tip_eligible
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The name of the job performed during this timecard.
    # @param hourly_rate [SquareApiClient::Money] Can be a custom-set hourly wage or the calculated effective hourly
#  wage based on the annual wage and hours worked per week.
    # @param job_id [String] The ID of the [job](entity:Job) performed for this timecard. Square
#  labor-reporting UIs might group timecards together by ID.
    # @param tip_eligible [Boolean] Whether team members are eligible for tips when working this job.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::TimecardWage]
    def initialize(title: OMIT, hourly_rate: OMIT, job_id: OMIT, tip_eligible: OMIT, additional_properties: nil)
      @title = title if title != OMIT
      @hourly_rate = hourly_rate if hourly_rate != OMIT
      @job_id = job_id if job_id != OMIT
      @tip_eligible = tip_eligible if tip_eligible != OMIT
      @additional_properties = additional_properties
      @_field_set = { "title": title, "hourly_rate": hourly_rate, "job_id": job_id, "tip_eligible": tip_eligible }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TimecardWage
    #
    # @param json_object [String] 
    # @return [SquareApiClient::TimecardWage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      unless parsed_json["hourly_rate"].nil?
        hourly_rate = parsed_json["hourly_rate"].to_json
        hourly_rate = SquareApiClient::Money.from_json(json_object: hourly_rate)
      else
        hourly_rate = nil
      end
      job_id = parsed_json["job_id"]
      tip_eligible = parsed_json["tip_eligible"]
      new(
        title: title,
        hourly_rate: hourly_rate,
        job_id: job_id,
        tip_eligible: tip_eligible,
        additional_properties: struct
      )
    end
# Serialize an instance of TimecardWage to a JSON object
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
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.hourly_rate.nil? || SquareApiClient::Money.validate_raw(obj: obj.hourly_rate)
      obj.job_id&.is_a?(String) != false || raise("Passed value for field obj.job_id is not the expected type, validation failed.")
      obj.tip_eligible&.is_a?(Boolean) != false || raise("Passed value for field obj.tip_eligible is not the expected type, validation failed.")
    end
  end
end