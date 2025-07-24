# frozen_string_literal: true
require_relative "error"
require_relative "subscription"
require "ostruct"
require "json"

module square.rb
# Defines output parameters in a response from the
#  [SearchSubscriptions](api-endpoint:Subscriptions-SearchSubscriptions) endpoint.
  class SearchSubscriptionsResponse
  # @return [Array<square.rb::Error>] Errors encountered during the request.
    attr_reader :errors
  # @return [Array<square.rb::Subscription>] The subscriptions matching the specified query expressions.
    attr_reader :subscriptions
  # @return [String] When the total number of resulting subscription exceeds the limit of a paged
#  response,
#  the response includes a cursor for you to use in a subsequent request to fetch
#  the next set of results.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    attr_reader :cursor
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param errors [Array<square.rb::Error>] Errors encountered during the request.
    # @param subscriptions [Array<square.rb::Subscription>] The subscriptions matching the specified query expressions.
    # @param cursor [String] When the total number of resulting subscription exceeds the limit of a paged
#  response,
#  the response includes a cursor for you to use in a subsequent request to fetch
#  the next set of results.
#  If the cursor is unset, the response contains the last page of the results.
#  For more information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::SearchSubscriptionsResponse]
    def initialize(errors: OMIT, subscriptions: OMIT, cursor: OMIT, additional_properties: nil)
      @errors = errors if errors != OMIT
      @subscriptions = subscriptions if subscriptions != OMIT
      @cursor = cursor if cursor != OMIT
      @additional_properties = additional_properties
      @_field_set = { "errors": errors, "subscriptions": subscriptions, "cursor": cursor }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchSubscriptionsResponse
    #
    # @param json_object [String] 
    # @return [square.rb::SearchSubscriptionsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      errors = parsed_json["errors"]&.map do | item |
  item = item.to_json
  square.rb::Error.from_json(json_object: item)
end
      subscriptions = parsed_json["subscriptions"]&.map do | item |
  item = item.to_json
  square.rb::Subscription.from_json(json_object: item)
end
      cursor = parsed_json["cursor"]
      new(
        errors: errors,
        subscriptions: subscriptions,
        cursor: cursor,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchSubscriptionsResponse to a JSON object
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
      obj.subscriptions&.is_a?(Array) != false || raise("Passed value for field obj.subscriptions is not the expected type, validation failed.")
      obj.cursor&.is_a?(String) != false || raise("Passed value for field obj.cursor is not the expected type, validation failed.")
    end
  end
end