# frozen_string_literal: true
require_relative "customer_text_filter"
require_relative "filter_value"
require_relative "time_range"
require_relative "float_number_range"
require_relative "customer_address_filter"
require "ostruct"
require "json"

module square.rb
# A type-specific filter used in a [custom attribute
#  filter](entity:CustomerCustomAttributeFilter) to search based on the value
#  of a customer-related [custom attribute](entity:CustomAttribute).
  class CustomerCustomAttributeFilterValue
  # @return [square.rb::CustomerTextFilter] A filter for a query based on the value of an `Email`-type custom attribute.
#  This filter is case-insensitive and can
#  include `exact` or `fuzzy`, but not both.
#  For an `exact` match, provide the complete email address.
#  For a `fuzzy` match, provide a query expression containing one or more query
#  tokens to match against the email address. Square removes
#  any punctuation (including periods (.), underscores (_), and the @ symbol) and
#  tokenizes the email addresses on spaces. A match is found
#  if a tokenized email address contains all the tokens in the search query,
#  irrespective of the token order. For example, `Steven gmail`
#  matches steven.jones@gmail.com and mygmail@stevensbakery.com.
    attr_reader :email
  # @return [square.rb::CustomerTextFilter] A filter for a query based on the value of a `PhoneNumber`-type custom
#  attribute. This filter is case-insensitive and
#  can include `exact` or `fuzzy`, but not both.
#  For an `exact` match, provide the complete phone number. This is always an
#  E.164-compliant phone number that starts
#  with the + sign followed by the country code and subscriber number. For example,
#  the format for a US phone number is +12061112222.
#  For a `fuzzy` match, provide a query expression containing one or more query
#  tokens to match against the phone number.
#  Square removes any punctuation and tokenizes the expression on spaces. A match
#  is found if a tokenized phone number contains
#  all the tokens in the search query, irrespective of the token order. For
#  example, `415 123 45` is tokenized to `415`, `123`, and `45`,
#  which matches +14151234567 and +12345674158, but does not match +1234156780.
#  Similarly, the expression `415` matches
#  +14151234567, +12345674158, and +1234156780.
    attr_reader :phone
  # @return [square.rb::CustomerTextFilter] A filter for a query based on the value of a `String`-type custom attribute.
#  This filter is case-insensitive and
#  can include `exact` or `fuzzy`, but not both.
#  For an `exact` match, provide the complete string.
#  For a `fuzzy` match, provide a query expression containing one or more query
#  tokens in any order that contain complete words
#  to match against the string. Square tokenizes the expression using a
#  grammar-based tokenizer. For example, the expressions `quick brown`,
#  `brown quick`, and `quick fox` match "The quick brown fox jumps over the lazy
#  dog". However, `quick foxes` and `qui` do not match.
    attr_reader :text
  # @return [square.rb::FilterValue] A filter for a query based on the display name for a `Selection`-type custom
#  attribute value. This filter is case-sensitive
#  and can contain `any`, `all`, or both. The `none` condition is not supported.
#  Provide the display name of each item that you want to search for. To find the
#  display names for the selection, use the
#  [Customer Custom Attributes API](api:CustomerCustomAttributes) to retrieve the
#  corresponding custom attribute definition
#  and then check the `schema.items.names` field. For more information, see
#  [Search based on
#  omers-api/use-the-api/search-customers#custom-attribute-value-filter-selection).
#  Note that when a `Selection`-type custom attribute is assigned to a customer
#  profile, the custom attribute value is a list of one
#  or more UUIDs (sourced from the `schema.items.enum` field) that map to the item
#  names. These UUIDs are unique per seller.
    attr_reader :selection
  # @return [square.rb::TimeRange] A filter for a query based on the value of a `Date`-type custom attribute.
#  Provide a date range for this filter using `start_at`, `end_at`, or both. Range
#  boundaries are inclusive. Dates can be specified
#  in `YYYY-MM-DD` format or as RFC 3339 timestamps.
    attr_reader :date
  # @return [square.rb::FloatNumberRange] A filter for a query based on the value of a `Number`-type custom attribute,
#  which can be an integer or a decimal with up to
#  5 digits of precision.
#  Provide a numerical range for this filter using `start_at`, `end_at`, or both.
#  Range boundaries are inclusive. Numbers are specified
#  as decimals or integers. The absolute value of range boundaries must not exceed
#  `(2^63-1)/10^5`, or 92233720368547.
    attr_reader :number
  # @return [Boolean] A filter for a query based on the value of a `Boolean`-type custom attribute.
    attr_reader :boolean
  # @return [square.rb::CustomerAddressFilter] A filter for a query based on the value of an `Address`-type custom attribute.
#  The filter can include `postal_code`, `country`, or both.
    attr_reader :address
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email [square.rb::CustomerTextFilter] A filter for a query based on the value of an `Email`-type custom attribute.
#  This filter is case-insensitive and can
#  include `exact` or `fuzzy`, but not both.
#  For an `exact` match, provide the complete email address.
#  For a `fuzzy` match, provide a query expression containing one or more query
#  tokens to match against the email address. Square removes
#  any punctuation (including periods (.), underscores (_), and the @ symbol) and
#  tokenizes the email addresses on spaces. A match is found
#  if a tokenized email address contains all the tokens in the search query,
#  irrespective of the token order. For example, `Steven gmail`
#  matches steven.jones@gmail.com and mygmail@stevensbakery.com.
    # @param phone [square.rb::CustomerTextFilter] A filter for a query based on the value of a `PhoneNumber`-type custom
#  attribute. This filter is case-insensitive and
#  can include `exact` or `fuzzy`, but not both.
#  For an `exact` match, provide the complete phone number. This is always an
#  E.164-compliant phone number that starts
#  with the + sign followed by the country code and subscriber number. For example,
#  the format for a US phone number is +12061112222.
#  For a `fuzzy` match, provide a query expression containing one or more query
#  tokens to match against the phone number.
#  Square removes any punctuation and tokenizes the expression on spaces. A match
#  is found if a tokenized phone number contains
#  all the tokens in the search query, irrespective of the token order. For
#  example, `415 123 45` is tokenized to `415`, `123`, and `45`,
#  which matches +14151234567 and +12345674158, but does not match +1234156780.
#  Similarly, the expression `415` matches
#  +14151234567, +12345674158, and +1234156780.
    # @param text [square.rb::CustomerTextFilter] A filter for a query based on the value of a `String`-type custom attribute.
#  This filter is case-insensitive and
#  can include `exact` or `fuzzy`, but not both.
#  For an `exact` match, provide the complete string.
#  For a `fuzzy` match, provide a query expression containing one or more query
#  tokens in any order that contain complete words
#  to match against the string. Square tokenizes the expression using a
#  grammar-based tokenizer. For example, the expressions `quick brown`,
#  `brown quick`, and `quick fox` match "The quick brown fox jumps over the lazy
#  dog". However, `quick foxes` and `qui` do not match.
    # @param selection [square.rb::FilterValue] A filter for a query based on the display name for a `Selection`-type custom
#  attribute value. This filter is case-sensitive
#  and can contain `any`, `all`, or both. The `none` condition is not supported.
#  Provide the display name of each item that you want to search for. To find the
#  display names for the selection, use the
#  [Customer Custom Attributes API](api:CustomerCustomAttributes) to retrieve the
#  corresponding custom attribute definition
#  and then check the `schema.items.names` field. For more information, see
#  [Search based on
#  omers-api/use-the-api/search-customers#custom-attribute-value-filter-selection).
#  Note that when a `Selection`-type custom attribute is assigned to a customer
#  profile, the custom attribute value is a list of one
#  or more UUIDs (sourced from the `schema.items.enum` field) that map to the item
#  names. These UUIDs are unique per seller.
    # @param date [square.rb::TimeRange] A filter for a query based on the value of a `Date`-type custom attribute.
#  Provide a date range for this filter using `start_at`, `end_at`, or both. Range
#  boundaries are inclusive. Dates can be specified
#  in `YYYY-MM-DD` format or as RFC 3339 timestamps.
    # @param number [square.rb::FloatNumberRange] A filter for a query based on the value of a `Number`-type custom attribute,
#  which can be an integer or a decimal with up to
#  5 digits of precision.
#  Provide a numerical range for this filter using `start_at`, `end_at`, or both.
#  Range boundaries are inclusive. Numbers are specified
#  as decimals or integers. The absolute value of range boundaries must not exceed
#  `(2^63-1)/10^5`, or 92233720368547.
    # @param boolean [Boolean] A filter for a query based on the value of a `Boolean`-type custom attribute.
    # @param address [square.rb::CustomerAddressFilter] A filter for a query based on the value of an `Address`-type custom attribute.
#  The filter can include `postal_code`, `country`, or both.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerCustomAttributeFilterValue]
    def initialize(email: OMIT, phone: OMIT, text: OMIT, selection: OMIT, date: OMIT, number: OMIT, boolean: OMIT, address: OMIT, additional_properties: nil)
      @email = email if email != OMIT
      @phone = phone if phone != OMIT
      @text = text if text != OMIT
      @selection = selection if selection != OMIT
      @date = date if date != OMIT
      @number = number if number != OMIT
      @boolean = boolean if boolean != OMIT
      @address = address if address != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email": email, "phone": phone, "text": text, "selection": selection, "date": date, "number": number, "boolean": boolean, "address": address }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerCustomAttributeFilterValue
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerCustomAttributeFilterValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["email"].nil?
        email = parsed_json["email"].to_json
        email = square.rb::CustomerTextFilter.from_json(json_object: email)
      else
        email = nil
      end
      unless parsed_json["phone"].nil?
        phone = parsed_json["phone"].to_json
        phone = square.rb::CustomerTextFilter.from_json(json_object: phone)
      else
        phone = nil
      end
      unless parsed_json["text"].nil?
        text = parsed_json["text"].to_json
        text = square.rb::CustomerTextFilter.from_json(json_object: text)
      else
        text = nil
      end
      unless parsed_json["selection"].nil?
        selection = parsed_json["selection"].to_json
        selection = square.rb::FilterValue.from_json(json_object: selection)
      else
        selection = nil
      end
      unless parsed_json["date"].nil?
        date = parsed_json["date"].to_json
        date = square.rb::TimeRange.from_json(json_object: date)
      else
        date = nil
      end
      unless parsed_json["number"].nil?
        number = parsed_json["number"].to_json
        number = square.rb::FloatNumberRange.from_json(json_object: number)
      else
        number = nil
      end
      boolean = parsed_json["boolean"]
      unless parsed_json["address"].nil?
        address = parsed_json["address"].to_json
        address = square.rb::CustomerAddressFilter.from_json(json_object: address)
      else
        address = nil
      end
      new(
        email: email,
        phone: phone,
        text: text,
        selection: selection,
        date: date,
        number: number,
        boolean: boolean,
        address: address,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerCustomAttributeFilterValue to a JSON object
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
      obj.email.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.email)
      obj.phone.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.phone)
      obj.text.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.text)
      obj.selection.nil? || square.rb::FilterValue.validate_raw(obj: obj.selection)
      obj.date.nil? || square.rb::TimeRange.validate_raw(obj: obj.date)
      obj.number.nil? || square.rb::FloatNumberRange.validate_raw(obj: obj.number)
      obj.boolean&.is_a?(Boolean) != false || raise("Passed value for field obj.boolean is not the expected type, validation failed.")
      obj.address.nil? || square.rb::CustomerAddressFilter.validate_raw(obj: obj.address)
    end
  end
end