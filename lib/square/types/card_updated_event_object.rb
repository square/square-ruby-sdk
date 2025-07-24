# frozen_string_literal: true
require_relative "card"
require "ostruct"
require "json"

module square.rb
  class CardUpdatedEventObject
  # @return [square.rb::Card] The updated card.
    attr_reader :card
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param card [square.rb::Card] The updated card.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CardUpdatedEventObject]
    def initialize(card: OMIT, additional_properties: nil)
      @card = card if card != OMIT
      @additional_properties = additional_properties
      @_field_set = { "card": card }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CardUpdatedEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::CardUpdatedEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = square.rb::Card.from_json(json_object: card)
      else
        card = nil
      end
      new(card: card, additional_properties: struct)
    end
# Serialize an instance of CardUpdatedEventObject to a JSON object
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
      obj.card.nil? || square.rb::Card.validate_raw(obj: obj.card)
    end
  end
end