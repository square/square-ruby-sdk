# frozen_string_literal: true
require_relative "order_source"
require_relative "order_line_item"
require_relative "order_line_item_tax"
require_relative "order_line_item_discount"
require_relative "order_service_charge"
require_relative "fulfillment"
require_relative "order_return"
require_relative "order_money_amounts"
require_relative "order_rounding_adjustment"
require_relative "tender"
require_relative "refund"
require_relative "order_state"
require_relative "money"
require_relative "order_pricing_options"
require_relative "order_reward"
require "ostruct"
require "json"

module SquareApiClient
# Contains all information related to a single order to process with Square,
#  including line items that specify the products to purchase. `Order` objects also
#  include information about any associated tenders, refunds, and returns.
#  All Connect V2 Transactions have all been converted to Orders including all
#  associated
#  itemization data.
  class Order
  # @return [String] The order's unique ID.
    attr_reader :id
  # @return [String] The ID of the seller location that this order is associated with.
    attr_reader :location_id
  # @return [String] A client-specified ID to associate an entity in another system
#  with this order.
    attr_reader :reference_id
  # @return [SquareApiClient::OrderSource] The origination details of the order.
    attr_reader :source
  # @return [String] The ID of the [customer](entity:Customer) associated with the order.
#  You should specify a `customer_id` on the order (or the payment) to ensure that
#  transactions
#  are reliably linked to customers. Omitting this field might result in the
#  creation of new
#  [instant
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#instant-profiles).
    attr_reader :customer_id
  # @return [Array<SquareApiClient::OrderLineItem>] The line items included in the order.
    attr_reader :line_items
  # @return [Array<SquareApiClient::OrderLineItemTax>] The list of all taxes associated with the order.
#  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM`
#  scope, an
#  `OrderLineItemAppliedTax` must be added to each line item that the tax applies
#  to. For taxes
#  with `ORDER` scope, the server generates an `OrderLineItemAppliedTax` for every
#  line item.
#  On reads, each tax in the list includes the total amount of that tax applied to
#  the order.
#  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, using the
#  deprecated
#  `line_items.taxes` field results in an error. Use `line_items.applied_taxes`
#  instead.
    attr_reader :taxes
  # @return [Array<SquareApiClient::OrderLineItemDiscount>] The list of all discounts associated with the order.
#  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped
#  to `LINE_ITEM`,
#  an `OrderLineItemAppliedDiscount` must be added to each line item that the
#  discount applies to.
#  For discounts with `ORDER` scope, the server generates an
#  `OrderLineItemAppliedDiscount`
#  for every line item.
#  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, using
#  the deprecated
#  `line_items.discounts` field results in an error. Use
#  `line_items.applied_discounts`
#  instead.
    attr_reader :discounts
  # @return [Array<SquareApiClient::OrderServiceCharge>] A list of service charges applied to the order.
    attr_reader :service_charges
  # @return [Array<SquareApiClient::Fulfillment>] Details about order fulfillment.
#  Orders can only be created with at most one fulfillment. However, orders
#  returned
#  by the API might contain multiple fulfillments.
    attr_reader :fulfillments
  # @return [Array<SquareApiClient::OrderReturn>] A collection of items from sale orders being returned in this one. Normally part
#  of an
#  itemized return or exchange. There is exactly one `Return` object per sale
#  `Order` being
#  referenced.
    attr_reader :returns
  # @return [SquareApiClient::OrderMoneyAmounts] The rollup of the returned money amounts.
    attr_reader :return_amounts
  # @return [SquareApiClient::OrderMoneyAmounts] The net money amounts (sale money - return money).
    attr_reader :net_amounts
  # @return [SquareApiClient::OrderRoundingAdjustment] A positive rounding adjustment to the total of the order. This adjustment is
#  commonly
#  used to apply cash rounding when the minimum unit of account is smaller than the
#  lowest physical
#  denomination of the currency.
    attr_reader :rounding_adjustment
  # @return [Array<SquareApiClient::Tender>] The tenders that were used to pay for the order.
    attr_reader :tenders
  # @return [Array<SquareApiClient::Refund>] The refunds that are part of this order.
    attr_reader :refunds
  # @return [Hash{String => String}] Application-defined data attached to this order. Metadata fields are intended
#  to store descriptive references or associations with an entity in another system
#  or store brief
#  information about the object. Square does not process this field; it only stores
#  and returns it
#  in relevant API calls. Do not use metadata to store any sensitive information
#  (such as personally
#  identifiable information or card details).
#  Keys written by applications must be 60 characters or less and must be in the
#  character set
#  `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These
#  keys are prefixed
#  with a namespace, separated from the key with a ':' character.
#  Values have a maximum length of 255 characters.
#  An application can have up to 10 entries per metadata field.
#  Entries written by applications are private and can only be read or modified by
#  the same
#  application.
#  For more information, see
#  [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    attr_reader :metadata
  # @return [String] The timestamp for when the order was created, at server side, in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :created_at
  # @return [String] The timestamp for when the order was last updated, at server side, in RFC 3339
#  format (for example, "2016-09-04T23:59:33.123Z").
    attr_reader :updated_at
  # @return [String] The timestamp for when the order reached a terminal [state](entity:OrderState),
#  in RFC 3339 format (for example "2016-09-04T23:59:33.123Z").
    attr_reader :closed_at
  # @return [SquareApiClient::OrderState] The current state of the order.
#  See [OrderState](#type-orderstate) for possible values
    attr_reader :state
  # @return [Integer] The version number, which is incremented each time an update is committed to the
#  order.
#  Orders not created through the API do not include a version number and
#  therefore cannot be updated.
#  [Read more about working with
#  ns](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders).
    attr_reader :version
  # @return [SquareApiClient::Money] The total amount of money to collect for the order.
    attr_reader :total_money
  # @return [SquareApiClient::Money] The total amount of tax money to collect for the order.
    attr_reader :total_tax_money
  # @return [SquareApiClient::Money] The total amount of discount money to collect for the order.
    attr_reader :total_discount_money
  # @return [SquareApiClient::Money] The total amount of tip money to collect for the order.
    attr_reader :total_tip_money
  # @return [SquareApiClient::Money] The total amount of money collected in service charges for the order.
#  Note: `total_service_charge_money` is the sum of `applied_money` fields for each
#  individual
#  service charge. Therefore, `total_service_charge_money` only includes inclusive
#  tax amounts,
#  not additive tax amounts.
    attr_reader :total_service_charge_money
  # @return [String] A short-term identifier for the order (such as a customer first name,
#  table number, or auto-generated order number that resets daily).
    attr_reader :ticket_name
  # @return [SquareApiClient::OrderPricingOptions] Pricing options for an order. The options affect how the order's price is
#  calculated.
#  They can be used, for example, to apply automatic price adjustments that are
#  based on
#  preconfigured [pricing rules](entity:CatalogPricingRule).
    attr_reader :pricing_options
  # @return [Array<SquareApiClient::OrderReward>] A set-like list of Rewards that have been added to the Order.
    attr_reader :rewards
  # @return [SquareApiClient::Money] The net amount of money due on the order.
    attr_reader :net_amount_due_money
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The order's unique ID.
    # @param location_id [String] The ID of the seller location that this order is associated with.
    # @param reference_id [String] A client-specified ID to associate an entity in another system
#  with this order.
    # @param source [SquareApiClient::OrderSource] The origination details of the order.
    # @param customer_id [String] The ID of the [customer](entity:Customer) associated with the order.
#  You should specify a `customer_id` on the order (or the payment) to ensure that
#  transactions
#  are reliably linked to customers. Omitting this field might result in the
#  creation of new
#  [instant
#  ttps://developer.squareup.com/docs/customers-api/what-it-does#instant-profiles).
    # @param line_items [Array<SquareApiClient::OrderLineItem>] The line items included in the order.
    # @param taxes [Array<SquareApiClient::OrderLineItemTax>] The list of all taxes associated with the order.
#  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM`
#  scope, an
#  `OrderLineItemAppliedTax` must be added to each line item that the tax applies
#  to. For taxes
#  with `ORDER` scope, the server generates an `OrderLineItemAppliedTax` for every
#  line item.
#  On reads, each tax in the list includes the total amount of that tax applied to
#  the order.
#  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, using the
#  deprecated
#  `line_items.taxes` field results in an error. Use `line_items.applied_taxes`
#  instead.
    # @param discounts [Array<SquareApiClient::OrderLineItemDiscount>] The list of all discounts associated with the order.
#  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped
#  to `LINE_ITEM`,
#  an `OrderLineItemAppliedDiscount` must be added to each line item that the
#  discount applies to.
#  For discounts with `ORDER` scope, the server generates an
#  `OrderLineItemAppliedDiscount`
#  for every line item.
#  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, using
#  the deprecated
#  `line_items.discounts` field results in an error. Use
#  `line_items.applied_discounts`
#  instead.
    # @param service_charges [Array<SquareApiClient::OrderServiceCharge>] A list of service charges applied to the order.
    # @param fulfillments [Array<SquareApiClient::Fulfillment>] Details about order fulfillment.
#  Orders can only be created with at most one fulfillment. However, orders
#  returned
#  by the API might contain multiple fulfillments.
    # @param returns [Array<SquareApiClient::OrderReturn>] A collection of items from sale orders being returned in this one. Normally part
#  of an
#  itemized return or exchange. There is exactly one `Return` object per sale
#  `Order` being
#  referenced.
    # @param return_amounts [SquareApiClient::OrderMoneyAmounts] The rollup of the returned money amounts.
    # @param net_amounts [SquareApiClient::OrderMoneyAmounts] The net money amounts (sale money - return money).
    # @param rounding_adjustment [SquareApiClient::OrderRoundingAdjustment] A positive rounding adjustment to the total of the order. This adjustment is
#  commonly
#  used to apply cash rounding when the minimum unit of account is smaller than the
#  lowest physical
#  denomination of the currency.
    # @param tenders [Array<SquareApiClient::Tender>] The tenders that were used to pay for the order.
    # @param refunds [Array<SquareApiClient::Refund>] The refunds that are part of this order.
    # @param metadata [Hash{String => String}] Application-defined data attached to this order. Metadata fields are intended
#  to store descriptive references or associations with an entity in another system
#  or store brief
#  information about the object. Square does not process this field; it only stores
#  and returns it
#  in relevant API calls. Do not use metadata to store any sensitive information
#  (such as personally
#  identifiable information or card details).
#  Keys written by applications must be 60 characters or less and must be in the
#  character set
#  `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These
#  keys are prefixed
#  with a namespace, separated from the key with a ':' character.
#  Values have a maximum length of 255 characters.
#  An application can have up to 10 entries per metadata field.
#  Entries written by applications are private and can only be read or modified by
#  the same
#  application.
#  For more information, see
#  [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
    # @param created_at [String] The timestamp for when the order was created, at server side, in RFC 3339 format
#  (for example, "2016-09-04T23:59:33.123Z").
    # @param updated_at [String] The timestamp for when the order was last updated, at server side, in RFC 3339
#  format (for example, "2016-09-04T23:59:33.123Z").
    # @param closed_at [String] The timestamp for when the order reached a terminal [state](entity:OrderState),
#  in RFC 3339 format (for example "2016-09-04T23:59:33.123Z").
    # @param state [SquareApiClient::OrderState] The current state of the order.
#  See [OrderState](#type-orderstate) for possible values
    # @param version [Integer] The version number, which is incremented each time an update is committed to the
#  order.
#  Orders not created through the API do not include a version number and
#  therefore cannot be updated.
#  [Read more about working with
#  ns](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders).
    # @param total_money [SquareApiClient::Money] The total amount of money to collect for the order.
    # @param total_tax_money [SquareApiClient::Money] The total amount of tax money to collect for the order.
    # @param total_discount_money [SquareApiClient::Money] The total amount of discount money to collect for the order.
    # @param total_tip_money [SquareApiClient::Money] The total amount of tip money to collect for the order.
    # @param total_service_charge_money [SquareApiClient::Money] The total amount of money collected in service charges for the order.
#  Note: `total_service_charge_money` is the sum of `applied_money` fields for each
#  individual
#  service charge. Therefore, `total_service_charge_money` only includes inclusive
#  tax amounts,
#  not additive tax amounts.
    # @param ticket_name [String] A short-term identifier for the order (such as a customer first name,
#  table number, or auto-generated order number that resets daily).
    # @param pricing_options [SquareApiClient::OrderPricingOptions] Pricing options for an order. The options affect how the order's price is
#  calculated.
#  They can be used, for example, to apply automatic price adjustments that are
#  based on
#  preconfigured [pricing rules](entity:CatalogPricingRule).
    # @param rewards [Array<SquareApiClient::OrderReward>] A set-like list of Rewards that have been added to the Order.
    # @param net_amount_due_money [SquareApiClient::Money] The net amount of money due on the order.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Order]
    def initialize(id: OMIT, location_id:, reference_id: OMIT, source: OMIT, customer_id: OMIT, line_items: OMIT, taxes: OMIT, discounts: OMIT, service_charges: OMIT, fulfillments: OMIT, returns: OMIT, return_amounts: OMIT, net_amounts: OMIT, rounding_adjustment: OMIT, tenders: OMIT, refunds: OMIT, metadata: OMIT, created_at: OMIT, updated_at: OMIT, closed_at: OMIT, state: OMIT, version: OMIT, total_money: OMIT, total_tax_money: OMIT, total_discount_money: OMIT, total_tip_money: OMIT, total_service_charge_money: OMIT, ticket_name: OMIT, pricing_options: OMIT, rewards: OMIT, net_amount_due_money: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @location_id = location_id
      @reference_id = reference_id if reference_id != OMIT
      @source = source if source != OMIT
      @customer_id = customer_id if customer_id != OMIT
      @line_items = line_items if line_items != OMIT
      @taxes = taxes if taxes != OMIT
      @discounts = discounts if discounts != OMIT
      @service_charges = service_charges if service_charges != OMIT
      @fulfillments = fulfillments if fulfillments != OMIT
      @returns = returns if returns != OMIT
      @return_amounts = return_amounts if return_amounts != OMIT
      @net_amounts = net_amounts if net_amounts != OMIT
      @rounding_adjustment = rounding_adjustment if rounding_adjustment != OMIT
      @tenders = tenders if tenders != OMIT
      @refunds = refunds if refunds != OMIT
      @metadata = metadata if metadata != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @closed_at = closed_at if closed_at != OMIT
      @state = state if state != OMIT
      @version = version if version != OMIT
      @total_money = total_money if total_money != OMIT
      @total_tax_money = total_tax_money if total_tax_money != OMIT
      @total_discount_money = total_discount_money if total_discount_money != OMIT
      @total_tip_money = total_tip_money if total_tip_money != OMIT
      @total_service_charge_money = total_service_charge_money if total_service_charge_money != OMIT
      @ticket_name = ticket_name if ticket_name != OMIT
      @pricing_options = pricing_options if pricing_options != OMIT
      @rewards = rewards if rewards != OMIT
      @net_amount_due_money = net_amount_due_money if net_amount_due_money != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "location_id": location_id, "reference_id": reference_id, "source": source, "customer_id": customer_id, "line_items": line_items, "taxes": taxes, "discounts": discounts, "service_charges": service_charges, "fulfillments": fulfillments, "returns": returns, "return_amounts": return_amounts, "net_amounts": net_amounts, "rounding_adjustment": rounding_adjustment, "tenders": tenders, "refunds": refunds, "metadata": metadata, "created_at": created_at, "updated_at": updated_at, "closed_at": closed_at, "state": state, "version": version, "total_money": total_money, "total_tax_money": total_tax_money, "total_discount_money": total_discount_money, "total_tip_money": total_tip_money, "total_service_charge_money": total_service_charge_money, "ticket_name": ticket_name, "pricing_options": pricing_options, "rewards": rewards, "net_amount_due_money": net_amount_due_money }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Order
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Order]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      location_id = parsed_json["location_id"]
      reference_id = parsed_json["reference_id"]
      unless parsed_json["source"].nil?
        source = parsed_json["source"].to_json
        source = SquareApiClient::OrderSource.from_json(json_object: source)
      else
        source = nil
      end
      customer_id = parsed_json["customer_id"]
      line_items = parsed_json["line_items"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderLineItem.from_json(json_object: item)
end
      taxes = parsed_json["taxes"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderLineItemTax.from_json(json_object: item)
end
      discounts = parsed_json["discounts"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderLineItemDiscount.from_json(json_object: item)
end
      service_charges = parsed_json["service_charges"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderServiceCharge.from_json(json_object: item)
end
      fulfillments = parsed_json["fulfillments"]&.map do | item |
  item = item.to_json
  SquareApiClient::Fulfillment.from_json(json_object: item)
end
      returns = parsed_json["returns"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReturn.from_json(json_object: item)
end
      unless parsed_json["return_amounts"].nil?
        return_amounts = parsed_json["return_amounts"].to_json
        return_amounts = SquareApiClient::OrderMoneyAmounts.from_json(json_object: return_amounts)
      else
        return_amounts = nil
      end
      unless parsed_json["net_amounts"].nil?
        net_amounts = parsed_json["net_amounts"].to_json
        net_amounts = SquareApiClient::OrderMoneyAmounts.from_json(json_object: net_amounts)
      else
        net_amounts = nil
      end
      unless parsed_json["rounding_adjustment"].nil?
        rounding_adjustment = parsed_json["rounding_adjustment"].to_json
        rounding_adjustment = SquareApiClient::OrderRoundingAdjustment.from_json(json_object: rounding_adjustment)
      else
        rounding_adjustment = nil
      end
      tenders = parsed_json["tenders"]&.map do | item |
  item = item.to_json
  SquareApiClient::Tender.from_json(json_object: item)
end
      refunds = parsed_json["refunds"]&.map do | item |
  item = item.to_json
  SquareApiClient::Refund.from_json(json_object: item)
end
      metadata = parsed_json["metadata"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      closed_at = parsed_json["closed_at"]
      state = parsed_json["state"]
      version = parsed_json["version"]
      unless parsed_json["total_money"].nil?
        total_money = parsed_json["total_money"].to_json
        total_money = SquareApiClient::Money.from_json(json_object: total_money)
      else
        total_money = nil
      end
      unless parsed_json["total_tax_money"].nil?
        total_tax_money = parsed_json["total_tax_money"].to_json
        total_tax_money = SquareApiClient::Money.from_json(json_object: total_tax_money)
      else
        total_tax_money = nil
      end
      unless parsed_json["total_discount_money"].nil?
        total_discount_money = parsed_json["total_discount_money"].to_json
        total_discount_money = SquareApiClient::Money.from_json(json_object: total_discount_money)
      else
        total_discount_money = nil
      end
      unless parsed_json["total_tip_money"].nil?
        total_tip_money = parsed_json["total_tip_money"].to_json
        total_tip_money = SquareApiClient::Money.from_json(json_object: total_tip_money)
      else
        total_tip_money = nil
      end
      unless parsed_json["total_service_charge_money"].nil?
        total_service_charge_money = parsed_json["total_service_charge_money"].to_json
        total_service_charge_money = SquareApiClient::Money.from_json(json_object: total_service_charge_money)
      else
        total_service_charge_money = nil
      end
      ticket_name = parsed_json["ticket_name"]
      unless parsed_json["pricing_options"].nil?
        pricing_options = parsed_json["pricing_options"].to_json
        pricing_options = SquareApiClient::OrderPricingOptions.from_json(json_object: pricing_options)
      else
        pricing_options = nil
      end
      rewards = parsed_json["rewards"]&.map do | item |
  item = item.to_json
  SquareApiClient::OrderReward.from_json(json_object: item)
end
      unless parsed_json["net_amount_due_money"].nil?
        net_amount_due_money = parsed_json["net_amount_due_money"].to_json
        net_amount_due_money = SquareApiClient::Money.from_json(json_object: net_amount_due_money)
      else
        net_amount_due_money = nil
      end
      new(
        id: id,
        location_id: location_id,
        reference_id: reference_id,
        source: source,
        customer_id: customer_id,
        line_items: line_items,
        taxes: taxes,
        discounts: discounts,
        service_charges: service_charges,
        fulfillments: fulfillments,
        returns: returns,
        return_amounts: return_amounts,
        net_amounts: net_amounts,
        rounding_adjustment: rounding_adjustment,
        tenders: tenders,
        refunds: refunds,
        metadata: metadata,
        created_at: created_at,
        updated_at: updated_at,
        closed_at: closed_at,
        state: state,
        version: version,
        total_money: total_money,
        total_tax_money: total_tax_money,
        total_discount_money: total_discount_money,
        total_tip_money: total_tip_money,
        total_service_charge_money: total_service_charge_money,
        ticket_name: ticket_name,
        pricing_options: pricing_options,
        rewards: rewards,
        net_amount_due_money: net_amount_due_money,
        additional_properties: struct
      )
    end
# Serialize an instance of Order to a JSON object
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
      obj.location_id.is_a?(String) != false || raise("Passed value for field obj.location_id is not the expected type, validation failed.")
      obj.reference_id&.is_a?(String) != false || raise("Passed value for field obj.reference_id is not the expected type, validation failed.")
      obj.source.nil? || SquareApiClient::OrderSource.validate_raw(obj: obj.source)
      obj.customer_id&.is_a?(String) != false || raise("Passed value for field obj.customer_id is not the expected type, validation failed.")
      obj.line_items&.is_a?(Array) != false || raise("Passed value for field obj.line_items is not the expected type, validation failed.")
      obj.taxes&.is_a?(Array) != false || raise("Passed value for field obj.taxes is not the expected type, validation failed.")
      obj.discounts&.is_a?(Array) != false || raise("Passed value for field obj.discounts is not the expected type, validation failed.")
      obj.service_charges&.is_a?(Array) != false || raise("Passed value for field obj.service_charges is not the expected type, validation failed.")
      obj.fulfillments&.is_a?(Array) != false || raise("Passed value for field obj.fulfillments is not the expected type, validation failed.")
      obj.returns&.is_a?(Array) != false || raise("Passed value for field obj.returns is not the expected type, validation failed.")
      obj.return_amounts.nil? || SquareApiClient::OrderMoneyAmounts.validate_raw(obj: obj.return_amounts)
      obj.net_amounts.nil? || SquareApiClient::OrderMoneyAmounts.validate_raw(obj: obj.net_amounts)
      obj.rounding_adjustment.nil? || SquareApiClient::OrderRoundingAdjustment.validate_raw(obj: obj.rounding_adjustment)
      obj.tenders&.is_a?(Array) != false || raise("Passed value for field obj.tenders is not the expected type, validation failed.")
      obj.refunds&.is_a?(Array) != false || raise("Passed value for field obj.refunds is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.closed_at&.is_a?(String) != false || raise("Passed value for field obj.closed_at is not the expected type, validation failed.")
      obj.state&.is_a?(SquareApiClient::OrderState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.total_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.total_money)
      obj.total_tax_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.total_tax_money)
      obj.total_discount_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.total_discount_money)
      obj.total_tip_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.total_tip_money)
      obj.total_service_charge_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.total_service_charge_money)
      obj.ticket_name&.is_a?(String) != false || raise("Passed value for field obj.ticket_name is not the expected type, validation failed.")
      obj.pricing_options.nil? || SquareApiClient::OrderPricingOptions.validate_raw(obj: obj.pricing_options)
      obj.rewards&.is_a?(Array) != false || raise("Passed value for field obj.rewards is not the expected type, validation failed.")
      obj.net_amount_due_money.nil? || SquareApiClient::Money.validate_raw(obj: obj.net_amount_due_money)
    end
  end
end