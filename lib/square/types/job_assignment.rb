# frozen_string_literal: true
require_relative "job_assignment_pay_type"
require_relative "money"
require "ostruct"
require "json"

module square.rb
# Represents a job assigned to a [team member](entity:TeamMember), including the
#  compensation the team
#  member earns for the job. Job assignments are listed in the team member's [wage
#  setting](entity:WageSetting).
  class JobAssignment
  # @return [String] The title of the job.
    attr_reader :job_title
  # @return [square.rb::JobAssignmentPayType] The current pay type for the job assignment used to
#  calculate the pay amount in a pay period.
#  See [JobAssignmentPayType](#type-jobassignmentpaytype) for possible values
    attr_reader :pay_type
  # @return [square.rb::Money] The hourly pay rate of the job. For `SALARY` pay types, Square calculates the
#  hourly rate based on
#  `annual_rate` and `weekly_hours`.
    attr_reader :hourly_rate
  # @return [square.rb::Money] The total pay amount for a 12-month period on the job. Set if the job `PayType`
#  is `SALARY`.
    attr_reader :annual_rate
  # @return [Integer] The planned hours per week for the job. Set if the job `PayType` is `SALARY`.
    attr_reader :weekly_hours
  # @return [String] The ID of the [job](entity:Job).
    attr_reader :job_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param job_title [String] The title of the job.
    # @param pay_type [square.rb::JobAssignmentPayType] The current pay type for the job assignment used to
#  calculate the pay amount in a pay period.
#  See [JobAssignmentPayType](#type-jobassignmentpaytype) for possible values
    # @param hourly_rate [square.rb::Money] The hourly pay rate of the job. For `SALARY` pay types, Square calculates the
#  hourly rate based on
#  `annual_rate` and `weekly_hours`.
    # @param annual_rate [square.rb::Money] The total pay amount for a 12-month period on the job. Set if the job `PayType`
#  is `SALARY`.
    # @param weekly_hours [Integer] The planned hours per week for the job. Set if the job `PayType` is `SALARY`.
    # @param job_id [String] The ID of the [job](entity:Job).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::JobAssignment]
    def initialize(job_title: OMIT, pay_type:, hourly_rate: OMIT, annual_rate: OMIT, weekly_hours: OMIT, job_id: OMIT, additional_properties: nil)
      @job_title = job_title if job_title != OMIT
      @pay_type = pay_type
      @hourly_rate = hourly_rate if hourly_rate != OMIT
      @annual_rate = annual_rate if annual_rate != OMIT
      @weekly_hours = weekly_hours if weekly_hours != OMIT
      @job_id = job_id if job_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "job_title": job_title, "pay_type": pay_type, "hourly_rate": hourly_rate, "annual_rate": annual_rate, "weekly_hours": weekly_hours, "job_id": job_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of JobAssignment
    #
    # @param json_object [String] 
    # @return [square.rb::JobAssignment]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      job_title = parsed_json["job_title"]
      pay_type = parsed_json["pay_type"]
      unless parsed_json["hourly_rate"].nil?
        hourly_rate = parsed_json["hourly_rate"].to_json
        hourly_rate = square.rb::Money.from_json(json_object: hourly_rate)
      else
        hourly_rate = nil
      end
      unless parsed_json["annual_rate"].nil?
        annual_rate = parsed_json["annual_rate"].to_json
        annual_rate = square.rb::Money.from_json(json_object: annual_rate)
      else
        annual_rate = nil
      end
      weekly_hours = parsed_json["weekly_hours"]
      job_id = parsed_json["job_id"]
      new(
        job_title: job_title,
        pay_type: pay_type,
        hourly_rate: hourly_rate,
        annual_rate: annual_rate,
        weekly_hours: weekly_hours,
        job_id: job_id,
        additional_properties: struct
      )
    end
# Serialize an instance of JobAssignment to a JSON object
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
      obj.job_title&.is_a?(String) != false || raise("Passed value for field obj.job_title is not the expected type, validation failed.")
      obj.pay_type.is_a?(square.rb::JobAssignmentPayType) != false || raise("Passed value for field obj.pay_type is not the expected type, validation failed.")
      obj.hourly_rate.nil? || square.rb::Money.validate_raw(obj: obj.hourly_rate)
      obj.annual_rate.nil? || square.rb::Money.validate_raw(obj: obj.annual_rate)
      obj.weekly_hours&.is_a?(Integer) != false || raise("Passed value for field obj.weekly_hours is not the expected type, validation failed.")
      obj.job_id&.is_a?(String) != false || raise("Passed value for field obj.job_id is not the expected type, validation failed.")
    end
  end
end