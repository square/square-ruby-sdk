## Catalog Query Filtered Items

### Structure

`CatalogQueryFilteredItems`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `text_filter` | `String` | Optional | - |
| `search_vendor_code` | `Boolean` | Optional | - |
| `category_ids` | `Array<String>` | Optional | - |
| `stock_levels` | [`Array<String (Catalog Query Filtered Items Stock Level)>`](/doc/models/catalog-query-filtered-items-stock-level.md) | Optional | See [CatalogQueryFilteredItemsStockLevel](#type-catalogqueryfiltereditemsstocklevel) for possible values |
| `enabled_location_ids` | `Array<String>` | Optional | - |
| `vendor_ids` | `Array<String>` | Optional | - |
| `product_types` | [`Array<String (Catalog Item Product Type)>`](/doc/models/catalog-item-product-type.md) | Optional | See [CatalogItemProductType](#type-catalogitemproducttype) for possible values |
| `custom_attribute_filters` | [`Array<Catalog Query Filtered Items Custom Attribute Filter Hash>`](/doc/models/catalog-query-filtered-items-custom-attribute-filter.md) | Optional | - |
| `does_not_exist` | [`Array<String (Catalog Query Filtered Items Nullable Attribute)>`](/doc/models/catalog-query-filtered-items-nullable-attribute.md) | Optional | See [CatalogQueryFilteredItemsNullableAttribute](#type-catalogqueryfiltereditemsnullableattribute) for possible values |
| `sort_order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |

### Example (as JSON)

```json
{
  "text_filter": null,
  "search_vendor_code": null,
  "category_ids": null,
  "stock_levels": null,
  "enabled_location_ids": null,
  "vendor_ids": null,
  "product_types": null,
  "custom_attribute_filters": null,
  "does_not_exist": null,
  "sort_order": null
}
```

