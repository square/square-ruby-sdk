# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents communication preferences for the customer profile.
  class CustomerPreferences
  # @return [Boolean] Indicates whether the customer has unsubscribed from marketing campaign emails.
#  A value of `true` means that the customer chose to opt out of email marketing
#  from the current Square seller or from all Square sellers. This value is
#  read-only from the Customers API.
    attr_reader :email_unsubscribed
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param email_unsubscribed [Boolean] Indicates whether the customer has unsubscribed from marketing campaign emails.
#  A value of `true` means that the customer chose to opt out of email marketing
#  from the current Square seller or from all Square sellers. This value is
#  read-only from the Customers API.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CustomerPreferences]
    def initialize(email_unsubscribed: OMIT, additional_properties: nil)
      @email_unsubscribed = email_unsubscribed if email_unsubscribed != OMIT
      @additional_properties = additional_properties
      @_field_set = { "email_unsubscribed": email_unsubscribed }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CustomerPreferences
    #
    # @param json_object [String] 
    # @return [square.rb::CustomerPreferences]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      email_unsubscribed = parsed_json["email_unsubscribed"]
      new(email_unsubscribed: email_unsubscribed, additional_properties: struct)
    end
# Serialize an instance of CustomerPreferences to a JSON object
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
      obj.email_unsubscribed&.is_a?(Boolean) != false || raise("Passed value for field obj.email_unsubscribed is not the expected type, validation failed.")
    end
  end
end