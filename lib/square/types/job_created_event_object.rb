# frozen_string_literal: true
require_relative "job"
require "ostruct"
require "json"

module square.rb
  class JobCreatedEventObject
  # @return [square.rb::Job] The created job.
    attr_reader :job
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param job [square.rb::Job] The created job.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::JobCreatedEventObject]
    def initialize(job: OMIT, additional_properties: nil)
      @job = job if job != OMIT
      @additional_properties = additional_properties
      @_field_set = { "job": job }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of JobCreatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::JobCreatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["job"].nil?
        job = parsed_json["job"].to_json
        job = square.rb::Job.from_json(json_object: job)
      else
        job = nil
      end
      new(job: job, additional_properties: struct)
    end
# Serialize an instance of JobCreatedEventObject to a JSON object
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
      obj.job.nil? || square.rb::Job.validate_raw(obj: obj.job)
    end
  end
end