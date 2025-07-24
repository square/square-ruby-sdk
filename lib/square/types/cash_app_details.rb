# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Additional details about `WALLET` type payments with the `brand` of `CASH_APP`.
  class CashAppDetails
  # @return [String] The name of the Cash App account holder.
    attr_reader :buyer_full_name
  # @return [String] The country of the Cash App account holder, in ISO 3166-1-alpha-2 format.
#  For possible values, see [Country](entity:Country).
    attr_reader :buyer_country_code
  # @return [String] $Cashtag of the Cash App account holder.
    attr_reader :buyer_cashtag
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param buyer_full_name [String] The name of the Cash App account holder.
    # @param buyer_country_code [String] The country of the Cash App account holder, in ISO 3166-1-alpha-2 format.
#  For possible values, see [Country](entity:Country).
    # @param buyer_cashtag [String] $Cashtag of the Cash App account holder.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CashAppDetails]
    def initialize(buyer_full_name: OMIT, buyer_country_code: OMIT, buyer_cashtag: OMIT, additional_properties: nil)
      @buyer_full_name = buyer_full_name if buyer_full_name != OMIT
      @buyer_country_code = buyer_country_code if buyer_country_code != OMIT
      @buyer_cashtag = buyer_cashtag if buyer_cashtag != OMIT
      @additional_properties = additional_properties
      @_field_set = { "buyer_full_name": buyer_full_name, "buyer_country_code": buyer_country_code, "buyer_cashtag": buyer_cashtag }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CashAppDetails
    #
    # @param json_object [String] 
    # @return [square.rb::CashAppDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      buyer_full_name = parsed_json["buyer_full_name"]
      buyer_country_code = parsed_json["buyer_country_code"]
      buyer_cashtag = parsed_json["buyer_cashtag"]
      new(
        buyer_full_name: buyer_full_name,
        buyer_country_code: buyer_country_code,
        buyer_cashtag: buyer_cashtag,
        additional_properties: struct
      )
    end
# Serialize an instance of CashAppDetails to a JSON object
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
      obj.buyer_full_name&.is_a?(String) != false || raise("Passed value for field obj.buyer_full_name is not the expected type, validation failed.")
      obj.buyer_country_code&.is_a?(String) != false || raise("Passed value for field obj.buyer_country_code is not the expected type, validation failed.")
      obj.buyer_cashtag&.is_a?(String) != false || raise("Passed value for field obj.buyer_cashtag is not the expected type, validation failed.")
    end
  end
end