# frozen_string_literal: true
require_relative "error"
require_relative "loyalty_account"
require "ostruct"
require "json"

module square.rb
# A response that includes loyalty account created.
  class CreateLoyaltyAccountResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::LoyaltyAccount] The newly created loyalty account.
    attr_reader :loyalty_account
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param loyalty_account [square.rb::LoyaltyAccount] The newly created loyalty account.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateLoyaltyAccountResponse]
    def initialize(errors: OMIT, loyalty_account: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @loyalty_account = loyalty_account if loyalty_account != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "loyalty_account": loyalty_account }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateLoyaltyAccountResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateLoyaltyAccountResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["loyalty_account"].nil?
        loyalty_account = parsed_json["loyalty_account"].to_json
        loyalty_account = square.rb::LoyaltyAccount.from_json(json_object: loyalty_account)
      else
        loyalty_account = nil
      end
      new(
        errors: errors,
        loyalty_account: loyalty_account,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateLoyaltyAccountResponse to a JSON object
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
      obj.errors&.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
      obj.loyalty_account.nil? || square.rb::LoyaltyAccount.validate_raw(obj: obj.loyalty_account)
    end
  end
end