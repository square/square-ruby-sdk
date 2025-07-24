# frozen_string_literal: true
require_relative "error"
require_relative "card"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the `CreateCustomerCard` endpoint.
#  Either `errors` or `card` is present in a given response (never both).
  class CreateCustomerCardResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::Card] The created card on file.
    attr_reader :card
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param card [square.rb::Card] The created card on file.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CreateCustomerCardResponse]
    def initialize(errors: OMIT, card: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @card = card if card != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "card": card }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateCustomerCardResponse
    #
    # @param json_object [String] 
    # @return [square.rb::CreateCustomerCardResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = square.rb::Card.from_json(json_object: card)
      else
        card = nil
      end
      new(
        errors: errors,
        card: card,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateCustomerCardResponse to a JSON object
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
      obj.card.nil? || square.rb::Card.validate_raw(obj: obj.card)
    end
  end
end