
module Square
  module Catalog
    module Types
      class UpdateItemModifierListsRequest < Internal::Types::Model
        field :item_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :modifier_lists_to_enable, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :modifier_lists_to_disable, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      end
    end
  end
end
