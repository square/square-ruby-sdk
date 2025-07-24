# frozen_string_literal: true
require_relative "gift_card_activity_type"
require_relative "money"
require_relative "gift_card_activity_load"
require_relative "gift_card_activity_activate"
require_relative "gift_card_activity_redeem"
require_relative "gift_card_activity_clear_balance"
require_relative "gift_card_activity_deactivate"
require_relative "gift_card_activity_adjust_increment"
require_relative "gift_card_activity_adjust_decrement"
require_relative "gift_card_activity_refund"
require_relative "gift_card_activity_unlinked_activity_refund"
require_relative "gift_card_activity_import"
require_relative "gift_card_activity_block"
require_relative "gift_card_activity_unblock"
require_relative "gift_card_activity_import_reversal"
require_relative "gift_card_activity_transfer_balance_to"
require_relative "gift_card_activity_transfer_balance_from"
require "ostruct"
require "json"

module SquareApiClient
# Represents an action performed on a [gift card](entity:GiftCard) that affects
#  its state or balance.
#  A gift card activity contains information about a specific activity type. For
#  example, a `REDEEM` activity
#  includes a `redeem_activity_details` field that contains information about the
#  redemption.
  class GiftCardActivity
  # @return [String] The Square-assigned ID of the gift card activity.
    attr_reader :id
  # @return [SquareApiClient::GiftCardActivityType] The type of gift card activity.
#  See [Type](#type-type) for possible values
    attr_reader :type
  # @return [String] The ID of the [business location](entity:Location) where the activity occurred.
    attr_reader :location_id
  # @return [String] The timestamp when the gift card activity was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The gift card ID. When creating a gift card activity, `gift_card_id` is not
#  required if
#  `gift_card_gan` is specified.
    attr_reader :gift_card_id
  # @return [String] The gift card account number (GAN). When creating a gift card activity,
#  `gift_card_gan`
#  is not required if `gift_card_id` is specified.
    attr_reader :gift_card_gan
  # @return [SquareApiClient::Money] The final balance on the gift card after the action is completed.
    attr_reader :gift_card_balance_money
  # @return [SquareApiClient::GiftCardActivityLoad] Additional details about a `LOAD` activity, which is used to reload money onto a
#  gift card.
    attr_reader :load_activity_details
  # @return [SquareApiClient::GiftCardActivityActivate] Additional details about an `ACTIVATE` activity, which is used to activate a
#  gift card with
#  an initial balance.
    attr_reader :activate_activity_details
  # @return [SquareApiClient::GiftCardActivityRedeem] Additional details about a `REDEEM` activity, which is used to redeem a gift
#  card for a purchase.
#  For applications that process payments using the Square Payments API, Square
#  creates a `REDEEM` activity that
#  updates the gift card balance after the corresponding
#  [CreatePayment](api-endpoint:Payments-CreatePayment)
#  request is completed. Applications that use a custom payment processing system
#  must call
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  to create the `REDEEM` activity.
    attr_reader :redeem_activity_details
  # @return [SquareApiClient::GiftCardActivityClearBalance] Additional details about a `CLEAR_BALANCE` activity, which is used to set the
#  balance of a gift card to zero.
    attr_reader :clear_balance_activity_details
  # @return [SquareApiClient::GiftCardActivityDeactivate] Additional details about a `DEACTIVATE` activity, which is used to deactivate a
#  gift card.
    attr_reader :deactivate_activity_details
  # @return [SquareApiClient::GiftCardActivityAdjustIncrement] Additional details about an `ADJUST_INCREMENT` activity, which is used to add
#  money to a gift card
#  outside of a typical `ACTIVATE`, `LOAD`, or `REFUND` activity flow.
    attr_reader :adjust_increment_activity_details
  # @return [SquareApiClient::GiftCardActivityAdjustDecrement] Additional details about an `ADJUST_DECREMENT` activity, which is used to deduct
#  money from a gift
#  card outside of a typical `REDEEM` activity flow.
    attr_reader :adjust_decrement_activity_details
  # @return [SquareApiClient::GiftCardActivityRefund] Additional details about a `REFUND` activity, which is used to add money to a
#  gift card when
#  refunding a payment.
#  For applications that refund payments to a gift card using the Square Refunds
#  API, Square automatically
#  creates a `REFUND` activity that updates the gift card balance after a
#  [RefundPayment](api-endpoint:Refunds-RefundPayment)
#  request is completed. Applications that use a custom processing system must call
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  to create the `REFUND` activity.
    attr_reader :refund_activity_details
  # @return [SquareApiClient::GiftCardActivityUnlinkedActivityRefund] Additional details about an `UNLINKED_ACTIVITY_REFUND` activity. This activity
#  is used to add money
#  to a gift card when refunding a payment that was processed using a custom
#  payment processing system
#  and not linked to the gift card.
    attr_reader :unlinked_activity_refund_activity_details
  # @return [SquareApiClient::GiftCardActivityImport] Additional details about an `IMPORT` activity, which Square uses to import a
#  third-party
#  gift card with a balance.
    attr_reader :import_activity_details
  # @return [SquareApiClient::GiftCardActivityBlock] Additional details about a `BLOCK` activity, which Square uses to temporarily
#  block a gift card.
    attr_reader :block_activity_details
  # @return [SquareApiClient::GiftCardActivityUnblock] Additional details about an `UNBLOCK` activity, which Square uses to unblock a
#  gift card.
    attr_reader :unblock_activity_details
  # @return [SquareApiClient::GiftCardActivityImportReversal] Additional details about an `IMPORT_REVERSAL` activity, which Square uses to
#  reverse the
#  import of a third-party gift card.
    attr_reader :import_reversal_activity_details
  # @return [SquareApiClient::GiftCardActivityTransferBalanceTo] Additional details about a `TRANSFER_BALANCE_TO` activity, which Square uses to
#  add money to
#  a gift card as the result of a transfer from another gift card.
    attr_reader :transfer_balance_to_activity_details
  # @return [SquareApiClient::GiftCardActivityTransferBalanceFrom] Additional details about a `TRANSFER_BALANCE_FROM` activity, which Square uses
#  to deduct money from
#  a gift as the result of a transfer to another gift card.
    attr_reader :transfer_balance_from_activity_details
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the gift card activity.
    # @param type [SquareApiClient::GiftCardActivityType] The type of gift card activity.
#  See [Type](#type-type) for possible values
    # @param location_id [String] The ID of the [business location](entity:Location) where the activity occurred.
    # @param created_at [String] The timestamp when the gift card activity was created, in RFC 3339 format.
    # @param gift_card_id [String] The gift card ID. When creating a gift card activity, `gift_card_id` is not
#  required if
#  `gift_card_gan` is specified.
    # @param gift_card_gan [String] The gift card account number (GAN). When creating a gift card activity,
#  `gift_card_gan`
#  is not required if `gift_card_id` is specified.
    # @param gift_card_balance_money [SquareApiClient::Money] The final balance on the gift card after the action is completed.
    # @param load_activity_details [SquareApiClient::GiftCardActivityLoad] Additional details about a `LOAD` activity, which is used to reload money onto a
#  gift card.
    # @param activate_activity_details [SquareApiClient::GiftCardActivityActivate] Additional details about an `ACTIVATE` activity, which is used to activate a
#  gift card with
#  an initial balance.
    # @param redeem_activity_details [SquareApiClient::GiftCardActivityRedeem] Additional details about a `REDEEM` activity, which is used to redeem a gift
#  card for a purchase.
#  For applications that process payments using the Square Payments API, Square
#  creates a `REDEEM` activity that
#  updates the gift card balance after the corresponding
#  [CreatePayment](api-endpoint:Payments-CreatePayment)
#  request is completed. Applications that use a custom payment processing system
#  must call
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  to create the `REDEEM` activity.
    # @param clear_balance_activity_details [SquareApiClient::GiftCardActivityClearBalance] Additional details about a `CLEAR_BALANCE` activity, which is used to set the
#  balance of a gift card to zero.
    # @param deactivate_activity_details [SquareApiClient::GiftCardActivityDeactivate] Additional details about a `DEACTIVATE` activity, which is used to deactivate a
#  gift card.
    # @param adjust_increment_activity_details [SquareApiClient::GiftCardActivityAdjustIncrement] Additional details about an `ADJUST_INCREMENT` activity, which is used to add
#  money to a gift card
#  outside of a typical `ACTIVATE`, `LOAD`, or `REFUND` activity flow.
    # @param adjust_decrement_activity_details [SquareApiClient::GiftCardActivityAdjustDecrement] Additional details about an `ADJUST_DECREMENT` activity, which is used to deduct
#  money from a gift
#  card outside of a typical `REDEEM` activity flow.
    # @param refund_activity_details [SquareApiClient::GiftCardActivityRefund] Additional details about a `REFUND` activity, which is used to add money to a
#  gift card when
#  refunding a payment.
#  For applications that refund payments to a gift card using the Square Refunds
#  API, Square automatically
#  creates a `REFUND` activity that updates the gift card balance after a
#  [RefundPayment](api-endpoint:Refunds-RefundPayment)
#  request is completed. Applications that use a custom processing system must call
#  [CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity)
#  to create the `REFUND` activity.
    # @param unlinked_activity_refund_activity_details [SquareApiClient::GiftCardActivityUnlinkedActivityRefund] Additional details about an `UNLINKED_ACTIVITY_REFUND` activity. This activity
#  is used to add money
#  to a gift card when refunding a payment that was processed using a custom
#  payment processing system
#  and not linked to the gift card.
    # @param import_activity_details [SquareApiClient::GiftCardActivityImport] Additional details about an `IMPORT` activity, which Square uses to import a
#  third-party
#  gift card with a balance.
    # @param block_activity_details [SquareApiClient::GiftCardActivityBlock] Additional details about a `BLOCK` activity, which Square uses to temporarily
#  block a gift card.
    # @param unblock_activity_details [SquareApiClient::GiftCardActivityUnblock] Additional details about an `UNBLOCK` activity, which Square uses to unblock a
#  gift card.
    # @param import_reversal_activity_details [SquareApiClient::GiftCardActivityImportReversal] Additional details about an `IMPORT_REVERSAL` activity, which Square uses to
#  reverse the
#  import of a third-party gift card.
    # @param transfer_balance_to_activity_details [SquareApiClient::GiftCardActivityTransferBalanceTo] Additional details about a `TRANSFER_BALANCE_TO` activity, which Square uses to
#  add money to
#  a gift card as the result of a transfer from another gift card.
    # @param transfer_balance_from_activity_details [SquareApiClient::GiftCardActivityTransferBalanceFrom] Additional details about a `TRANSFER_BALANCE_FROM` activity, which Square uses
#  to deduct money from
#  a gift as the result of a transfer to another gift card.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::GiftCardActivity]
    def initialize(id: OMIT, type:, location_id:, created_at: OMIT, gift_card_id: OMIT, gift_card_gan: OMIT, gift_card_balance_money: OMIT, load_activity_details: OMIT, activate_activity_details: OMIT, redeem_activity_details: OMIT, clear_balance_activity_details: OMIT, deactivate_activity_details: OMIT, adjust_increment_activity_details: OMIT, adjust_decrement_activity_details: OMIT, refund_activity_details: OMIT, unlinked_activity_refund_activity_details: OMIT, import_activity_details: OMIT, block_activity_details: OMIT, unblock_activity_details: OMIT, import_reversal_activity_details: OMIT, transfer_balance_to_activity_details: OMIT, transfer_balance_from_activity_details: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @type = type
      @location_id = location_id
      @created_at = created_at if created_at != OMIT
      @gift_card_id = gift_card_id if gift_card_id != OMIT
      @gift_card_gan = gift_card_gan if gift_card_gan != OMIT
      @gift_card_balance_money = gift_card_balance_money if gift_card_balance_money != OMIT
      @load_activity_details = load_activity_details if load_activity_details != OMIT
      @activate_activity_details = activate_activity_details if activate_activity_details != OMIT
      @redeem_activity_details = redeem_activity_details if redeem_activity_details != OMIT
      @clear_balance_activity_details = clear_balance_activity_details if clear_balance_activity_details != OMIT
      @deactivate_activity_details = deactivate_activity_details if deactivate_activity_details != OMIT
      @adjust_increment_activity_details = adjust_increment_activity_details if adjust_increment_activity_details != OMIT
      @adjust_decrement_activity_details = adjust_decrement_activity_details if adjust_decrement_activity_details != OMIT
      @refund_activity_details = refund_activity_details if refund_activity_details != OMIT
      @unlinked_activity_refund_activity_details = unlinked_activity_refund_activity_details if unlinked_activity_refund_activity_details != OMIT
      @import_activity_details = import_activity_details if import_activity_details != OMIT
      @block_activity_details = block_activity_details if block_activity_details != OMIT
      @unblock_activity_details = unblock_activity_details if unblock_activity_details != OMIT
      @import_reversal_activity_details = import_reversal_activity_details if import_reversal_activity_details != OMIT
      @transfer_balance_to_activity_details = transfer_balance_to_activity_details if transfer_balance_to_activity_details != OMIT
      @transfer_balance_from_activity_details = transfer_balance_from_activity_details if transfer_balance_from_activity_details != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "location_id": location_id, "created_at": created_at, "gift_card_id": gift_card_id, "gift_card_gan": gift_card_gan, "gift_card_balance_money": gift_card_balance_money, "load_activity_details": load_activity_details, "activate_activity_details": activate_activity_details, "redeem_activity_details": redeem_activity_details, "clear_balance_activity_details": clear_balance_activity_details, "deactivate_activity_details": deactivate_activity_details, "adjust_increment_activity_details": adjust_increment_activity_details, "adjust_decrement_activity_details": adjust_decrement_activity_details, "refund_activity_details": refund_activity_details, "unlinked_activity_refund_activity_details": unlinked_activity_refund_activity_details, "import_activity_details": import_activity_details, "block_activity_details": block_activity_details, "unblock_activity_details": unblock_activity_details, "import_reversal_activity_details": import_reversal_activity_details, "transfer_balance_to_activity_details": transfer_balance_to_activity_details, "transfer_balance_from_activity_details": transfer_balance_from_activity_details }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GiftCardActivity
    #
    # @param json_object [String] 
    # @return [SquareApiClient::GiftCardActivity]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      location_id = parsed_json["location_id"]
      created_at = parsed_json["created_at"]
      gift_card_id = parsed_json["gift_card_id"]
      gift_card_gan = parsed_json["gift_card_gan"]
      unless parsed_json["gift_card_balance_money"].nil?
        gift_card_balance_money = parsed_json["gift_card_balance_money"].to_json
        gift_card_balance_money = SquareApiClient::Money.from_json(json_object: gift_card_balance_money)
      else
        gift_card_balance_money = nil
      end
      unless parsed_json["load_activity_details"].nil?
        load_activity_details = parsed_json["load_activity_details"].to_json
        load_activity_details = SquareApiClient::GiftCardActivityLoad.from_json(json_object: load_activity_details)
      else
        load_activity_details = nil
      end
      unless parsed_json["activate_activity_details"].nil?
        activate_activity_details = parsed_json["activate_activity_details"].to_json
        activate_activity_details = SquareApiClient::GiftCardActivityActivate.from_json(json_object: activate_activity_details)
      else
        activate_activity_details = nil
      end
      unless parsed_json["redeem_activity_details"].nil?
        redeem_activity_details = parsed_json["redeem_activity_details"].to_json
        redeem_activity_details = SquareApiClient::GiftCardActivityRedeem.from_json(json_object: redeem_activity_details)
      else
        redeem_activity_details = nil
      end
      unless parsed_json["clear_balance_activity_details"].nil?
        clear_balance_activity_details = parsed_json["clear_balance_activity_details"].to_json
        clear_balance_activity_details = SquareApiClient::GiftCardActivityClearBalance.from_json(json_object: clear_balance_activity_details)
      else
        clear_balance_activity_details = nil
      end
      unless parsed_json["deactivate_activity_details"].nil?
        deactivate_activity_details = parsed_json["deactivate_activity_details"].to_json
        deactivate_activity_details = SquareApiClient::GiftCardActivityDeactivate.from_json(json_object: deactivate_activity_details)
      else
        deactivate_activity_details = nil
      end
      unless parsed_json["adjust_increment_activity_details"].nil?
        adjust_increment_activity_details = parsed_json["adjust_increment_activity_details"].to_json
        adjust_increment_activity_details = SquareApiClient::GiftCardActivityAdjustIncrement.from_json(json_object: adjust_increment_activity_details)
      else
        adjust_increment_activity_details = nil
      end
      unless parsed_json["adjust_decrement_activity_details"].nil?
        adjust_decrement_activity_details = parsed_json["adjust_decrement_activity_details"].to_json
        adjust_decrement_activity_details = SquareApiClient::GiftCardActivityAdjustDecrement.from_json(json_object: adjust_decrement_activity_details)
      else
        adjust_decrement_activity_details = nil
      end
      unless parsed_json["refund_activity_details"].nil?
        refund_activity_details = parsed_json["refund_activity_details"].to_json
        refund_activity_details = SquareApiClient::GiftCardActivityRefund.from_json(json_object: refund_activity_details)
      else
        refund_activity_details = nil
      end
      unless parsed_json["unlinked_activity_refund_activity_details"].nil?
        unlinked_activity_refund_activity_details = parsed_json["unlinked_activity_refund_activity_details"].to_json
        unlinked_activity_refund_activity_details = SquareApiClient::GiftCardActivityUnlinkedActivityRefund.from_json(json_object: unlinked_activity_refund_activity_details)
      else
        unlinked_activity_refund_activity_details = nil
      end
      unless parsed_json["import_activity_details"].nil?
        import_activity_details = parsed_json["import_activity_details"].to_json
        import_activity_details = SquareApiClient::GiftCardActivityImport.from_json(json_object: import_activity_details)
      else
        import_activity_details = nil
      end
      unless parsed_json["block_activity_details"].nil?
        block_activity_details = parsed_json["block_activity_details"].to_json
        block_activity_details = SquareApiClient::GiftCardActivityBlock.from_json(json_object: block_activity_details)
      else
        block_activity_details = nil
      end
      unless parsed_json["unblock_activity_details"].nil?
        unblock_activity_details = parsed_json["unblock_activity_details"].to_json
        unblock_activity_details = SquareApiClient::GiftCardActivityUnblock.from_json(json_object: unblock_activity_details)
      else
        unblock_activity_details = nil
      end
      unless parsed_json["import_reversal_activity_details"].nil?
        import_reversal_activity_details = parsed_json["import_reversal_activity_details"].to_json
        import_reversal_activity_details = SquareApiClient::GiftCardActivityImportReversal.from_json(json_object: import_reversal_activity_details)
      else
        import_reversal_activity_details = nil
      end
      unless parsed_json["transfer_balance_to_activity_details"].nil?
        transfer_balance_to_activity_details = parsed_json["transfer_balance_to_activity_details"].to_json
        transfer_balance_to_activity_details = SquareApiClient::GiftCardActivityTransferBalanceTo.from_json(json_object: transfer_balance_to_activity_details)
      else
        transfer_balance_to_activity_details = nil
      end
      unless parsed_json["transfer_balance_from_activity_details"].nil?
        transfer_balance_from_activity_details = parsed_json["transfer_balance_from_activity_details"].to_json
        transfer_balance_from_activity_details = SquareApiClient::GiftCardActivityTransferBalanceFrom.from_json(json_object: transfer_balance_from_activity_details)
      else
        transfer_balance_from_activity_details = nil
      end
      new(
        id: id,
        type: type,
        location_id: location_id,
        created_at: created_at,
        gift_card_id: gift_card_id,
        gift_card_gan: gift_card_gan,
        gift_card_balance_money: gift_card_balance_money,
        load_activity_details: load_activity_details,
        activate_activity_details: activate_activity_details,
        redeem_activity_details: redeem_activity_details,
        clear_balance_activity_details: clear_balance_activity_details,
        deactivate_activity_details: deactivate_activity_details,
        adjust_increment_activity_details: adjust_increment_activity_details,
        adjust_decrement_activity_details: adjust_decrement_activity_details,
        refund_activity_details: refund_activity_details,
        unlinked_activity_refund_activity_details: unlinked_activity_refund_activity_details,
        import_activity_details: import_activity_details,
        block_activity_details: block_activity_details,
        unblock_activity_details: unblock_activity_details,
        import_reversal_activity_details: import_reversal_activity_details,
        transfer_balance_to_activity_details: transfer_balance_to_activity_details,
        transfer_balance_from_activity_details: transfer_balance_from_activity_details,
        additional_properties: struct
      )
    end
# Serialize an instance of GiftCardActivity to a JSON object
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
      obj.type.is_a?(SquareApiClient::GiftCardActivityType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.gift_card_id&.is_a?(String) != false || raise("Passed value for field obj.gift_card_id is not the expected type, validation failed.")
      obj.gift_card_gan&.is_a?(String) != false || raise("Passed value for field obj.gift_card_gan is not the expected type, validation failed.")
      obj.gift_card_balance_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.gift_card_balance_money)
      obj.load_activity_details.nil? || SquareApiClient::GiftCardActivityLoad.validate_raw(obj: obj.load_activity_details)
      obj.activate_activity_details.nil? || SquareApiClient::GiftCardActivityActivate.validate_raw(obj: obj.activate_activity_details)
      obj.redeem_activity_details.nil? || SquareApiClient::GiftCardActivityRedeem.validate_raw(obj: obj.redeem_activity_details)
      obj.clear_balance_activity_details.nil? || SquareApiClient::GiftCardActivityClearBalance.validate_raw(obj: obj.clear_balance_activity_details)
      obj.deactivate_activity_details.nil? || SquareApiClient::GiftCardActivityDeactivate.validate_raw(obj: obj.deactivate_activity_details)
      obj.adjust_increment_activity_details.nil? || SquareApiClient::GiftCardActivityAdjustIncrement.validate_raw(obj: obj.adjust_increment_activity_details)
      obj.adjust_decrement_activity_details.nil? || SquareApiClient::GiftCardActivityAdjustDecrement.validate_raw(obj: obj.adjust_decrement_activity_details)
      obj.refund_activity_details.nil? || SquareApiClient::GiftCardActivityRefund.validate_raw(obj: obj.refund_activity_details)
      obj.unlinked_activity_refund_activity_details.nil? || SquareApiClient::GiftCardActivityUnlinkedActivityRefund.validate_raw(obj: obj.unlinked_activity_refund_activity_details)
      obj.import_activity_details.nil? || SquareApiClient::GiftCardActivityImport.validate_raw(obj: obj.import_activity_details)
      obj.block_activity_details.nil? || SquareApiClient::GiftCardActivityBlock.validate_raw(obj: obj.block_activity_details)
      obj.unblock_activity_details.nil? || SquareApiClient::GiftCardActivityUnblock.validate_raw(obj: obj.unblock_activity_details)
      obj.import_reversal_activity_details.nil? || SquareApiClient::GiftCardActivityImportReversal.validate_raw(obj: obj.import_reversal_activity_details)
      obj.transfer_balance_to_activity_details.nil? || SquareApiClient::GiftCardActivityTransferBalanceTo.validate_raw(obj: obj.transfer_balance_to_activity_details)
      obj.transfer_balance_from_activity_details.nil? || SquareApiClient::GiftCardActivityTransferBalanceFrom.validate_raw(obj: obj.transfer_balance_from_activity_details)
    end
  end
end