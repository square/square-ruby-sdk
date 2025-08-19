# frozen_string_literal: true
require_relative "card"
require_relative "device_details"
require_relative "card_payment_timeline"
require_relative "error"
require "ostruct"
require "json"

module SquareApiClient
# Reflects the current status of a card payment. Contains only non-confidential
#  information.
  class CardPaymentDetails
  # @return [String] The card payment's current state. The state can be AUTHORIZED, CAPTURED, VOIDED,
#  or
#  FAILED.
    attr_reader :status
  # @return [SquareApiClient::Card] The credit card's non-confidential details.
    attr_reader :card
  # @return [String] The method used to enter the card's details for the payment. The method can be
#  `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
    attr_reader :entry_method
  # @return [String] The status code returned from the Card Verification Value (CVV) check. The code
#  can be
#  `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
    attr_reader :cvv_status
  # @return [String] The status code returned from the Address Verification System (AVS) check. The
#  code can be
#  `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
    attr_reader :avs_status
  # @return [String] The status code returned by the card issuer that describes the payment's
#  authorization status.
    attr_reader :auth_result_code
  # @return [String] For EMV payments, the application ID identifies the EMV application used for the
#  payment.
    attr_reader :application_identifier
  # @return [String] For EMV payments, the human-readable name of the EMV application used for the
#  payment.
    attr_reader :application_name
  # @return [String] For EMV payments, the cryptogram generated for the payment.
    attr_reader :application_cryptogram
  # @return [String] For EMV payments, the method used to verify the cardholder's identity. The
#  method can be
#  `PIN`, `SIGNATURE`, `PIN_AND_SIGNATURE`, `ON_DEVICE`, or `NONE`.
    attr_reader :verification_method
  # @return [String] For EMV payments, the results of the cardholder verification. The result can be
#  `SUCCESS`, `FAILURE`, or `UNKNOWN`.
    attr_reader :verification_results
  # @return [String] The statement description sent to the card networks.
#  Note: The actual statement description varies and is likely to be truncated and
#  appended with
#  additional information on a per issuer basis.
    attr_reader :statement_description
  # @return [SquareApiClient::DeviceDetails] __Deprecated__: Use `Payment.device_details` instead.
#  Details about the device that took the payment.
    attr_reader :device_details
  # @return [SquareApiClient::CardPaymentTimeline] The timeline for card payments.
    attr_reader :card_payment_timeline
  # @return [Boolean] Whether the card must be physically present for the payment to
#  be refunded.  If set to `true`, the card must be present.
    attr_reader :refund_requires_card_presence
  # @return [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    attr_reader :errors
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status [String] The card payment's current state. The state can be AUTHORIZED, CAPTURED, VOIDED,
#  or
#  FAILED.
    # @param card [SquareApiClient::Card] The credit card's non-confidential details.
    # @param entry_method [String] The method used to enter the card's details for the payment. The method can be
#  `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
    # @param cvv_status [String] The status code returned from the Card Verification Value (CVV) check. The code
#  can be
#  `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
    # @param avs_status [String] The status code returned from the Address Verification System (AVS) check. The
#  code can be
#  `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
    # @param auth_result_code [String] The status code returned by the card issuer that describes the payment's
#  authorization status.
    # @param application_identifier [String] For EMV payments, the application ID identifies the EMV application used for the
#  payment.
    # @param application_name [String] For EMV payments, the human-readable name of the EMV application used for the
#  payment.
    # @param application_cryptogram [String] For EMV payments, the cryptogram generated for the payment.
    # @param verification_method [String] For EMV payments, the method used to verify the cardholder's identity. The
#  method can be
#  `PIN`, `SIGNATURE`, `PIN_AND_SIGNATURE`, `ON_DEVICE`, or `NONE`.
    # @param verification_results [String] For EMV payments, the results of the cardholder verification. The result can be
#  `SUCCESS`, `FAILURE`, or `UNKNOWN`.
    # @param statement_description [String] The statement description sent to the card networks.
#  Note: The actual statement description varies and is likely to be truncated and
#  appended with
#  additional information on a per issuer basis.
    # @param device_details [SquareApiClient::DeviceDetails] __Deprecated__: Use `Payment.device_details` instead.
#  Details about the device that took the payment.
    # @param card_payment_timeline [SquareApiClient::CardPaymentTimeline] The timeline for card payments.
    # @param refund_requires_card_presence [Boolean] Whether the card must be physically present for the payment to
#  be refunded.  If set to `true`, the card must be present.
    # @param errors [Array<SquareApiClient::Error>] Information about errors encountered during the request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CardPaymentDetails]
    def initialize(status: OMIT, card: OMIT, entry_method: OMIT, cvv_status: OMIT, avs_status: OMIT, auth_result_code: OMIT, application_identifier: OMIT, application_name: OMIT, application_cryptogram: OMIT, verification_method: OMIT, verification_results: OMIT, statement_description: OMIT, device_details: OMIT, card_payment_timeline: OMIT, refund_requires_card_presence: OMIT, errors: OMIT, additional_properties: nil)
      @status = status if status != OMIT
      @card = card if card != OMIT
      @entry_method = entry_method if entry_method != OMIT
      @cvv_status = cvv_status if cvv_status != OMIT
      @avs_status = avs_status if avs_status != OMIT
      @auth_result_code = auth_result_code if auth_result_code != OMIT
      @application_identifier = application_identifier if application_identifier != OMIT
      @application_name = application_name if application_name != OMIT
      @application_cryptogram = application_cryptogram if application_cryptogram != OMIT
      @verification_method = verification_method if verification_method != OMIT
      @verification_results = verification_results if verification_results != OMIT
      @statement_description = statement_description if statement_description != OMIT
      @device_details = device_details if device_details != OMIT
      @card_payment_timeline = card_payment_timeline if card_payment_timeline != OMIT
      @refund_requires_card_presence = refund_requires_card_presence if refund_requires_card_presence != OMIT
      @errors = errors if errors != OMIT
      @additional_properties = additional_properties
      @_field_set = { "status": status, "card": card, "entry_method": entry_method, "cvv_status": cvv_status, "avs_status": avs_status, "auth_result_code": auth_result_code, "application_identifier": application_identifier, "application_name": application_name, "application_cryptogram": application_cryptogram, "verification_method": verification_method, "verification_results": verification_results, "statement_description": statement_description, "device_details": device_details, "card_payment_timeline": card_payment_timeline, "refund_requires_card_presence": refund_requires_card_presence, "errors": errors }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CardPaymentDetails
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CardPaymentDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status = parsed_json["status"]
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = SquareApiClient::Card.from_json(json_object: card)
      else
        card = nil
      end
      entry_method = parsed_json["entry_method"]
      cvv_status = parsed_json["cvv_status"]
      avs_status = parsed_json["avs_status"]
      auth_result_code = parsed_json["auth_result_code"]
      application_identifier = parsed_json["application_identifier"]
      application_name = parsed_json["application_name"]
      application_cryptogram = parsed_json["application_cryptogram"]
      verification_method = parsed_json["verification_method"]
      verification_results = parsed_json["verification_results"]
      statement_description = parsed_json["statement_description"]
      unless parsed_json["device_details"].nil?
        device_details = parsed_json["device_details"].to_json
        device_details = SquareApiClient::DeviceDetails.from_json(json_object: device_details)
      else
        device_details = nil
      end
      unless parsed_json["card_payment_timeline"].nil?
        card_payment_timeline = parsed_json["card_payment_timeline"].to_json
        card_payment_timeline = SquareApiClient::CardPaymentTimeline.from_json(json_object: card_payment_timeline)
      else
        card_payment_timeline = nil
      end
      refund_requires_card_presence = parsed_json["refund_requires_card_presence"]
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  SquareApiClient::Error.from_json(json_object: item)
end
      new(
        status: status,
        card: card,
        entry_method: entry_method,
        cvv_status: cvv_status,
        avs_status: avs_status,
        auth_result_code: auth_result_code,
        application_identifier: application_identifier,
        application_name: application_name,
        application_cryptogram: application_cryptogram,
        verification_method: verification_method,
        verification_results: verification_results,
        statement_description: statement_description,
        device_details: device_details,
        card_payment_timeline: card_payment_timeline,
        refund_requires_card_presence: refund_requires_card_presence,
        errors: errors,
        additional_properties: struct
      )
    end
# Serialize an instance of CardPaymentDetails to a JSON object
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
      obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.card.nil? || SquareApiClient::Card.validate_raw(obj: obj.card)
      obj.entry_method&.is_a?(String) != false || raise("Passed value for field obj.entry_method is not the expected type, validation failed.")
      obj.cvv_status&.is_a?(String) != false || raise("Passed value for field obj.cvv_status is not the expected type, validation failed.")
      obj.avs_status&.is_a?(String) != false || raise("Passed value for field obj.avs_status is not the expected type, validation failed.")
      obj.auth_result_code&.is_a?(String) != false || raise("Passed value for field obj.auth_result_code is not the expected type, validation failed.")
      obj.application_identifier&.is_a?(String) != false || raise("Passed value for field obj.application_identifier is not the expected type, validation failed.")
      obj.application_name&.is_a?(String) != false || raise("Passed value for field obj.application_name is not the expected type, validation failed.")
      obj.application_cryptogram&.is_a?(String) != false || raise("Passed value for field obj.application_cryptogram is not the expected type, validation failed.")
      obj.verification_method&.is_a?(String) != false || raise("Passed value for field obj.verification_method is not the expected type, validation failed.")
      obj.verification_results&.is_a?(String) != false || raise("Passed value for field obj.verification_results is not the expected type, validation failed.")
      obj.statement_description&.is_a?(String) != false || raise("Passed value for field obj.statement_description is not the expected type, validation failed.")
      obj.device_details.nil? || SquareApiClient::DeviceDetails.validate_raw(obj: obj.device_details)
      obj.card_payment_timeline.nil? || SquareApiClient::CardPaymentTimeline.validate_raw(obj: obj.card_payment_timeline)
      obj.refund_requires_card_presence&.is_a?(Boolean) != false || raise("Passed value for field obj.refund_requires_card_presence is not the expected type, validation failed.")
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
    end
  end
end