# frozen_string_literal: true
require_relative "error_category"
require_relative "error_code"
require "ostruct"
require "json"

module SquareApiClient
# Represents an error encountered during a request to the Connect API.
#  See [Handling
#  errors](https://developer.squareup.com/docs/build-basics/handling-errors) for
#  more information.
  class Error
  # @return [SquareApiClient::ErrorCategory] The high-level category for the error.
#  See [ErrorCategory](#type-errorcategory) for possible values
    attr_reader :category
  # @return [SquareApiClient::ErrorCode] The specific code of the error.
#  See [ErrorCode](#type-errorcode) for possible values
    attr_reader :code
  # @return [String] A human-readable description of the error for debugging purposes.
    attr_reader :detail
  # @return [String] The name of the field provided in the original request (if any) that
#  the error pertains to.
    attr_reader :field
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param category [SquareApiClient::ErrorCategory] The high-level category for the error.
#  See [ErrorCategory](#type-errorcategory) for possible values
    # @param code [SquareApiClient::ErrorCode] The specific code of the error.
#  See [ErrorCode](#type-errorcode) for possible values
    # @param detail [String] A human-readable description of the error for debugging purposes.
    # @param field [String] The name of the field provided in the original request (if any) that
#  the error pertains to.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Error]
    def initialize(category:, code:, detail: OMIT, field: OMIT, additional_properties: nil)
      @category = category
      @code = code
      @detail = detail if detail != OMIT
      @field = field if field != OMIT
      @additional_properties = additional_properties
      @_field_set = { "category": category, "code": code, "detail": detail, "field": field }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Error
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Error]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      category = parsed_json["category"]
      code = parsed_json["code"]
      detail = parsed_json["detail"]
      field = parsed_json["field"]
      new(
        category: category,
        code: code,
        detail: detail,
        field: field,
        additional_properties: struct
      )
    end
# Serialize an instance of Error to a JSON object
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
      obj.category.is_a?(SquareApiClient::ErrorCategory) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
      obj.code.is_a?(SquareApiClient::ErrorCode) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.detail&.is_a?(String) != false || raise("Passed value for field obj.detail is not the expected type, validation failed.")
      obj.field&.is_a?(String) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
    end
  end
end