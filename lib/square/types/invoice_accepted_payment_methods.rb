# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# The payment methods that customers can use to pay an [invoice](entity:Invoice)
#  on the Square-hosted invoice payment page.
  class InvoiceAcceptedPaymentMethods
  # @return [Boolean] Indicates whether credit card or debit card payments are accepted. The default
#  value is `false`.
    attr_reader :card
  # @return [Boolean] Indicates whether Square gift card payments are accepted. The default value is
#  `false`.
    attr_reader :square_gift_card
  # @return [Boolean] Indicates whether ACH bank transfer payments are accepted. The default value is
#  `false`.
    attr_reader :bank_account
  # @return [Boolean] Indicates whether Afterpay (also known as Clearpay) payments are accepted. The
#  default value is `false`.
#  This option is allowed only for invoices that have a single payment request of
#  the `BALANCE` type. This payment method is
#  supported if the seller account accepts Afterpay payments and the seller
#  location is in a country where Afterpay
#  invoice payments are supported. As a best practice, consider enabling an
#  additional payment method when allowing
#  `buy_now_pay_later` payments. For more information, including detailed
#  requirements and processing limits, see
#  [Buy Now Pay Later payments with
#  y](https://developer.squareup.com/docs/invoices-api/overview#buy-now-pay-later).
    attr_reader :buy_now_pay_later
  # @return [Boolean] Indicates whether Cash App payments are accepted. The default value is `false`.
#  This payment method is supported only for seller [locations](entity:Location) in
#  the United States.
    attr_reader :cash_app_pay
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param card [Boolean] Indicates whether credit card or debit card payments are accepted. The default
#  value is `false`.
    # @param square_gift_card [Boolean] Indicates whether Square gift card payments are accepted. The default value is
#  `false`.
    # @param bank_account [Boolean] Indicates whether ACH bank transfer payments are accepted. The default value is
#  `false`.
    # @param buy_now_pay_later [Boolean] Indicates whether Afterpay (also known as Clearpay) payments are accepted. The
#  default value is `false`.
#  This option is allowed only for invoices that have a single payment request of
#  the `BALANCE` type. This payment method is
#  supported if the seller account accepts Afterpay payments and the seller
#  location is in a country where Afterpay
#  invoice payments are supported. As a best practice, consider enabling an
#  additional payment method when allowing
#  `buy_now_pay_later` payments. For more information, including detailed
#  requirements and processing limits, see
#  [Buy Now Pay Later payments with
#  y](https://developer.squareup.com/docs/invoices-api/overview#buy-now-pay-later).
    # @param cash_app_pay [Boolean] Indicates whether Cash App payments are accepted. The default value is `false`.
#  This payment method is supported only for seller [locations](entity:Location) in
#  the United States.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::InvoiceAcceptedPaymentMethods]
    def initialize(card: OMIT, square_gift_card: OMIT, bank_account: OMIT, buy_now_pay_later: OMIT, cash_app_pay: OMIT, additional_properties: nil)
      @card = card if card != OMIT
      @square_gift_card = square_gift_card if square_gift_card != OMIT
      @bank_account = bank_account if bank_account != OMIT
      @buy_now_pay_later = buy_now_pay_later if buy_now_pay_later != OMIT
      @cash_app_pay = cash_app_pay if cash_app_pay != OMIT
      @additional_properties = additional_properties
      @_field_set = { "card": card, "square_gift_card": square_gift_card, "bank_account": bank_account, "buy_now_pay_later": buy_now_pay_later, "cash_app_pay": cash_app_pay }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InvoiceAcceptedPaymentMethods
    #
    # @param json_object [String] 
    # @return [square.rb::InvoiceAcceptedPaymentMethods]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      card = parsed_json["card"]
      square_gift_card = parsed_json["square_gift_card"]
      bank_account = parsed_json["bank_account"]
      buy_now_pay_later = parsed_json["buy_now_pay_later"]
      cash_app_pay = parsed_json["cash_app_pay"]
      new(
        card: card,
        square_gift_card: square_gift_card,
        bank_account: bank_account,
        buy_now_pay_later: buy_now_pay_later,
        cash_app_pay: cash_app_pay,
        additional_properties: struct
      )
    end
# Serialize an instance of InvoiceAcceptedPaymentMethods to a JSON object
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
      obj.card&.is_a?(Boolean) != false || raise("Passed value for field obj.card is not the expected type, validation failed.")
      obj.square_gift_card&.is_a?(Boolean) != false || raise("Passed value for field obj.square_gift_card is not the expected type, validation failed.")
      obj.bank_account&.is_a?(Boolean) != false || raise("Passed value for field obj.bank_account is not the expected type, validation failed.")
      obj.buy_now_pay_later&.is_a?(Boolean) != false || raise("Passed value for field obj.buy_now_pay_later is not the expected type, validation failed.")
      obj.cash_app_pay&.is_a?(Boolean) != false || raise("Passed value for field obj.cash_app_pay is not the expected type, validation failed.")
    end
  end
end