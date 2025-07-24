# frozen_string_literal: true
require_relative "scheduled_shift_sort_field"
require_relative "sort_order"
require "ostruct"
require "json"

module square.rb
# Defines sort criteria for a
#  [SearchScheduledShifts](api-endpoint:Labor-SearchScheduledShifts)
#  request.
  class ScheduledShiftSort
  # @return [square.rb::ScheduledShiftSortField] The field to sort on. The default value is `START_AT`.
#  See [ScheduledShiftSortField](#type-scheduledshiftsortfield) for possible values
    attr_reader :field
  # @return [square.rb::SortOrder] The order in which results are returned. The default value is `ASC`.
#  See [SortOrder](#type-sortorder) for possible values
    attr_reader :order
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param field [square.rb::ScheduledShiftSortField] The field to sort on. The default value is `START_AT`.
#  See [ScheduledShiftSortField](#type-scheduledshiftsortfield) for possible values
    # @param order [square.rb::SortOrder] The order in which results are returned. The default value is `ASC`.
#  See [SortOrder](#type-sortorder) for possible values
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::ScheduledShiftSort]
    def initialize(field: OMIT, order: OMIT, additional_properties: nil)
      @field = field if field != OMIT
      @order = order if order != OMIT
      @additional_properties = additional_properties
      @_field_set = { "field": field, "order": order }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScheduledShiftSort
    #
    # @param json_object [String] 
    # @return [square.rb::ScheduledShiftSort]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      field = parsed_json["field"]
      order = parsed_json["order"]
      new(
        field: field,
        order: order,
        additional_properties: struct
      )
    end
# Serialize an instance of ScheduledShiftSort to a JSON object
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
      obj.field&.is_a?(square.rb::ScheduledShiftSortField) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
      obj.order&.is_a?(square.rb::SortOrder) != false || raise("Passed value for field obj.order is not the expected type, validation failed.")
    end
  end
end