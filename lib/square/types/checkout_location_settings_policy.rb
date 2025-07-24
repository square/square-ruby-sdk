# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
  class CheckoutLocationSettingsPolicy
  # @return [String] A unique ID to identify the policy when making changes. You must set the UID for
#  policy updates, but it’s optional when setting new policies.
    attr_reader :uid
  # @return [String] The title of the policy. This is required when setting the description, though
#  you can update it in a different request.
    attr_reader :title
  # @return [String] The description of the policy.
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param uid [String] A unique ID to identify the policy when making changes. You must set the UID for
#  policy updates, but it’s optional when setting new policies.
    # @param title [String] The title of the policy. This is required when setting the description, though
#  you can update it in a different request.
    # @param description [String] The description of the policy.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::CheckoutLocationSettingsPolicy]
    def initialize(uid: OMIT, title: OMIT, description: OMIT, additional_properties: nil)
      @uid = uid if uid != OMIT
      @title = title if title != OMIT
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "uid": uid, "title": title, "description": description }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CheckoutLocationSettingsPolicy
    #
    # @param json_object [String] 
    # @return [SquareApiClient::CheckoutLocationSettingsPolicy]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      uid = parsed_json["uid"]
      title = parsed_json["title"]
      description = parsed_json["description"]
      new(
        uid: uid,
        title: title,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of CheckoutLocationSettingsPolicy to a JSON object
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
      obj.uid&.is_a?(String) != false || raise("Passed value for field obj.uid is not the expected type, validation failed.")
      obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end