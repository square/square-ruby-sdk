# frozen_string_literal: true
require_relative "risk_evaluation_risk_level"
require "ostruct"
require "json"

module SquareApiClient
# Represents fraud risk information for the associated payment.
#  When you take a payment through Square's Payments API (using the `CreatePayment`
#  endpoint), Square evaluates it and assigns a risk level to the payment. Sellers
#  can use this information to determine the course of action (for example,
#  provide the goods/services or refund the payment).
  class RiskEvaluation
  # @return [String] The timestamp when payment risk was evaluated, in RFC 3339 format.
    attr_reader :created_at
  # @return [SquareApiClient::RiskEvaluationRiskLevel] The risk level associated with the payment
#  See [RiskEvaluationRiskLevel](#type-riskevaluationrisklevel) for possible values
    attr_reader :risk_level
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param created_at [String] The timestamp when payment risk was evaluated, in RFC 3339 format.
    # @param risk_level [SquareApiClient::RiskEvaluationRiskLevel] The risk level associated with the payment
#  See [RiskEvaluationRiskLevel](#type-riskevaluationrisklevel) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::RiskEvaluation]
    def initialize(created_at: OMIT, risk_level: OMIT, additional_properties: nil)
      @created_at = created_at if created_at != OMIT
      @risk_level = risk_level if risk_level != OMIT
      @additional_properties = additional_properties
      @_field_set = { "created_at": created_at, "risk_level": risk_level }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RiskEvaluation
    #
    # @param json_object [String] 
    # @return [SquareApiClient::RiskEvaluation]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      created_at = parsed_json["created_at"]
      risk_level = parsed_json["risk_level"]
      new(
        created_at: created_at,
        risk_level: risk_level,
        additional_properties: struct
      )
    end
# Serialize an instance of RiskEvaluation to a JSON object
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
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.risk_level&.is_a?(SquareApiClient::RiskEvaluationRiskLevel) != false || raise("Passed value for field obj.risk_level is not the expected type, validation failed.")
    end
  end
end