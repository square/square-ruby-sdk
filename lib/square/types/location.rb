# frozen_string_literal: true
require_relative "address"
require_relative "location_capability"
require_relative "location_status"
require_relative "country"
require_relative "currency"
require_relative "location_type"
require_relative "business_hours"
require_relative "coordinates"
require_relative "tax_ids"
require "ostruct"
require "json"

module square.rb
# Represents one of a business'
#  [locations](https://developer.squareup.com/docs/locations-api).
  class Location
  # @return [String] A short generated string of letters and numbers that uniquely identifies this
#  location instance.
    attr_reader :id
  # @return [String] The name of the location.
#  This information appears in the Seller Dashboard as the nickname.
#  A location name must be unique within a seller account.
    attr_reader :name
  # @return [square.rb::Address] The physical address of the location.
    attr_reader :address
  # @return [String] The [IANA time zone](https://www.iana.org/time-zones) identifier for
#  the time zone of the location. For example, `America/Los_Angeles`.
    attr_reader :timezone
  # @return [Array<square.rb::LocationCapability>] The Square features that are enabled for the location.
#  See [LocationCapability](entity:LocationCapability) for possible values.
#  See [LocationCapability](#type-locationcapability) for possible values
    attr_reader :capabilities
  # @return [square.rb::LocationStatus] The status of the location.
#  See [LocationStatus](#type-locationstatus) for possible values
    attr_reader :status
  # @return [String] The time when the location was created, in RFC 3339 format.
#  For more information, see [Working with
#  Dates](https://developer.squareup.com/docs/build-basics/working-with-dates).
    attr_reader :created_at
  # @return [String] The ID of the merchant that owns the location.
    attr_reader :merchant_id
  # @return [square.rb::Country] The country of the location, in the two-letter format of ISO 3166. For example,
#  `US` or `JP`.
#  See [Country](entity:Country) for possible values.
#  See [Country](#type-country) for possible values
    attr_reader :country
  # @return [String] The language associated with the location, in
#  [BCP 47 format](https://tools.ietf.org/html/bcp47#appendix-A).
#  For more information, see [Language
#  per.squareup.com/docs/build-basics/general-considerations/language-preferences).
    attr_reader :language_code
  # @return [square.rb::Currency] The currency used for all transactions at this location,
#  in ISO 4217 format. For example, the currency code for US dollars is `USD`.
#  See [Currency](entity:Currency) for possible values.
#  See [Currency](#type-currency) for possible values
    attr_reader :currency
  # @return [String] The phone number of the location. For example, `+1 855-700-6000`.
    attr_reader :phone_number
  # @return [String] The name of the location's overall business. This name is present on receipts
#  and other customer-facing branding, and can be changed no more than three times
#  in a twelve-month period.
    attr_reader :business_name
  # @return [square.rb::LocationType] The type of the location.
#  See [LocationType](#type-locationtype) for possible values
    attr_reader :type
  # @return [String] The website URL of the location.  For example, `https://squareup.com`.
    attr_reader :website_url
  # @return [square.rb::BusinessHours] The hours of operation for the location.
    attr_reader :business_hours
  # @return [String] The email address of the location. This can be unique to the location and is not
#  always the email address for the business owner or administrator.
    attr_reader :business_email
  # @return [String] The description of the location. For example, `Main Street location`.
    attr_reader :description
  # @return [String] The Twitter username of the location without the '@' symbol. For example,
#  `Square`.
    attr_reader :twitter_username
  # @return [String] The Instagram username of the location without the '@' symbol. For example,
#  `square`.
    attr_reader :instagram_username
  # @return [String] The Facebook profile URL of the location. The URL should begin with
#  'facebook.com/'. For example, `https://www.facebook.com/square`.
    attr_reader :facebook_url
  # @return [square.rb::Coordinates] The physical coordinates (latitude and longitude) of the location.
    attr_reader :coordinates
  # @return [String] The URL of the logo image for the location. When configured in the Seller
#  Dashboard (Receipts section), the logo appears on transactions (such as receipts
#  and invoices) that Square generates on behalf of the seller.
#  This image should have a roughly square (1:1) aspect ratio and should be at
#  least 200x200 pixels.
    attr_reader :logo_url
  # @return [String] The URL of the Point of Sale background image for the location.
    attr_reader :pos_background_url
  # @return [String] A four-digit number that describes the kind of goods or services sold at the
#  location.
#  The [merchant category code
#  //developer.squareup.com/docs/locations-api#initialize-a-merchant-category-code)
#  of the location as standardized by ISO 18245.
#  For example, `5045`, for a location that sells computer goods and software.
    attr_reader :mcc
  # @return [String] The URL of a full-format logo image for the location. When configured in the
#  Seller
#  Dashboard (Receipts section), the logo appears on transactions (such as receipts
#  and invoices) that Square generates on behalf of the seller.
#  This image can be wider than it is tall and should be at least 1280x648 pixels.
    attr_reader :full_format_logo_url
  # @return [square.rb::TaxIds] The tax IDs for this location.
    attr_reader :tax_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] A short generated string of letters and numbers that uniquely identifies this
#  location instance.
    # @param name [String] The name of the location.
#  This information appears in the Seller Dashboard as the nickname.
#  A location name must be unique within a seller account.
    # @param address [square.rb::Address] The physical address of the location.
    # @param timezone [String] The [IANA time zone](https://www.iana.org/time-zones) identifier for
#  the time zone of the location. For example, `America/Los_Angeles`.
    # @param capabilities [Array<square.rb::LocationCapability>] The Square features that are enabled for the location.
#  See [LocationCapability](entity:LocationCapability) for possible values.
#  See [LocationCapability](#type-locationcapability) for possible values
    # @param status [square.rb::LocationStatus] The status of the location.
#  See [LocationStatus](#type-locationstatus) for possible values
    # @param created_at [String] The time when the location was created, in RFC 3339 format.
#  For more information, see [Working with
#  Dates](https://developer.squareup.com/docs/build-basics/working-with-dates).
    # @param merchant_id [String] The ID of the merchant that owns the location.
    # @param country [square.rb::Country] The country of the location, in the two-letter format of ISO 3166. For example,
#  `US` or `JP`.
#  See [Country](entity:Country) for possible values.
#  See [Country](#type-country) for possible values
    # @param language_code [String] The language associated with the location, in
#  [BCP 47 format](https://tools.ietf.org/html/bcp47#appendix-A).
#  For more information, see [Language
#  per.squareup.com/docs/build-basics/general-considerations/language-preferences).
    # @param currency [square.rb::Currency] The currency used for all transactions at this location,
#  in ISO 4217 format. For example, the currency code for US dollars is `USD`.
#  See [Currency](entity:Currency) for possible values.
#  See [Currency](#type-currency) for possible values
    # @param phone_number [String] The phone number of the location. For example, `+1 855-700-6000`.
    # @param business_name [String] The name of the location's overall business. This name is present on receipts
#  and other customer-facing branding, and can be changed no more than three times
#  in a twelve-month period.
    # @param type [square.rb::LocationType] The type of the location.
#  See [LocationType](#type-locationtype) for possible values
    # @param website_url [String] The website URL of the location.  For example, `https://squareup.com`.
    # @param business_hours [square.rb::BusinessHours] The hours of operation for the location.
    # @param business_email [String] The email address of the location. This can be unique to the location and is not
#  always the email address for the business owner or administrator.
    # @param description [String] The description of the location. For example, `Main Street location`.
    # @param twitter_username [String] The Twitter username of the location without the '@' symbol. For example,
#  `Square`.
    # @param instagram_username [String] The Instagram username of the location without the '@' symbol. For example,
#  `square`.
    # @param facebook_url [String] The Facebook profile URL of the location. The URL should begin with
#  'facebook.com/'. For example, `https://www.facebook.com/square`.
    # @param coordinates [square.rb::Coordinates] The physical coordinates (latitude and longitude) of the location.
    # @param logo_url [String] The URL of the logo image for the location. When configured in the Seller
#  Dashboard (Receipts section), the logo appears on transactions (such as receipts
#  and invoices) that Square generates on behalf of the seller.
#  This image should have a roughly square (1:1) aspect ratio and should be at
#  least 200x200 pixels.
    # @param pos_background_url [String] The URL of the Point of Sale background image for the location.
    # @param mcc [String] A four-digit number that describes the kind of goods or services sold at the
#  location.
#  The [merchant category code
#  //developer.squareup.com/docs/locations-api#initialize-a-merchant-category-code)
#  of the location as standardized by ISO 18245.
#  For example, `5045`, for a location that sells computer goods and software.
    # @param full_format_logo_url [String] The URL of a full-format logo image for the location. When configured in the
#  Seller
#  Dashboard (Receipts section), the logo appears on transactions (such as receipts
#  and invoices) that Square generates on behalf of the seller.
#  This image can be wider than it is tall and should be at least 1280x648 pixels.
    # @param tax_ids [square.rb::TaxIds] The tax IDs for this location.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Location]
    def initialize(id: OMIT, name: OMIT, address: OMIT, timezone: OMIT, capabilities: OMIT, status: OMIT, created_at: OMIT, merchant_id: OMIT, country: OMIT, language_code: OMIT, currency: OMIT, phone_number: OMIT, business_name: OMIT, type: OMIT, website_url: OMIT, business_hours: OMIT, business_email: OMIT, description: OMIT, twitter_username: OMIT, instagram_username: OMIT, facebook_url: OMIT, coordinates: OMIT, logo_url: OMIT, pos_background_url: OMIT, mcc: OMIT, full_format_logo_url: OMIT, tax_ids: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @name = name if name != OMIT
      @address = address if address != OMIT
      @timezone = timezone if timezone != OMIT
      @capabilities = capabilities if capabilities != OMIT
      @status = status if status != OMIT
      @created_at = created_at if created_at != OMIT
      @merchant_id = merchant_id if merchant_id != OMIT
      @country = country if country != OMIT
      @language_code = language_code if language_code != OMIT
      @currency = currency if currency != OMIT
      @phone_number = phone_number if phone_number != OMIT
      @business_name = business_name if business_name != OMIT
      @type = type if type != OMIT
      @website_url = website_url if website_url != OMIT
      @business_hours = business_hours if business_hours != OMIT
      @business_email = business_email if business_email != OMIT
      @description = description if description != OMIT
      @twitter_username = twitter_username if twitter_username != OMIT
      @instagram_username = instagram_username if instagram_username != OMIT
      @facebook_url = facebook_url if facebook_url != OMIT
      @coordinates = coordinates if coordinates != OMIT
      @logo_url = logo_url if logo_url != OMIT
      @pos_background_url = pos_background_url if pos_background_url != OMIT
      @mcc = mcc if mcc != OMIT
      @full_format_logo_url = full_format_logo_url if full_format_logo_url != OMIT
      @tax_ids = tax_ids if tax_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "address": address, "timezone": timezone, "capabilities": capabilities, "status": status, "created_at": created_at, "merchant_id": merchant_id, "country": country, "language_code": language_code, "currency": currency, "phone_number": phone_number, "business_name": business_name, "type": type, "website_url": website_url, "business_hours": business_hours, "business_email": business_email, "description": description, "twitter_username": twitter_username, "instagram_username": instagram_username, "facebook_url": facebook_url, "coordinates": coordinates, "logo_url": logo_url, "pos_background_url": pos_background_url, "mcc": mcc, "full_format_logo_url": full_format_logo_url, "tax_ids": tax_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Location
    #
    # @param json_object [String] 
    # @return [square.rb::Location]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = square.rb::Address.from_json(json_object: address)
      else
        address = nil
      end
      timezone = parsed_json["timezone"]
      capabilities = parsed_json["capabilities"]
      status = parsed_json["status"]
      created_at = parsed_json["created_at"]
      merchant_id = parsed_json["merchant_id"]
      country = parsed_json["country"]
      language_code = parsed_json["language_code"]
      currency = parsed_json["currency"]
      phone_number = parsed_json["phone_number"]
      business_name = parsed_json["business_name"]
      type = parsed_json["type"]
      website_url = parsed_json["website_url"]
      unless parsed_json["business_hours"].nil?
        business_hours = parsed_json["business_hours"].to_json
        business_hours = square.rb::BusinessHours.from_json(json_object: business_hours)
      else
        business_hours = nil
      end
      business_email = parsed_json["business_email"]
      description = parsed_json["description"]
      twitter_username = parsed_json["twitter_username"]
      instagram_username = parsed_json["instagram_username"]
      facebook_url = parsed_json["facebook_url"]
      unless parsed_json["coordinates"].nil?
        coordinates = parsed_json["coordinates"].to_json
        coordinates = square.rb::Coordinates.from_json(json_object: coordinates)
      else
        coordinates = nil
      end
      logo_url = parsed_json["logo_url"]
      pos_background_url = parsed_json["pos_background_url"]
      mcc = parsed_json["mcc"]
      full_format_logo_url = parsed_json["full_format_logo_url"]
      unless parsed_json["tax_ids"].nil?
        tax_ids = parsed_json["tax_ids"].to_json
        tax_ids = square.rb::TaxIds.from_json(json_object: tax_ids)
      else
        tax_ids = nil
      end
      new(
        id: id,
        name: name,
        address: address,
        timezone: timezone,
        capabilities: capabilities,
        status: status,
        created_at: created_at,
        merchant_id: merchant_id,
        country: country,
        language_code: language_code,
        currency: currency,
        phone_number: phone_number,
        business_name: business_name,
        type: type,
        website_url: website_url,
        business_hours: business_hours,
        business_email: business_email,
        description: description,
        twitter_username: twitter_username,
        instagram_username: instagram_username,
        facebook_url: facebook_url,
        coordinates: coordinates,
        logo_url: logo_url,
        pos_background_url: pos_background_url,
        mcc: mcc,
        full_format_logo_url: full_format_logo_url,
        tax_ids: tax_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of Location to a JSON object
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
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.address.nil? || square.rb::Address.validate_raw(obj: obj.address)
      obj.timezone&.is_a?(String) != false || raise("Passed value for field obj.timezone is not the expected type, validation failed.")
      obj.capabilities&.is_a?(Array) != false || raise("Passed value for field obj.capabilities is not the expected type, validation failed.")
      obj.status&.is_a?(square.rb::LocationStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.merchant_id&.is_a?(String) != false || raise("Passed value for field obj.merchant_id is not the expected type, validation failed.")
      obj.country&.is_a?(square.rb::Country) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.language_code&.is_a?(String) != false || raise("Passed value for field obj.language_code is not the expected type, validation failed.")
      obj.currency&.is_a?(square.rb::Currency) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
      obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
      obj.business_name&.is_a?(String) != false || raise("Passed value for field obj.business_name is not the expected type, validation failed.")
      obj.type&.is_a?(square.rb::LocationType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.website_url&.is_a?(String) != false || raise("Passed value for field obj.website_url is not the expected type, validation failed.")
      obj.business_hours.nil? || square.rb::BusinessHours.validate_raw(obj: obj.business_hours)
      obj.business_email&.is_a?(String) != false || raise("Passed value for field obj.business_email is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.twitter_username&.is_a?(String) != false || raise("Passed value for field obj.twitter_username is not the expected type, validation failed.")
      obj.instagram_username&.is_a?(String) != false || raise("Passed value for field obj.instagram_username is not the expected type, validation failed.")
      obj.facebook_url&.is_a?(String) != false || raise("Passed value for field obj.facebook_url is not the expected type, validation failed.")
      obj.coordinates.nil? || square.rb::Coordinates.validate_raw(obj: obj.coordinates)
      obj.logo_url&.is_a?(String) != false || raise("Passed value for field obj.logo_url is not the expected type, validation failed.")
      obj.pos_background_url&.is_a?(String) != false || raise("Passed value for field obj.pos_background_url is not the expected type, validation failed.")
      obj.mcc&.is_a?(String) != false || raise("Passed value for field obj.mcc is not the expected type, validation failed.")
      obj.full_format_logo_url&.is_a?(String) != false || raise("Passed value for field obj.full_format_logo_url is not the expected type, validation failed.")
      obj.tax_ids.nil? || square.rb::TaxIds.validate_raw(obj: obj.tax_ids)
    end
  end
end