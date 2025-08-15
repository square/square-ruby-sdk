# frozen_string_literal: true

module Square
  # Defines how discounts are automatically applied to a set of items that match the pricing rule
  # during the active time period.
  class CatalogPricingRule < Internal::Types::Model
    field :name, String, optional: true, nullable: false
    field :time_period_ids, Internal::Types::Array[String], optional: true, nullable: false
    field :discount_id, String, optional: true, nullable: false
    field :match_products_id, String, optional: true, nullable: false
    field :apply_products_id, String, optional: true, nullable: false
    field :exclude_products_id, String, optional: true, nullable: false
    field :valid_from_date, String, optional: true, nullable: false
    field :valid_from_local_time, String, optional: true, nullable: false
    field :valid_until_date, String, optional: true, nullable: false
    field :valid_until_local_time, String, optional: true, nullable: false
    field :exclude_strategy, Square::ExcludeStrategy, optional: true, nullable: false
    field :minimum_order_subtotal_money, Square::Money, optional: true, nullable: false
    field :customer_group_ids_any, Internal::Types::Array[String], optional: true, nullable: false

  end
end
