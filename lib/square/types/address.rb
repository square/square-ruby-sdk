# frozen_string_literal: true
require_relative "country"
require "ostruct"
require "json"

module square.rb
# Represents a postal address in a country.
#  For more information, see [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
  class Address
  # @return [String] The first line of the address.
#  Fields that start with `address_line` provide the address's most specific
#  details, like street number, street name, and building name. They do *not*
#  provide less specific details like city, state/province, or country (these
#  details are provided in other fields).
    attr_reader :address_line_1
  # @return [String] The second line of the address, if any.
    attr_reader :address_line_2
  # @return [String] The third line of the address, if any.
    attr_reader :address_line_3
  # @return [String] The city or town of the address. For a full list of field meanings by country,
#  see [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    attr_reader :locality
  # @return [String] A civil region within the address's `locality`, if any.
    attr_reader :sublocality
  # @return [String] A civil region within the address's `sublocality`, if any.
    attr_reader :sublocality_2
  # @return [String] A civil region within the address's `sublocality_2`, if any.
    attr_reader :sublocality_3
  # @return [String] A civil entity within the address's country. In the US, this
#  is the state. For a full list of field meanings by country, see [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    attr_reader :administrative_district_level_1
  # @return [String] A civil entity within the address's `administrative_district_level_1`.
#  In the US, this is the county.
    attr_reader :administrative_district_level_2
  # @return [String] A civil entity within the address's `administrative_district_level_2`,
#  if any.
    attr_reader :administrative_district_level_3
  # @return [String] The address's postal code. For a full list of field meanings by country, see
#  [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    attr_reader :postal_code
  # @return [square.rb::Country] The address's country, in the two-letter format of ISO 3166. For example, `US`
#  or `FR`.
#  See [Country](#type-country) for possible values
    attr_reader :country
  # @return [String] Optional first name when it's representing recipient.
    attr_reader :first_name
  # @return [String] Optional last name when it's representing recipient.
    attr_reader :last_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param address_line_1 [String] The first line of the address.
#  Fields that start with `address_line` provide the address's most specific
#  details, like street number, street name, and building name. They do *not*
#  provide less specific details like city, state/province, or country (these
#  details are provided in other fields).
    # @param address_line_2 [String] The second line of the address, if any.
    # @param address_line_3 [String] The third line of the address, if any.
    # @param locality [String] The city or town of the address. For a full list of field meanings by country,
#  see [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    # @param sublocality [String] A civil region within the address's `locality`, if any.
    # @param sublocality_2 [String] A civil region within the address's `sublocality`, if any.
    # @param sublocality_3 [String] A civil region within the address's `sublocality_2`, if any.
    # @param administrative_district_level_1 [String] A civil entity within the address's country. In the US, this
#  is the state. For a full list of field meanings by country, see [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    # @param administrative_district_level_2 [String] A civil entity within the address's `administrative_district_level_1`.
#  In the US, this is the county.
    # @param administrative_district_level_3 [String] A civil entity within the address's `administrative_district_level_2`,
#  if any.
    # @param postal_code [String] The address's postal code. For a full list of field meanings by country, see
#  [Working with
#  esses](https://developer.squareup.com/docs/build-basics/working-with-addresses).
    # @param country [square.rb::Country] The address's country, in the two-letter format of ISO 3166. For example, `US`
#  or `FR`.
#  See [Country](#type-country) for possible values
    # @param first_name [String] Optional first name when it's representing recipient.
    # @param last_name [String] Optional last name when it's representing recipient.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Address]
    def initialize(address_line_1: OMIT, address_line_2: OMIT, address_line_3: OMIT, locality: OMIT, sublocality: OMIT, sublocality_2: OMIT, sublocality_3: OMIT, administrative_district_level_1: OMIT, administrative_district_level_2: OMIT, administrative_district_level_3: OMIT, postal_code: OMIT, country: OMIT, first_name: OMIT, last_name: OMIT, additional_properties: nil)
      @address_line_1 = address_line_1 if address_line_1 != OMIT
      @address_line_2 = address_line_2 if address_line_2 != OMIT
      @address_line_3 = address_line_3 if address_line_3 != OMIT
      @locality = locality if locality != OMIT
      @sublocality = sublocality if sublocality != OMIT
      @sublocality_2 = sublocality_2 if sublocality_2 != OMIT
      @sublocality_3 = sublocality_3 if sublocality_3 != OMIT
      @administrative_district_level_1 = administrative_district_level_1 if administrative_district_level_1 != OMIT
      @administrative_district_level_2 = administrative_district_level_2 if administrative_district_level_2 != OMIT
      @administrative_district_level_3 = administrative_district_level_3 if administrative_district_level_3 != OMIT
      @postal_code = postal_code if postal_code != OMIT
      @country = country if country != OMIT
      @first_name = first_name if first_name != OMIT
      @last_name = last_name if last_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "address_line_1": address_line_1, "address_line_2": address_line_2, "address_line_3": address_line_3, "locality": locality, "sublocality": sublocality, "sublocality_2": sublocality_2, "sublocality_3": sublocality_3, "administrative_district_level_1": administrative_district_level_1, "administrative_district_level_2": administrative_district_level_2, "administrative_district_level_3": administrative_district_level_3, "postal_code": postal_code, "country": country, "first_name": first_name, "last_name": last_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Address
    #
    # @param json_object [String] 
    # @return [square.rb::Address]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      address_line_1 = parsed_json["address_line_1"]
      address_line_2 = parsed_json["address_line_2"]
      address_line_3 = parsed_json["address_line_3"]
      locality = parsed_json["locality"]
      sublocality = parsed_json["sublocality"]
      sublocality_2 = parsed_json["sublocality_2"]
      sublocality_3 = parsed_json["sublocality_3"]
      administrative_district_level_1 = parsed_json["administrative_district_level_1"]
      administrative_district_level_2 = parsed_json["administrative_district_level_2"]
      administrative_district_level_3 = parsed_json["administrative_district_level_3"]
      postal_code = parsed_json["postal_code"]
      country = parsed_json["country"]
      first_name = parsed_json["first_name"]
      last_name = parsed_json["last_name"]
      new(
        address_line_1: address_line_1,
        address_line_2: address_line_2,
        address_line_3: address_line_3,
        locality: locality,
        sublocality: sublocality,
        sublocality_2: sublocality_2,
        sublocality_3: sublocality_3,
        administrative_district_level_1: administrative_district_level_1,
        administrative_district_level_2: administrative_district_level_2,
        administrative_district_level_3: administrative_district_level_3,
        postal_code: postal_code,
        country: country,
        first_name: first_name,
        last_name: last_name,
        additional_properties: struct
      )
    end
# Serialize an instance of Address to a JSON object
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
      obj.address_line_1&.is_a?(String) != false || raise("Passed value for field obj.address_line_1 is not the expected type, validation failed.")
      obj.address_line_2&.is_a?(String) != false || raise("Passed value for field obj.address_line_2 is not the expected type, validation failed.")
      obj.address_line_3&.is_a?(String) != false || raise("Passed value for field obj.address_line_3 is not the expected type, validation failed.")
      obj.locality&.is_a?(String) != false || raise("Passed value for field obj.locality is not the expected type, validation failed.")
      obj.sublocality&.is_a?(String) != false || raise("Passed value for field obj.sublocality is not the expected type, validation failed.")
      obj.sublocality_2&.is_a?(String) != false || raise("Passed value for field obj.sublocality_2 is not the expected type, validation failed.")
      obj.sublocality_3&.is_a?(String) != false || raise("Passed value for field obj.sublocality_3 is not the expected type, validation failed.")
      obj.administrative_district_level_1&.is_a?(String) != false || raise("Passed value for field obj.administrative_district_level_1 is not the expected type, validation failed.")
      obj.administrative_district_level_2&.is_a?(String) != false || raise("Passed value for field obj.administrative_district_level_2 is not the expected type, validation failed.")
      obj.administrative_district_level_3&.is_a?(String) != false || raise("Passed value for field obj.administrative_district_level_3 is not the expected type, validation failed.")
      obj.postal_code&.is_a?(String) != false || raise("Passed value for field obj.postal_code is not the expected type, validation failed.")
      obj.country&.is_a?(square.rb::Country) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
      obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
      obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
    end
  end
end