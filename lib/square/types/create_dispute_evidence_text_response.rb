# frozen_string_literal: true
require_relative "error"
require_relative "dispute_evidence"
require "ostruct"
require "json"

module square.rb
# Defines the fields in a `CreateDisputeEvidenceText` response.
  class CreateDisputeEvidenceTextResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::DisputeEvidence] The newly uploaded dispute evidence metadata.
    attr_reader :evidence
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param evidence [square.rb::DisputeEvidence] The newly uploaded dispute evidence metadata.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateDisputeEvidenceTextResponse]
    def initialize(errors: OMIT, evidence: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @evidence = evidence if evidence != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "evidence": evidence }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateDisputeEvidenceTextResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateDisputeEvidenceTextResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["evidence"].nil?
        evidence = parsed_json["evidence"].to_json
        evidence = square.rb::DisputeEvidence.from_json(json_object: evidence)
      else
        evidence = nil
      end
      new(
        errors: errors,
        evidence: evidence,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateDisputeEvidenceTextResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.evidence.nil? || square.rb::DisputeEvidence.validate_raw(obj: obj.evidence)
    end
  end
end