# frozen_string_literal: true
require_relative "dispute_evidence_type"
require "ostruct"
require "json"

module square.rb
# Defines the parameters for a `CreateDisputeEvidenceFile` request.
  class CreateDisputeEvidenceFileRequest
  # @return [String] A unique key identifying the request. For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    attr_reader :idempotency_key
  # @return [square.rb::DisputeEvidenceType] The type of evidence you are uploading.
#  See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    attr_reader :evidence_type
  # @return [String] The MIME type of the uploaded file.
#  The type can be image/heic, image/heif, image/jpeg, application/pdf, image/png,
#  or image/tiff.
    attr_reader :content_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param idempotency_key [String] A unique key identifying the request. For more information, see
#  Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    # @param evidence_type [square.rb::DisputeEvidenceType] The type of evidence you are uploading.
#  See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    # @param content_type [String] The MIME type of the uploaded file.
#  The type can be image/heic, image/heif, image/jpeg, application/pdf, image/png,
#  or image/tiff.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateDisputeEvidenceFileRequest]
    def initialize(idempotency_key:, evidence_type: OMIT, content_type: OMIT, additional_properties: nil)
      @idempotency_key = idempotency_key
      @evidence_type = evidence_type if evidence_type != OMIT
      @content_type = content_type if content_type != OMIT
      @additional_properties = additional_properties
      @_field_set = { "idempotency_key": idempotency_key, "evidence_type": evidence_type, "content_type": content_type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateDisputeEvidenceFileRequest
    #
    # @param json_object [String] 
    # @return [square.rb::CreateDisputeEvidenceFileRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      idempotency_key = parsed_json["idempotency_key"]
      evidence_type = parsed_json["evidence_type"]
      content_type = parsed_json["content_type"]
      new(
        idempotency_key: idempotency_key,
        evidence_type: evidence_type,
        content_type: content_type,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateDisputeEvidenceFileRequest to a JSON object
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
      obj.idempotency_key.is_a?(String) != false || raise("Passed value for field obj.idempotency_key is not the expected type, validation failed.")
      obj.evidence_type&.is_a?(square.rb::DisputeEvidenceType) != false || raise("Passed value for field obj.evidence_type is not the expected type, validation failed.")
      obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
    end
  end
end