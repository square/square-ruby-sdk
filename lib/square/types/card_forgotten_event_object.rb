# frozen_string_literal: true
require_relative "card_forgotten_event_card"
require "ostruct"
require "json"

module square.rb
  class CardForgottenEventObject
  # @return [square.rb::CardForgottenEventCard] The forgotten card.
    attr_reader :card
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param card [square.rb::CardForgottenEventCard] The forgotten card.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CardForgottenEventObject]
    def initialize(card: OMIT, additional_properties: nil)
      @card = card if card != OMIT
      @additional_properties = additional_properties
      @_field_set = { "card": card }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CardForgottenEventObject
    #
    # @param json_object [String] 
    # @return [square.rb::CardForgottenEventObject]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["card"].nil?
        card = parsed_json["card"].to_json
        card = square.rb::CardForgottenEventCard.from_json(json_object: card)
      else
        card = nil
      end
      new(card: card, additional_properties: struct)
    end
# Serialize an instance of CardForgottenEventObject to a JSON object
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
      obj.card.nil? || square.rb::CardForgottenEventCard.validate_raw(obj: obj.card)
    end
  end
end