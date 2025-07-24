# frozen_string_literal: true
require_relative "select_option"
require "ostruct"
require "json"

module SquareApiClient
  class SelectOptions
  # @return [String] The title text to display in the select flow on the Terminal.
    attr_reader :title
  # @return [String] The body text to display in the select flow on the Terminal.
    attr_reader :body
  # @return [Array<SquareApiClient::SelectOption>] Represents the buttons/options that should be displayed in the select flow on
#  the Terminal.
    attr_reader :options
  # @return [SquareApiClient::SelectOption] The buyer’s selected option.
    attr_reader :selected_option
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title text to display in the select flow on the Terminal.
    # @param body [String] The body text to display in the select flow on the Terminal.
    # @param options [Array<SquareApiClient::SelectOption>] Represents the buttons/options that should be displayed in the select flow on
#  the Terminal.
    # @param selected_option [SquareApiClient::SelectOption] The buyer’s selected option.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::SelectOptions]
    def initialize(title:, body:, options:, selected_option: OMIT, additional_properties: nil)
      @title = title
      @body = body
      @options = options
      @selected_option = selected_option if selected_option != OMIT
      @additional_properties = additional_properties
      @_field_set = { "title": title, "body": body, "options": options, "selected_option": selected_option }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SelectOptions
    #
    # @param json_object [String] 
    # @return [SquareApiClient::SelectOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      body = parsed_json["body"]
      options = parsed_json["options"]&.map do | item |
  item = item.to_json
  SquareApiClient::SelectOption.from_json(json_object: item)
end
      unless parsed_json["selected_option"].nil?
        selected_option = parsed_json["selected_option"].to_json
        selected_option = SquareApiClient::SelectOption.from_json(json_object: selected_option)
      else
        selected_option = nil
      end
      new(
        title: title,
        body: body,
        options: options,
        selected_option: selected_option,
        additional_properties: struct
      )
    end
# Serialize an instance of SelectOptions to a JSON object
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
      obj.options.is_a?(Array) != false || raise("Passed value for field obj.options is not the expected type, validation failed.")
      obj.selected_option.nil? || SquareApiClient::SelectOption.validate_raw(obj: obj.selected_option)
    end
  end
end