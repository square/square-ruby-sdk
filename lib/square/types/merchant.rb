# frozen_string_literal: true
require_relative "country"
require_relative "currency"
require_relative "merchant_status"
require "ostruct"
require "json"

module square.rb
# Represents a business that sells with Square.
  class Merchant
  # @return [String] The Square-issued ID of the merchant.
    attr_reader :id
  # @return [String] The name of the merchant's overall business.
    attr_reader :business_name
  # @return [square.rb::Country] The country code associated with the merchant, in the two-letter format of ISO
#  3166. For example, `US` or `JP`.
#  See [Country](#type-country) for possible values
    attr_reader :country
  # @return [String] The code indicating the [language
#  oper.squareup.com/docs/build-basics/general-considerations/language-preferences)
#  of the merchant, in [BCP 47
#  format](https://tools.ietf.org/html/bcp47#appendix-A). For example, `en-US` or
#  `fr-CA`.
    attr_reader :language_code
  # @return [square.rb::Currency] The currency associated with the merchant, in ISO 4217 format. For example, the
#  currency code for US dollars is `USD`.
#  See [Currency](#type-currency) for possible values
    attr_reader :currency
  # @return [square.rb::MerchantStatus] The merchant's status.
#  See [MerchantStatus](#type-merchantstatus) for possible values
    attr_reader :status
  # @return [String] The ID of the [main
#  ion`](https://developer.squareup.com/docs/locations-api#about-the-main-location)
#  for this merchant.
    attr_reader :main_location_id
  # @return [String] The time when the merchant was created, in RFC 3339 format.
#  For more information, see [Working with
#  Dates](https://developer.squareup.com/docs/build-basics/working-with-dates).
    attr_reader :created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-issued ID of the merchant.
    # @param business_name [String] The name of the merchant's overall business.
    # @param country [square.rb::Country] The country code associated with the merchant, in the two-letter format of ISO
#  3166. For example, `US` or `JP`.
#  See [Country](#type-country) for possible values
    # @param language_code [String] The code indicating the [language
#  oper.squareup.com/docs/build-basics/general-considerations/language-preferences)
#  of the merchant, in [BCP 47
#  format](https://tools.ietf.org/html/bcp47#appendix-A). For example, `en-US` or
#  `fr-CA`.
    # @param currency [square.rb::Currency] The currency associated with the merchant, in ISO 4217 format. For example, the
#  currency code for US dollars is `USD`.
#  See [Currency](#type-currency) for possible values
    # @param status [square.rb::MerchantStatus] The merchant's status.
#  See [MerchantStatus](#type-merchantstatus) for possible values
    # @param main_location_id [String] The ID of the [main
#  ion`](https://developer.squareup.com/docs/locations-api#about-the-main-location)
#  for this merchant.
    # @param created_at [String] The time when the merchant was created, in RFC 3339 format.
#  For more information, see [Working with
#  Dates](https://developer.squareup.com/docs/build-basics/working-with-dates).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Merchant]
    def initialize(id: OMIT, business_name: OMIT, country:, language_code: OMIT, currency: OMIT, status: OMIT, main_location_id: OMIT, created_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @business_name = business_name if business_name != OMIT
      @country = country
      @language_code = language_code if language_code != OMIT
      @currency = currency if currency != OMIT
      @status = status if status != OMIT
      @main_location_id = main_location_id if main_location_id != OMIT
      @created_at = created_at if created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "business_name": business_name, "country": country, "language_code": language_code, "currency": currency, "status": status, "main_location_id": main_location_id, "created_at": created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Merchant
    #
    # @param json_object [String] 
    # @return [square.rb::Merchant]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      business_name = parsed_json["business_name"]
      country = parsed_json["country"]
      language_code = parsed_json["language_code"]
      currency = parsed_json["currency"]
      status = parsed_json["status"]
      main_location_id = parsed_json["main_location_id"]
      created_at = parsed_json["created_at"]
      new(
        id: id,
        business_name: business_name,
        country: country,
        language_code: language_code,
        currency: currency,
        status: status,
        main_location_id: main_location_id,
        created_at: created_at,
        additional_properties: struct
      )
    end
# Serialize an instance of Merchant to a JSON object
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
      obj.business_name&.is_a?(String) != false || raise("Passed value for field obj.business_name is not the expected type, validation failed.")
      obj.country.is_a?(square.rb::Country) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.language_code&.is_a?(String) != false || raise("Passed value for field obj.language_code is not the expected type, validation failed.")
      obj.currency&.is_a?(square.rb::Currency) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::MerchantStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.main_location_id&.is_a?(String) != false || raise("Passed value for field obj.main_location_id is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
    end
  end
end