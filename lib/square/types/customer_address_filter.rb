# frozen_string_literal: true
require_relative "customer_text_filter"
require_relative "country"
require "ostruct"
require "json"

module square.rb
# The customer address filter. This filter is used in a
#  [CustomerCustomAttributeFilterValue](entity:CustomerCustomAttributeFilterValue)
#  filter when
#  searching by an `Address`-type custom attribute.
  class CustomerAddressFilter
  # @return [square.rb::CustomerTextFilter] The postal code to search for. Only an `exact` match is supported.
    attr_reader :postal_code
  # @return [square.rb::Country] The country code to search for.
#  See [Country](#type-country) for possible values
    attr_reader :country
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param postal_code [square.rb::CustomerTextFilter] The postal code to search for. Only an `exact` match is supported.
    # @param country [square.rb::Country] The country code to search for.
#  See [Country](#type-country) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerAddressFilter]
    def initialize(postal_code: OMIT, country: OMIT, additional_properties: nil)
      @postal_code = postal_code if postal_code != OMIT
      @country = country if country != OMIT
      @additional_properties = additional_properties
      @_field_set = { "postal_code": postal_code, "country": country }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerAddressFilter
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerAddressFilter]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["postal_code"].nil?
        postal_code = parsed_json["postal_code"].to_json
        postal_code = square.rb::CustomerTextFilter.from_json(json_object: postal_code)
      else
        postal_code = nil
      end
      country = parsed_json["country"]
      new(
        postal_code: postal_code,
        country: country,
        additional_properties: struct
      )
    end
# Serialize an instance of CustomerAddressFilter to a JSON object
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
      obj.postal_code.nil? || square.rb::CustomerTextFilter.validate_raw(obj: obj.postal_code)
      obj.country&.is_a?(square.rb::Country) != false || raise("Passed value for field obj.country is not the expected type, validation failed.")
    end
  end
end