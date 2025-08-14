# frozen_string_literal: true

module Square
    module Types
        # A query composed of one or more different types of filters to narrow the scope of targeted objects when calling the `SearchCatalogObjects` endpoint.
        # 
        # Although a query can have multiple filters, only certain query types can be combined per call to [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects).
        # Any combination of the following types may be used together:
        # - [exact_query](entity:CatalogQueryExact)
        # - [prefix_query](entity:CatalogQueryPrefix)
        # - [range_query](entity:CatalogQueryRange)
        # - [sorted_attribute_query](entity:CatalogQuerySortedAttribute)
        # - [text_query](entity:CatalogQueryText)
        # 
        # All other query types cannot be combined with any others.
        # 
        # When a query filter is based on an attribute, the attribute must be searchable.
        # Searchable attributes are listed as follows, along their parent types that can be searched for with applicable query filters.
        # 
        # Searchable attribute and objects queryable by searchable attributes:
        # - `name`:  `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, `CatalogTax`, `CatalogDiscount`, `CatalogModifier`, `CatalogModifierList`, `CatalogItemOption`, `CatalogItemOptionValue`
        # - `description`: `CatalogItem`, `CatalogItemOptionValue`
        # - `abbreviation`: `CatalogItem`
        # - `upc`: `CatalogItemVariation`
        # - `sku`: `CatalogItemVariation`
        # - `caption`: `CatalogImage`
        # - `display_name`: `CatalogItemOption`
        # 
        # For example, to search for [CatalogItem](entity:CatalogItem) objects by searchable attributes, you can use
        # the `"name"`, `"description"`, or `"abbreviation"` attribute in an applicable query filter.
        class CatalogQuery < Internal::Types::Model
            field :sorted_attribute_query, Square::CatalogQuerySortedAttribute, optional: true, nullable: false
            field :exact_query, Square::CatalogQueryExact, optional: true, nullable: false
            field :set_query, Square::CatalogQuerySet, optional: true, nullable: false
            field :prefix_query, Square::CatalogQueryPrefix, optional: true, nullable: false
            field :range_query, Square::CatalogQueryRange, optional: true, nullable: false
            field :text_query, Square::CatalogQueryText, optional: true, nullable: false
            field :items_for_tax_query, Square::CatalogQueryItemsForTax, optional: true, nullable: false
            field :items_for_modifier_list_query, Square::CatalogQueryItemsForModifierList, optional: true, nullable: false
            field :items_for_item_options_query, Square::CatalogQueryItemsForItemOptions, optional: true, nullable: false
            field :item_variations_for_item_option_values_query, Square::CatalogQueryItemVariationsForItemOptionValues, optional: true, nullable: false
        end
    end
end
