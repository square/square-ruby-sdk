# frozen_string_literal: true
require_relative "dispute_evidence_file"
require_relative "dispute_evidence_type"
require "ostruct"
require "json"

module SquareApiClient
  class DisputeEvidence
  # @return [String] The Square-generated ID of the evidence.
    attr_reader :evidence_id
  # @return [String] The Square-generated ID of the evidence.
    attr_reader :id
  # @return [String] The ID of the dispute the evidence is associated with.
    attr_reader :dispute_id
  # @return [SquareApiClient::DisputeEvidenceFile] Image, PDF, TXT
    attr_reader :evidence_file
  # @return [String] Raw text
    attr_reader :evidence_text
  # @return [String] The time when the evidence was uploaded, in RFC 3339 format.
    attr_reader :uploaded_at
  # @return [SquareApiClient::DisputeEvidenceType] The type of the evidence.
#  See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    attr_reader :evidence_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param evidence_id [String] The Square-generated ID of the evidence.
    # @param id [String] The Square-generated ID of the evidence.
    # @param dispute_id [String] The ID of the dispute the evidence is associated with.
    # @param evidence_file [SquareApiClient::DisputeEvidenceFile] Image, PDF, TXT
    # @param evidence_text [String] Raw text
    # @param uploaded_at [String] The time when the evidence was uploaded, in RFC 3339 format.
    # @param evidence_type [SquareApiClient::DisputeEvidenceType] The type of the evidence.
#  See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DisputeEvidence]
    def initialize(evidence_id: OMIT, id: OMIT, dispute_id: OMIT, evidence_file: OMIT, evidence_text: OMIT, uploaded_at: OMIT, evidence_type: OMIT, additional_properties: nil)
      @evidence_id = evidence_id if evidence_id != OMIT
      @id = id if id != OMIT
      @dispute_id = dispute_id if dispute_id != OMIT
      @evidence_file = evidence_file if evidence_file != OMIT
      @evidence_text = evidence_text if evidence_text != OMIT
      @uploaded_at = uploaded_at if uploaded_at != OMIT
      @evidence_type = evidence_type if evidence_type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "evidence_id": evidence_id, "id": id, "dispute_id": dispute_id, "evidence_file": evidence_file, "evidence_text": evidence_text, "uploaded_at": uploaded_at, "evidence_type": evidence_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DisputeEvidence
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DisputeEvidence]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      evidence_id = parsed_json["evidence_id"]
      id = parsed_json["id"]
      dispute_id = parsed_json["dispute_id"]
      unless parsed_json["evidence_file"].nil?
        evidence_file = parsed_json["evidence_file"].to_json
        evidence_file = SquareApiClient::DisputeEvidenceFile.from_json(json_object: evidence_file)
      else
        evidence_file = nil
      end
      evidence_text = parsed_json["evidence_text"]
      uploaded_at = parsed_json["uploaded_at"]
      evidence_type = parsed_json["evidence_type"]
      new(
        evidence_id: evidence_id,
        id: id,
        dispute_id: dispute_id,
        evidence_file: evidence_file,
        evidence_text: evidence_text,
        uploaded_at: uploaded_at,
        evidence_type: evidence_type,
        additional_properties: struct
      )
    end
# Serialize an instance of DisputeEvidence to a JSON object
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
      obj.evidence_id&.is_a?(String) != false || raise("Passed value for field obj.evidence_id is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.dispute_id&.is_a?(String) != false || raise("Passed value for field obj.dispute_id is not the expected type, validation failed.")
      obj.evidence_file.nil? || SquareApiClient::DisputeEvidenceFile.validate_raw(obj: obj.evidence_file)
      obj.evidence_text&.is_a?(String) != false || raise("Passed value for field obj.evidence_text is not the expected type, validation failed.")
      obj.uploaded_at&.is_a?(String) != false || raise("Passed value for field obj.uploaded_at is not the expected type, validation failed.")
      obj.evidence_type&.is_a?(SquareApiClient::DisputeEvidenceType) != false || raise("Passed value for field obj.evidence_type is not the expected type, validation failed.")
    end
  end
end