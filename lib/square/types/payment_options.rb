# frozen_string_literal: true
require_relative "payment_options_delay_action"
require "ostruct"
require "json"

module square.rb
  class PaymentOptions
  # @return [Boolean] Indicates whether the `Payment` objects created from this `TerminalCheckout` are
#  automatically `COMPLETED` or left in an `APPROVED` state for later modification.
#  Default: true
    attr_reader :autocomplete
  # @return [String] The duration of time after the payment's creation when Square automatically
#  resolves the
#  payment. This automatic resolution applies only to payments that do not reach a
#  terminal state
#  (`COMPLETED` or `CANCELED`) before the `delay_duration` time period.
#  This parameter should be specified as a time duration, in RFC 3339 format, with
#  a minimum value
#  of 1 minute and a maximum value of 36 hours. This feature is only supported for
#  card payments,
#  and all payments will be considered card-present.
#  This parameter can only be set for a delayed capture payment
#  (`autocomplete=false`). For more
#  information, see [Delayed
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  Default: "PT36H" (36 hours) from the creation time
    attr_reader :delay_duration
  # @return [Boolean] If set to `true` and charging a Square Gift Card, a payment might be returned
#  with
#  `amount_money` equal to less than what was requested. For example, a request for
#  $20 when charging
#  a Square Gift Card with a balance of $5 results in an APPROVED payment of $5.
#  You might choose
#  to prompt the buyer for an additional payment to cover the remainder or cancel
#  the Gift Card
#  payment.
#  This parameter can only be set for a delayed capture payment
#  (`autocomplete=false`).
#  For more information, see [Take Partial
#  docs/payments-api/take-payments/card-payments/partial-payments-with-gift-cards).
#  Default: false
    attr_reader :accept_partial_authorization
  # @return [square.rb::PaymentOptionsDelayAction] The action to be applied to the `Payment` when the delay_duration has elapsed.
#  The action must be CANCEL or COMPLETE.
#  The action cannot be set to COMPLETE if an `order_id` is present on the
#  TerminalCheckout.
#  This parameter can only be set for a delayed capture payment
#  (`autocomplete=false`). For more
#  information, see [Delayed
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  Default: CANCEL
#  See [DelayAction](#type-delayaction) for possible values
    attr_reader :delay_action
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param autocomplete [Boolean] Indicates whether the `Payment` objects created from this `TerminalCheckout` are
#  automatically `COMPLETED` or left in an `APPROVED` state for later modification.
#  Default: true
    # @param delay_duration [String] The duration of time after the payment's creation when Square automatically
#  resolves the
#  payment. This automatic resolution applies only to payments that do not reach a
#  terminal state
#  (`COMPLETED` or `CANCELED`) before the `delay_duration` time period.
#  This parameter should be specified as a time duration, in RFC 3339 format, with
#  a minimum value
#  of 1 minute and a maximum value of 36 hours. This feature is only supported for
#  card payments,
#  and all payments will be considered card-present.
#  This parameter can only be set for a delayed capture payment
#  (`autocomplete=false`). For more
#  information, see [Delayed
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  Default: "PT36H" (36 hours) from the creation time
    # @param accept_partial_authorization [Boolean] If set to `true` and charging a Square Gift Card, a payment might be returned
#  with
#  `amount_money` equal to less than what was requested. For example, a request for
#  $20 when charging
#  a Square Gift Card with a balance of $5 results in an APPROVED payment of $5.
#  You might choose
#  to prompt the buyer for an additional payment to cover the remainder or cancel
#  the Gift Card
#  payment.
#  This parameter can only be set for a delayed capture payment
#  (`autocomplete=false`).
#  For more information, see [Take Partial
#  docs/payments-api/take-payments/card-payments/partial-payments-with-gift-cards).
#  Default: false
    # @param delay_action [square.rb::PaymentOptionsDelayAction] The action to be applied to the `Payment` when the delay_duration has elapsed.
#  The action must be CANCEL or COMPLETE.
#  The action cannot be set to COMPLETE if an `order_id` is present on the
#  TerminalCheckout.
#  This parameter can only be set for a delayed capture payment
#  (`autocomplete=false`). For more
#  information, see [Delayed
#  m/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).
#  Default: CANCEL
#  See [DelayAction](#type-delayaction) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PaymentOptions]
    def initialize(autocomplete: OMIT, delay_duration: OMIT, accept_partial_authorization: OMIT, delay_action: OMIT, additional_properties: nil)
      @autocomplete = autocomplete if autocomplete != OMIT
      @delay_duration = delay_duration if delay_duration != OMIT
      @accept_partial_authorization = accept_partial_authorization if accept_partial_authorization != OMIT
      @delay_action = delay_action if delay_action != OMIT
      @additional_properties = additional_properties
      @_field_set = { "autocomplete": autocomplete, "delay_duration": delay_duration, "accept_partial_authorization": accept_partial_authorization, "delay_action": delay_action }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentOptions
    #
    # @param json_object [String] 
    # @return [square.rb::PaymentOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      autocomplete = parsed_json["autocomplete"]
      delay_duration = parsed_json["delay_duration"]
      accept_partial_authorization = parsed_json["accept_partial_authorization"]
      delay_action = parsed_json["delay_action"]
      new(
        autocomplete: autocomplete,
        delay_duration: delay_duration,
        accept_partial_authorization: accept_partial_authorization,
        delay_action: delay_action,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentOptions to a JSON object
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
      obj.autocomplete&.is_a?(Boolean) != false || raise("Passed value for field obj.autocomplete is not the expected type, validation failed.")
      obj.delay_duration&.is_a?(String) != false || raise("Passed value for field obj.delay_duration is not the expected type, validation failed.")
      obj.accept_partial_authorization&.is_a?(Boolean) != false || raise("Passed value for field obj.accept_partial_authorization is not the expected type, validation failed.")
      obj.delay_action&.is_a?(square.rb::PaymentOptionsDelayAction) != false || raise("Passed value for field obj.delay_action is not the expected type, validation failed.")
    end
  end
end