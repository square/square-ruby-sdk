# frozen_string_literal: true
require_relative "checkout_options"
require_relative "pre_populated_data"
require "ostruct"
require "json"

module square.rb
  class PaymentLink
  # @return [String] The Square-assigned ID of the payment link.
    attr_reader :id
  # @return [Integer] The Square-assigned version number, which is incremented each time an update is
#  committed to the payment link.
    attr_reader :version
  # @return [String] The optional description of the `payment_link` object.
#  It is primarily for use by your application and is not used anywhere.
    attr_reader :description
  # @return [String] The ID of the order associated with the payment link.
    attr_reader :order_id
  # @return [square.rb::CheckoutOptions] The checkout options configured for the payment link.
#  For more information, see [Optional Checkout
#  ps://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).
    attr_reader :checkout_options
  # @return [square.rb::PrePopulatedData] Describes buyer data to prepopulate
#  on the checkout page.
    attr_reader :pre_populated_data
  # @return [String] The shortened URL of the payment link.
    attr_reader :url
  # @return [String] The long URL of the payment link.
    attr_reader :long_url
  # @return [String] The timestamp when the payment link was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp when the payment link was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [String] An optional note. After Square processes the payment, this note is added to the
#  resulting `Payment`.
    attr_reader :payment_note
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the payment link.
    # @param version [Integer] The Square-assigned version number, which is incremented each time an update is
#  committed to the payment link.
    # @param description [String] The optional description of the `payment_link` object.
#  It is primarily for use by your application and is not used anywhere.
    # @param order_id [String] The ID of the order associated with the payment link.
    # @param checkout_options [square.rb::CheckoutOptions] The checkout options configured for the payment link.
#  For more information, see [Optional Checkout
#  ps://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).
    # @param pre_populated_data [square.rb::PrePopulatedData] Describes buyer data to prepopulate
#  on the checkout page.
    # @param url [String] The shortened URL of the payment link.
    # @param long_url [String] The long URL of the payment link.
    # @param created_at [String] The timestamp when the payment link was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp when the payment link was last updated, in RFC 3339 format.
    # @param payment_note [String] An optional note. After Square processes the payment, this note is added to the
#  resulting `Payment`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::PaymentLink]
    def initialize(id: OMIT, version:, description: OMIT, order_id: OMIT, checkout_options: OMIT, pre_populated_data: OMIT, url: OMIT, long_url: OMIT, created_at: OMIT, updated_at: OMIT, payment_note: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @version = version
      @description = description if description != OMIT
      @order_id = order_id if order_id != OMIT
      @checkout_options = checkout_options if checkout_options != OMIT
      @pre_populated_data = pre_populated_data if pre_populated_data != OMIT
      @url = url if url != OMIT
      @long_url = long_url if long_url != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @payment_note = payment_note if payment_note != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "version": version, "description": description, "order_id": order_id, "checkout_options": checkout_options, "pre_populated_data": pre_populated_data, "url": url, "long_url": long_url, "created_at": created_at, "updated_at": updated_at, "payment_note": payment_note }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PaymentLink
    #
    # @param json_object [String] 
    # @return [square.rb::PaymentLink]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      version = parsed_json["version"]
      description = parsed_json["description"]
      order_id = parsed_json["order_id"]
      unless parsed_json["checkout_options"].nil?
        checkout_options = parsed_json["checkout_options"].to_json
        checkout_options = square.rb::CheckoutOptions.from_json(json_object: checkout_options)
      else
        checkout_options = nil
      end
      unless parsed_json["pre_populated_data"].nil?
        pre_populated_data = parsed_json["pre_populated_data"].to_json
        pre_populated_data = square.rb::PrePopulatedData.from_json(json_object: pre_populated_data)
      else
        pre_populated_data = nil
      end
      url = parsed_json["url"]
      long_url = parsed_json["long_url"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      payment_note = parsed_json["payment_note"]
      new(
        id: id,
        version: version,
        description: description,
        order_id: order_id,
        checkout_options: checkout_options,
        pre_populated_data: pre_populated_data,
        url: url,
        long_url: long_url,
        created_at: created_at,
        updated_at: updated_at,
        payment_note: payment_note,
        additional_properties: struct
      )
    end
# Serialize an instance of PaymentLink to a JSON object
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
      obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.order_id&.is_a?(String) != false || raise("Passed value for field obj.order_id is not the expected type, validation failed.")
      obj.checkout_options.nil? || square.rb::CheckoutOptions.validate_raw(obj: obj.checkout_options)
      obj.pre_populated_data.nil? || square.rb::PrePopulatedData.validate_raw(obj: obj.pre_populated_data)
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
      obj.long_url&.is_a?(String) != false || raise("Passed value for field obj.long_url is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
      obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
    end
  end
end