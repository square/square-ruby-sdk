# frozen_string_literal: true
require "ostruct"
require "json"

module SquareApiClient
# Represents the snippet that is added to a Square Online site. The snippet code
#  is injected into the `head` element of all pages on the site, except for
#  checkout pages.
  class Snippet
  # @return [String] The Square-assigned ID for the snippet.
    attr_reader :id
  # @return [String] The ID of the site that contains the snippet.
    attr_reader :site_id
  # @return [String] The snippet code, which can contain valid HTML, JavaScript, or both.
    attr_reader :content
  # @return [String] The timestamp of when the snippet was initially added to the site, in RFC 3339
#  format.
    attr_reader :created_at
  # @return [String] The timestamp of when the snippet was last updated on the site, in RFC 3339
#  format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID for the snippet.
    # @param site_id [String] The ID of the site that contains the snippet.
    # @param content [String] The snippet code, which can contain valid HTML, JavaScript, or both.
    # @param created_at [String] The timestamp of when the snippet was initially added to the site, in RFC 3339
#  format.
    # @param updated_at [String] The timestamp of when the snippet was last updated on the site, in RFC 3339
#  format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SquareApiClient::Snippet]
    def initialize(id: OMIT, site_id: OMIT, content:, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @site_id = site_id if site_id != OMIT
      @content = content
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "site_id": site_id, "content": content, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Snippet
    #
    # @param json_object [String] 
    # @return [SquareApiClient::Snippet]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      site_id = parsed_json["site_id"]
      content = parsed_json["content"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        site_id: site_id,
        content: content,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of Snippet to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.site_id&.is_a?(String) != false || raise("Passed value for field obj.site_id is not the expected type, validation failed.")
      obj.content.is_a?(String) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end