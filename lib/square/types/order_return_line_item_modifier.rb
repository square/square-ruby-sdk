# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # A line item modifier being returned.
    class OrderReturnLineItemModifier < Internal::Types::Model
      field :uid, -> { String }, optional: true, nullable: true

      field :source_modifier_uid, -> { String }, optional: true, nullable: true

      field :catalog_object_id, -> { String }, optional: true, nullable: true

      field :catalog_version, -> { Integer }, optional: true, nullable: true

      field :name, -> { String }, optional: true, nullable: true

      field :base_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :total_price_money, -> { Square::Types::Money }, optional: true, nullable: false

      field :quantity, -> { String }, optional: true, nullable: true
    end
  end
end
