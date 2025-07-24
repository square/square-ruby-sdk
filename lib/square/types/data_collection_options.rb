# frozen_string_literal: true
require_relative "data_collection_options_input_type"
require_relative "collected_data"
require "ostruct"
require "json"

module SquareApiClient
  class DataCollectionOptions
  # @return [String] The title text to display in the data collection flow on the Terminal.
    attr_reader :title
  # @return [String] The body text to display under the title in the data collection screen flow on
#  the
#  Terminal.
    attr_reader :body
  # @return [SquareApiClient::DataCollectionOptionsInputType] Represents the type of the input text.
#  See [InputType](#type-inputtype) for possible values
    attr_reader :input_type
  # @return [SquareApiClient::CollectedData] The buyer’s input text from the data collection screen.
    attr_reader :collected_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param title [String] The title text to display in the data collection flow on the Terminal.
    # @param body [String] The body text to display under the title in the data collection screen flow on
#  the
#  Terminal.
    # @param input_type [SquareApiClient::DataCollectionOptionsInputType] Represents the type of the input text.
#  See [InputType](#type-inputtype) for possible values
    # @param collected_data [SquareApiClient::CollectedData] The buyer’s input text from the data collection screen.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::DataCollectionOptions]
    def initialize(title:, body:, input_type:, collected_data: OMIT, additional_properties: nil)
      @title = title
      @body = body
      @input_type = input_type
      @collected_data = collected_data if collected_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "title": title, "body": body, "input_type": input_type, "collected_data": collected_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DataCollectionOptions
    #
    # @param json_object [String] 
    # @return [SquareApiClient::DataCollectionOptions]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      title = parsed_json["title"]
      body = parsed_json["body"]
      input_type = parsed_json["input_type"]
      unless parsed_json["collected_data"].nil?
        collected_data = parsed_json["collected_data"].to_json
        collected_data = SquareApiClient::CollectedData.from_json(json_object: collected_data)
      else
        collected_data = nil
      end
      new(
        title: title,
        body: body,
        input_type: input_type,
        collected_data: collected_data,
        additional_properties: struct
      )
    end
# Serialize an instance of DataCollectionOptions to a JSON object
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
      obj.input_type.is_a?(SquareApiClient::DataCollectionOptionsInputType) != false || raise("Passed value for field obj.input_type is not the expected type, validation failed.")
      obj.collected_data.nil? || SquareApiClient::CollectedData.validate_raw(obj: obj.collected_data)
    end
  end
end