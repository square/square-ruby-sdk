# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
# Represents a Square Online site, which is an online store for a Square seller.
  class Site
  # @return [String] The Square-assigned ID of the site.
    attr_reader :id
  # @return [String] The title of the site.
    attr_reader :site_title
  # @return [String] The domain of the site (without the protocol). For example,
#  `mysite1.square.site`.
    attr_reader :domain
  # @return [Boolean] Indicates whether the site is published.
    attr_reader :is_published
  # @return [String] The timestamp of when the site was created, in RFC 3339 format.
    attr_reader :created_at
  # @return [String] The timestamp of when the site was last updated, in RFC 3339 format.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Square-assigned ID of the site.
    # @param site_title [String] The title of the site.
    # @param domain [String] The domain of the site (without the protocol). For example,
#  `mysite1.square.site`.
    # @param is_published [Boolean] Indicates whether the site is published.
    # @param created_at [String] The timestamp of when the site was created, in RFC 3339 format.
    # @param updated_at [String] The timestamp of when the site was last updated, in RFC 3339 format.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::Site]
    def initialize(id: OMIT, site_title: OMIT, domain: OMIT, is_published: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @site_title = site_title if site_title != OMIT
      @domain = domain if domain != OMIT
      @is_published = is_published if is_published != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "site_title": site_title, "domain": domain, "is_published": is_published, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of Site
    #
    # @param json_object [String] 
    # @return [square.rb::Site]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      site_title = parsed_json["site_title"]
      domain = parsed_json["domain"]
      is_published = parsed_json["is_published"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        site_title: site_title,
        domain: domain,
        is_published: is_published,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of Site to a JSON object
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
      obj.site_title&.is_a?(String) != false || raise("Passed value for field obj.site_title is not the expected type, validation failed.")
      obj.domain&.is_a?(String) != false || raise("Passed value for field obj.domain is not the expected type, validation failed.")
      obj.is_published&.is_a?(Boolean) != false || raise("Passed value for field obj.is_published is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end