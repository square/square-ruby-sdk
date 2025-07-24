# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Details specific to offline payments.
  class OfflinePaymentDetails
  # @return [String] The client-side timestamp of when the offline payment was created, in RFC 3339
#  format.
    attr_reader :client_created_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param client_created_at [String] The client-side timestamp of when the offline payment was created, in RFC 3339
#  format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::OfflinePaymentDetails]
    def initialize(client_created_at: OMIT, additional_properties: nil)
      @client_created_at = client_created_at if client_created_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "client_created_at": client_created_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OfflinePaymentDetails
    #
    # @param json_object [String] 
    # @return [square.rb::OfflinePaymentDetails]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      client_created_at = parsed_json["client_created_at"]
      new(client_created_at: client_created_at, additional_properties: struct)
    end
# Serialize an instance of OfflinePaymentDetails to a JSON object
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
      obj.client_created_at&.is_a?(String) != false || raise("Passed value for field obj.client_created_at is not the expected type, validation failed.")
    end
  end
end