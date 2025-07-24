# frozen_string_literal: true
require_relative "error"
require_relative "snippet"
require "ostruct"
require "json"

module square.rb
# Represents a `RetrieveSnippet` response. The response can include either
#  `snippet` or `errors`.
  class GetSnippetResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::Snippet] The retrieved snippet.
    attr_reader :snippet
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param snippet [square.rb::Snippet] The retrieved snippet.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::GetSnippetResponse]
    def initialize(errors: OMIT, snippet: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @snippet = snippet if snippet != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "snippet": snippet }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GetSnippetResponse
    #
    # @param json_object [String] 
    # @return [square.rb::GetSnippetResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      unless parsed_json["snippet"].nil?
        snippet = parsed_json["snippet"].to_json
        snippet = square.rb::Snippet.from_json(json_object: snippet)
      else
        snippet = nil
      end
      new(
        errors: errors,
        snippet: snippet,
        additional_properties: struct
      )
    end
# Serialize an instance of GetSnippetResponse to a JSON object
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
      obj.snippet.nil? || square.rb::Snippet.validate_raw(obj: obj.snippet)
    end
  end
end