# frozen_string_literal: true

module Square
  module Catalog
    module Types
      class UpdateItemTaxesRequest < Internal::Types::Model
        field :item_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :taxes_to_enable, -> { Internal::Types::Array[String] }, optional: true, nullable: true

        field :taxes_to_disable, -> { Internal::Types::Array[String] }, optional: true, nullable: true
      end
    end
  end
end
