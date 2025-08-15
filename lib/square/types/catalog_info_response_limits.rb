# frozen_string_literal: true

module Square
  class CatalogInfoResponseLimits < Internal::Types::Model
    field :batch_upsert_max_objects_per_batch, Integer, optional: true, nullable: false
    field :batch_upsert_max_total_objects, Integer, optional: true, nullable: false
    field :batch_retrieve_max_object_ids, Integer, optional: true, nullable: false
    field :search_max_page_limit, Integer, optional: true, nullable: false
    field :batch_delete_max_object_ids, Integer, optional: true, nullable: false
    field :update_item_taxes_max_item_ids, Integer, optional: true, nullable: false
    field :update_item_taxes_max_taxes_to_enable, Integer, optional: true, nullable: false
    field :update_item_taxes_max_taxes_to_disable, Integer, optional: true, nullable: false
    field :update_item_modifier_lists_max_item_ids, Integer, optional: true, nullable: false
    field :update_item_modifier_lists_max_modifier_lists_to_enable, Integer, optional: true, nullable: false
    field :update_item_modifier_lists_max_modifier_lists_to_disable, Integer, optional: true, nullable: false

  end
end
