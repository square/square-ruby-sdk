# frozen_string_literal: true
require_relative "gift_card_type"
require_relative "gift_card_gan_source"
require_relative "gift_card_status"
require_relative "money"
require "ostruct"
require "json"

module SquareApiClient
# Represents a Square gift card.
  class GiftCard
  # @return [String] The Square-assigned ID of the gift card.
    attr_reader :id
  # @return [SquareApiClient::GiftCardType] The gift card type.
#  See [Type](#type-type) for possible values
    attr_reader :type
  # @return [SquareApiClient::GiftCardGanSource] The source that generated the gift card account number (GAN). The default value
#  is `SQUARE`.
#  See [GANSource](#type-gansource) for possible values
    attr_reader :gan_source
  # @return [SquareApiClient::GiftCardStatus] The current gift card state.
#  See [Status](#type-status) for possible values
    attr_reader :state
  # @return [SquareApiClient::Money] The current gift card balance. This balance is always greater than or equal to
#  zero.
    attr_reader :balance_money
  # @return [String] The gift card account number (GAN). Buyers can use the GAN to make purchases or
#  check
#  the gift card balance.
    attr_reader :gan
  # @return [String] The timestamp when the gift card was created, in RFC 3339 format.
#  In the case of a digital gift card, it is the time when you create a card
#  (using the Square Point of Sale application, Seller Dashboard, or Gift Cards
#  API).
#  In the case of a plastic gift card, it is the time when Square associates the
#  card with the
#  seller at the time of activation.
    attr_reader :created_at
  # @return [Array<String>] The IDs of the [customer profiles](entity:Customer) to whom this gift card is
#  linked.
    attr_reader :customer_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the gift card.
    # @param type [SquareApiClient::GiftCardType] The gift card type.
#  See [Type](#type-type) for possible values
    # @param gan_source [SquareApiClient::GiftCardGanSource] The source that generated the gift card account number (GAN). The default value
#  is `SQUARE`.
#  See [GANSource](#type-gansource) for possible values
    # @param state [SquareApiClient::GiftCardStatus] The current gift card state.
#  See [Status](#type-status) for possible values
    # @param balance_money [SquareApiClient::Money] The current gift card balance. This balance is always greater than or equal to
#  zero.
    # @param gan [String] The gift card account number (GAN). Buyers can use the GAN to make purchases or
#  check
#  the gift card balance.
    # @param created_at [String] The timestamp when the gift card was created, in RFC 3339 format.
#  In the case of a digital gift card, it is the time when you create a card
#  (using the Square Point of Sale application, Seller Dashboard, or Gift Cards
#  API).
#  In the case of a plastic gift card, it is the time when Square associates the
#  card with the
#  seller at the time of activation.
    # @param customer_ids [Array<String>] The IDs of the [customer profiles](entity:Customer) to whom this gift card is
#  linked.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCard]
    def initialize(id: OMIT, type:, gan_source: OMIT, state: OMIT, balance_money: OMIT, gan: OMIT, created_at: OMIT, customer_ids: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @type = type
      @gan_source = gan_source if gan_source != OMIT
      @state = state if state != OMIT
      @balance_money = balance_money if balance_money != OMIT
      @gan = gan if gan != OMIT
      @created_at = created_at if created_at != OMIT
      @customer_ids = customer_ids if customer_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "gan_source": gan_source, "state": state, "balance_money": balance_money, "gan": gan, "created_at": created_at, "customer_ids": customer_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCard
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCard]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      gan_source = parsed_json["gan_source"]
      state = parsed_json["state"]
      unless parsed_json["balance_money"].nil?
        balance_money = parsed_json["balance_money"].to_json
        balance_money = SquareApiClient::Money.from_json(json_object: balance_money)
      else
        balance_money = nil
      end
      gan = parsed_json["gan"]
      created_at = parsed_json["created_at"]
      customer_ids = parsed_json["customer_ids"]
      new(
        id: id,
        type: type,
        gan_source: gan_source,
        state: state,
        balance_money: balance_money,
        gan: gan,
        created_at: created_at,
        customer_ids: customer_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCard to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.type.is_a?(SquareApiClient::GiftCardType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.gan_source&.is_a?(SquareApiClient::GiftCardGanSource) != false || raise("Passed value for field obj.gan_source is not the expected type, validation failed.")
      obj.state&.is_a?(SquareApiClient::GiftCardStatus) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.balance_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.balance_money)
      obj.gan&.is_a?(String) != false || raise("Passed value for field obj.gan is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.customer_ids&.is_a?(Array) != false || raise("Passed value for field obj.customer_ids is not the expected type, validation failed.")
    end
  end
end