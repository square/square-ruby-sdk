# frozen_string_literal: true
require_relative "dispute_evidence"
require_relative "error"
require "ostruct"
require "json"

module square.rb
# Defines the fields in a `ListDisputeEvidence` response.
  class ListDisputeEvidenceResponse
  # @return [Array<square.rb::DisputeEvidence>] The list of evidence previously uploaded to the specified dispute.
    attr_reader :evidence
  # @return [Array<square.rb::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [String] The pagination cursor to be used in a subsequent request.
#  If unset, this is the final response. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param evidence [Array<square.rb::DisputeEvidence>] The list of evidence previously uploaded to the specified dispute.
    # @param errors [Array<square.rb::Error>] Information about errors encountered during the request.
    # @param cursor [String] The pagination cursor to be used in a subsequent request.
#  If unset, this is the final response. For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ListDisputeEvidenceResponse]
    def initialize(evidence: OMIT, errors: OMIT, cursor: OMIT, additional_properties: nil)
      @evidence = evidence if evidence != OMIT
      @errors = errors if errors != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "evidence": evidence, "errors": errors, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ListDisputeEvidenceResponse
    #
    # @param json_object [String] 
    # @return [square.rb::ListDisputeEvidenceResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      evidence = parsed_json["evidence"]&.map do | item |
  item = item.to_json
  square.rb::DisputeEvidence.from_json(json_object: item)
end
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        evidence: evidence,
        errors: errors,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of ListDisputeEvidenceResponse to a JSON object
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
      obj.evidence&.is_a?(Array) != false || raise("Passed value for field obj.evidence is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end