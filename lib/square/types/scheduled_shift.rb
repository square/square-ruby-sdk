# frozen_string_literal: true
require_relative "scheduled_shift_details"
require "ostruct"
require "json"

module square.rb
# Represents a specific time slot in a work schedule. This object is used to
#  manage the
#  lifecycle of a scheduled shift from the draft to published state. A scheduled
#  shift contains
#  the latest draft shift details and current published shift details.
  class ScheduledShift
  # @return [String] **Read only** The Square-issued ID of the scheduled shift.
    attr_reader :id
  # @return [square.rb::ScheduledShiftDetails] The latest draft shift details for the scheduled shift. Draft shift details are
#  used to
#  stage and manage shifts before publishing. This field is always present.
    attr_reader :draft_shift_details
  # @return [square.rb::ScheduledShiftDetails] The current published (public) shift details for the scheduled shift. This field
#  is
#  present only if the shift was published.
    attr_reader :published_shift_details
  # @return [Integer] **Read only** The current version of the scheduled shift, which is incremented
#  with each update.
#  This field is used for [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control to ensure that requests don't overwrite data from another request.
    attr_reader :version
  # @return [String] The timestamp of when the scheduled shift was created, in RFC 3339 format
#  presented as UTC.
    attr_reader :created_at
  # @return [String] The timestamp of when the scheduled shift was last updated, in RFC 3339 format
#  presented as UTC.
    attr_reader :updated_at
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] **Read only** The Square-issued ID of the scheduled shift.
    # @param draft_shift_details [square.rb::ScheduledShiftDetails] The latest draft shift details for the scheduled shift. Draft shift details are
#  used to
#  stage and manage shifts before publishing. This field is always present.
    # @param published_shift_details [square.rb::ScheduledShiftDetails] The current published (public) shift details for the scheduled shift. This field
#  is
#  present only if the shift was published.
    # @param version [Integer] **Read only** The current version of the scheduled shift, which is incremented
#  with each update.
#  This field is used for [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control to ensure that requests don't overwrite data from another request.
    # @param created_at [String] The timestamp of when the scheduled shift was created, in RFC 3339 format
#  presented as UTC.
    # @param updated_at [String] The timestamp of when the scheduled shift was last updated, in RFC 3339 format
#  presented as UTC.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ScheduledShift]
    def initialize(id: OMIT, draft_shift_details: OMIT, published_shift_details: OMIT, version: OMIT, created_at: OMIT, updated_at: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @draft_shift_details = draft_shift_details if draft_shift_details != OMIT
      @published_shift_details = published_shift_details if published_shift_details != OMIT
      @version = version if version != OMIT
      @created_at = created_at if created_at != OMIT
      @updated_at = updated_at if updated_at != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "draft_shift_details": draft_shift_details, "published_shift_details": published_shift_details, "version": version, "created_at": created_at, "updated_at": updated_at }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScheduledShift
    #
    # @param json_object [String] 
    # @return [square.rb::ScheduledShift]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      unless parsed_json["draft_shift_details"].nil?
        draft_shift_details = parsed_json["draft_shift_details"].to_json
        draft_shift_details = square.rb::ScheduledShiftDetails.from_json(json_object: draft_shift_details)
      else
        draft_shift_details = nil
      end
      unless parsed_json["published_shift_details"].nil?
        published_shift_details = parsed_json["published_shift_details"].to_json
        published_shift_details = square.rb::ScheduledShiftDetails.from_json(json_object: published_shift_details)
      else
        published_shift_details = nil
      end
      version = parsed_json["version"]
      created_at = parsed_json["created_at"]
      updated_at = parsed_json["updated_at"]
      new(
        id: id,
        draft_shift_details: draft_shift_details,
        published_shift_details: published_shift_details,
        version: version,
        created_at: created_at,
        updated_at: updated_at,
        additional_properties: struct
      )
    end
# Serialize an instance of ScheduledShift to a JSON object
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
      obj.draft_shift_details.nil? || square.rb::ScheduledShiftDetails.validate_raw(obj: obj.draft_shift_details)
      obj.published_shift_details.nil? || square.rb::ScheduledShiftDetails.validate_raw(obj: obj.published_shift_details)
      obj.version&.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.created_at&.is_a?(String) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      obj.updated_at&.is_a?(String) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
    end
  end
end