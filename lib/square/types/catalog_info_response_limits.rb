# frozen_string_literal: true
require "ostruct"
require "json"

module square.rb
  class CatalogInfoResponseLimits
  # @return [Integer] The maximum number of objects that may appear within a single batch in a
#  `/v2/catalog/batch-upsert` request.
    attr_reader :batch_upsert_max_objects_per_batch
  # @return [Integer] The maximum number of objects that may appear across all batches in a
#  `/v2/catalog/batch-upsert` request.
    attr_reader :batch_upsert_max_total_objects
  # @return [Integer] The maximum number of object IDs that may appear in a
#  `/v2/catalog/batch-retrieve`
#  request.
    attr_reader :batch_retrieve_max_object_ids
  # @return [Integer] The maximum number of results that may be returned in a page of a
#  `/v2/catalog/search` response.
    attr_reader :search_max_page_limit
  # @return [Integer] The maximum number of object IDs that may be included in a single
#  `/v2/catalog/batch-delete` request.
    attr_reader :batch_delete_max_object_ids
  # @return [Integer] The maximum number of item IDs that may be included in a single
#  `/v2/catalog/update-item-taxes` request.
    attr_reader :update_item_taxes_max_item_ids
  # @return [Integer] The maximum number of tax IDs to be enabled that may be included in a single
#  `/v2/catalog/update-item-taxes` request.
    attr_reader :update_item_taxes_max_taxes_to_enable
  # @return [Integer] The maximum number of tax IDs to be disabled that may be included in a single
#  `/v2/catalog/update-item-taxes` request.
    attr_reader :update_item_taxes_max_taxes_to_disable
  # @return [Integer] The maximum number of item IDs that may be included in a single
#  `/v2/catalog/update-item-modifier-lists` request.
    attr_reader :update_item_modifier_lists_max_item_ids
  # @return [Integer] The maximum number of modifier list IDs to be enabled that may be included in
#  a single `/v2/catalog/update-item-modifier-lists` request.
    attr_reader :update_item_modifier_lists_max_modifier_lists_to_enable
  # @return [Integer] The maximum number of modifier list IDs to be disabled that may be included in
#  a single `/v2/catalog/update-item-modifier-lists` request.
    attr_reader :update_item_modifier_lists_max_modifier_lists_to_disable
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param batch_upsert_max_objects_per_batch [Integer] The maximum number of objects that may appear within a single batch in a
#  `/v2/catalog/batch-upsert` request.
    # @param batch_upsert_max_total_objects [Integer] The maximum number of objects that may appear across all batches in a
#  `/v2/catalog/batch-upsert` request.
    # @param batch_retrieve_max_object_ids [Integer] The maximum number of object IDs that may appear in a
#  `/v2/catalog/batch-retrieve`
#  request.
    # @param search_max_page_limit [Integer] The maximum number of results that may be returned in a page of a
#  `/v2/catalog/search` response.
    # @param batch_delete_max_object_ids [Integer] The maximum number of object IDs that may be included in a single
#  `/v2/catalog/batch-delete` request.
    # @param update_item_taxes_max_item_ids [Integer] The maximum number of item IDs that may be included in a single
#  `/v2/catalog/update-item-taxes` request.
    # @param update_item_taxes_max_taxes_to_enable [Integer] The maximum number of tax IDs to be enabled that may be included in a single
#  `/v2/catalog/update-item-taxes` request.
    # @param update_item_taxes_max_taxes_to_disable [Integer] The maximum number of tax IDs to be disabled that may be included in a single
#  `/v2/catalog/update-item-taxes` request.
    # @param update_item_modifier_lists_max_item_ids [Integer] The maximum number of item IDs that may be included in a single
#  `/v2/catalog/update-item-modifier-lists` request.
    # @param update_item_modifier_lists_max_modifier_lists_to_enable [Integer] The maximum number of modifier list IDs to be enabled that may be included in
#  a single `/v2/catalog/update-item-modifier-lists` request.
    # @param update_item_modifier_lists_max_modifier_lists_to_disable [Integer] The maximum number of modifier list IDs to be disabled that may be included in
#  a single `/v2/catalog/update-item-modifier-lists` request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [square.rb::CatalogInfoResponseLimits]
    def initialize(batch_upsert_max_objects_per_batch: OMIT, batch_upsert_max_total_objects: OMIT, batch_retrieve_max_object_ids: OMIT, search_max_page_limit: OMIT, batch_delete_max_object_ids: OMIT, update_item_taxes_max_item_ids: OMIT, update_item_taxes_max_taxes_to_enable: OMIT, update_item_taxes_max_taxes_to_disable: OMIT, update_item_modifier_lists_max_item_ids: OMIT, update_item_modifier_lists_max_modifier_lists_to_enable: OMIT, update_item_modifier_lists_max_modifier_lists_to_disable: OMIT, additional_properties: nil)
      @batch_upsert_max_objects_per_batch = batch_upsert_max_objects_per_batch if batch_upsert_max_objects_per_batch != OMIT
      @batch_upsert_max_total_objects = batch_upsert_max_total_objects if batch_upsert_max_total_objects != OMIT
      @batch_retrieve_max_object_ids = batch_retrieve_max_object_ids if batch_retrieve_max_object_ids != OMIT
      @search_max_page_limit = search_max_page_limit if search_max_page_limit != OMIT
      @batch_delete_max_object_ids = batch_delete_max_object_ids if batch_delete_max_object_ids != OMIT
      @update_item_taxes_max_item_ids = update_item_taxes_max_item_ids if update_item_taxes_max_item_ids != OMIT
      @update_item_taxes_max_taxes_to_enable = update_item_taxes_max_taxes_to_enable if update_item_taxes_max_taxes_to_enable != OMIT
      @update_item_taxes_max_taxes_to_disable = update_item_taxes_max_taxes_to_disable if update_item_taxes_max_taxes_to_disable != OMIT
      @update_item_modifier_lists_max_item_ids = update_item_modifier_lists_max_item_ids if update_item_modifier_lists_max_item_ids != OMIT
      @update_item_modifier_lists_max_modifier_lists_to_enable = update_item_modifier_lists_max_modifier_lists_to_enable if update_item_modifier_lists_max_modifier_lists_to_enable != OMIT
      @update_item_modifier_lists_max_modifier_lists_to_disable = update_item_modifier_lists_max_modifier_lists_to_disable if update_item_modifier_lists_max_modifier_lists_to_disable != OMIT
      @additional_properties = additional_properties
      @_field_set = { "batch_upsert_max_objects_per_batch": batch_upsert_max_objects_per_batch, "batch_upsert_max_total_objects": batch_upsert_max_total_objects, "batch_retrieve_max_object_ids": batch_retrieve_max_object_ids, "search_max_page_limit": search_max_page_limit, "batch_delete_max_object_ids": batch_delete_max_object_ids, "update_item_taxes_max_item_ids": update_item_taxes_max_item_ids, "update_item_taxes_max_taxes_to_enable": update_item_taxes_max_taxes_to_enable, "update_item_taxes_max_taxes_to_disable": update_item_taxes_max_taxes_to_disable, "update_item_modifier_lists_max_item_ids": update_item_modifier_lists_max_item_ids, "update_item_modifier_lists_max_modifier_lists_to_enable": update_item_modifier_lists_max_modifier_lists_to_enable, "update_item_modifier_lists_max_modifier_lists_to_disable": update_item_modifier_lists_max_modifier_lists_to_disable }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CatalogInfoResponseLimits
    #
    # @param json_object [String] 
    # @return [square.rb::CatalogInfoResponseLimits]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      batch_upsert_max_objects_per_batch = parsed_json["batch_upsert_max_objects_per_batch"]
      batch_upsert_max_total_objects = parsed_json["batch_upsert_max_total_objects"]
      batch_retrieve_max_object_ids = parsed_json["batch_retrieve_max_object_ids"]
      search_max_page_limit = parsed_json["search_max_page_limit"]
      batch_delete_max_object_ids = parsed_json["batch_delete_max_object_ids"]
      update_item_taxes_max_item_ids = parsed_json["update_item_taxes_max_item_ids"]
      update_item_taxes_max_taxes_to_enable = parsed_json["update_item_taxes_max_taxes_to_enable"]
      update_item_taxes_max_taxes_to_disable = parsed_json["update_item_taxes_max_taxes_to_disable"]
      update_item_modifier_lists_max_item_ids = parsed_json["update_item_modifier_lists_max_item_ids"]
      update_item_modifier_lists_max_modifier_lists_to_enable = parsed_json["update_item_modifier_lists_max_modifier_lists_to_enable"]
      update_item_modifier_lists_max_modifier_lists_to_disable = parsed_json["update_item_modifier_lists_max_modifier_lists_to_disable"]
      new(
        batch_upsert_max_objects_per_batch: batch_upsert_max_objects_per_batch,
        batch_upsert_max_total_objects: batch_upsert_max_total_objects,
        batch_retrieve_max_object_ids: batch_retrieve_max_object_ids,
        search_max_page_limit: search_max_page_limit,
        batch_delete_max_object_ids: batch_delete_max_object_ids,
        update_item_taxes_max_item_ids: update_item_taxes_max_item_ids,
        update_item_taxes_max_taxes_to_enable: update_item_taxes_max_taxes_to_enable,
        update_item_taxes_max_taxes_to_disable: update_item_taxes_max_taxes_to_disable,
        update_item_modifier_lists_max_item_ids: update_item_modifier_lists_max_item_ids,
        update_item_modifier_lists_max_modifier_lists_to_enable: update_item_modifier_lists_max_modifier_lists_to_enable,
        update_item_modifier_lists_max_modifier_lists_to_disable: update_item_modifier_lists_max_modifier_lists_to_disable,
        additional_properties: struct
      )
    end
# Serialize an instance of CatalogInfoResponseLimits to a JSON object
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
      obj.batch_upsert_max_objects_per_batch&.is_a?(Integer) != false || raise("Passed value for field obj.batch_upsert_max_objects_per_batch is not the expected type, validation failed.")
      obj.batch_upsert_max_total_objects&.is_a?(Integer) != false || raise("Passed value for field obj.batch_upsert_max_total_objects is not the expected type, validation failed.")
      obj.batch_retrieve_max_object_ids&.is_a?(Integer) != false || raise("Passed value for field obj.batch_retrieve_max_object_ids is not the expected type, validation failed.")
      obj.search_max_page_limit&.is_a?(Integer) != false || raise("Passed value for field obj.search_max_page_limit is not the expected type, validation failed.")
      obj.batch_delete_max_object_ids&.is_a?(Integer) != false || raise("Passed value for field obj.batch_delete_max_object_ids is not the expected type, validation failed.")
      obj.update_item_taxes_max_item_ids&.is_a?(Integer) != false || raise("Passed value for field obj.update_item_taxes_max_item_ids is not the expected type, validation failed.")
      obj.update_item_taxes_max_taxes_to_enable&.is_a?(Integer) != false || raise("Passed value for field obj.update_item_taxes_max_taxes_to_enable is not the expected type, validation failed.")
      obj.update_item_taxes_max_taxes_to_disable&.is_a?(Integer) != false || raise("Passed value for field obj.update_item_taxes_max_taxes_to_disable is not the expected type, validation failed.")
      obj.update_item_modifier_lists_max_item_ids&.is_a?(Integer) != false || raise("Passed value for field obj.update_item_modifier_lists_max_item_ids is not the expected type, validation failed.")
      obj.update_item_modifier_lists_max_modifier_lists_to_enable&.is_a?(Integer) != false || raise("Passed value for field obj.update_item_modifier_lists_max_modifier_lists_to_enable is not the expected type, validation failed.")
      obj.update_item_modifier_lists_max_modifier_lists_to_disable&.is_a?(Integer) != false || raise("Passed value for field obj.update_item_modifier_lists_max_modifier_lists_to_disable is not the expected type, validation failed.")
    end
  end
end