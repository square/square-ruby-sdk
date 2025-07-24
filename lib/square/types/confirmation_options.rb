# frozen_string_literal: true
require_relative "confirmation_decision"
require "ostruct"
require "json"

module square.rb
  class ConfirmationOptions
  # @return [String] The title text to display in the confirmation screen flow on the Terminal.
    attr_reader :title
  # @return [String] The agreement details to display in the confirmation flow on the Terminal.
    attr_reader :body
  # @return [String] The button text to display indicating the customer agrees to the displayed
#  terms.
    attr_reader :agree_button_text
  # @return [String] The button text to display indicating the customer does not agree to the
#  displayed terms.
    attr_reader :disagree_button_text
  # @return [square.rb::ConfirmationDecision] The result of the buyer’s actions when presented with the confirmation screen.
    attr_reader :decision
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title text to display in the confirmation screen flow on the Terminal.
    # @param body [String] The agreement details to display in the confirmation flow on the Terminal.
    # @param agree_button_text [String] The button text to display indicating the customer agrees to the displayed
#  terms.
    # @param disagree_button_text [String] The button text to display indicating the customer does not agree to the
#  displayed terms.
    # @param decision [square.rb::ConfirmationDecision] The result of the buyer’s actions when presented with the confirmation screen.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ConfirmationOptions]
    def initialize(title:, body:, agree_button_text:, disagree_button_text: OMIT, decision: OMIT, additional_properties: nil)
      @title = title
      @body = body
      @agree_button_text = agree_button_text
      @disagree_button_text = disagree_button_text if disagree_button_text != OMIT
      @decision = decision if decision != OMIT
      @additional_properties = additional_properties
      @_field_set = { "title": title, "body": body, "agree_button_text": agree_button_text, "disagree_button_text": disagree_button_text, "decision": decision }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ConfirmationOptions
    #
    # @param json_object [String] 
    # @return [square.rb::ConfirmationOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      body = parsed_json["body"]
      agree_button_text = parsed_json["agree_button_text"]
      disagree_button_text = parsed_json["disagree_button_text"]
      unless parsed_json["decision"].nil?
        decision = parsed_json["decision"].to_json
        decision = square.rb::ConfirmationDecision.from_json(json_object: decision)
      else
        decision = nil
      end
      new(
        title: title,
        body: body,
        agree_button_text: agree_button_text,
        disagree_button_text: disagree_button_text,
        decision: decision,
        additional_properties: struct
      )
    end
# Serialize an instance of ConfirmationOptions to a JSON object
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
      obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.body.is_a?(String) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      obj.agree_button_text.is_a?(String) != false || raise("Passed value for field obj.agree_button_text is not the expected type, validation failed.")
      obj.disagree_button_text&.is_a?(String) != false || raise("Passed value for field obj.disagree_button_text is not the expected type, validation failed.")
      obj.decision.nil? || square.rb::ConfirmationDecision.validate_raw(obj: obj.decision)
    end
  end
end