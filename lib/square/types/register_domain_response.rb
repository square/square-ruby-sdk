# frozen_string_literal: true
require_relative "error"
require_relative "register_domain_response_status"
require "ostruct"
require "json"

module square.rb
# Defines the fields that are included in the response body of
#  a request to the [RegisterDomain](api-endpoint:ApplePay-RegisterDomain)
#  endpoint.
#  Either `errors` or `status` are present in a given response (never both).
  class RegisterDomainResponse
  # @return [Array<square.rb::Error>] Any errors that occurred during the request.
    attr_reader :errors
  # @return [square.rb::RegisterDomainResponseStatus] The status of the domain registration.
#  See [RegisterDomainResponseStatus](entity:RegisterDomainResponseStatus) for
#  possible values.
#  See [RegisterDomainResponseStatus](#type-registerdomainresponsestatus) for
#  possible values
    attr_reader :status
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Any errors that occurred during the request.
    # @param status [square.rb::RegisterDomainResponseStatus] The status of the domain registration.
#  See [RegisterDomainResponseStatus](entity:RegisterDomainResponseStatus) for
#  possible values.
#  See [RegisterDomainResponseStatus](#type-registerdomainresponsestatus) for
#  possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::RegisterDomainResponse]
    def initialize(errors: OMIT, status: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @status = status if status != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "status": status }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RegisterDomainResponse
    #
    # @param json_object [String] 
    # @return [square.rb::RegisterDomainResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      status = parsed_json["status"]
      new(
        errors: errors,
        status: status,
        additional_properties: struct
      )
    end
# Serialize an instance of RegisterDomainResponse to a JSON object
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
      obj.status&.is_a?(square.rb::RegisterDomainResponseStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end