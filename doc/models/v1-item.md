## V1 Item

V1Item

### Structure

`V1Item`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The item's ID. Must be unique among all entity IDs ever provided on behalf of the merchant. You can never reuse an ID. This value can include alphanumeric characters, dashes (-), and underscores (_). |
| `name` | `String` | Optional | The item's name. |
| `description` | `String` | Optional | The item's description. |
| `type` | [`String (V1 Item Type)`]($m/V1ItemType) | Optional | - |
| `color` | [`String (V1 Item Color)`]($m/V1ItemColor) | Optional | - |
| `abbreviation` | `String` | Optional | The text of the item's display label in Square Point of Sale. Only up to the first five characters of the string are used. |
| `visibility` | [`String (V1 Item Visibility)`]($m/V1ItemVisibility) | Optional | - |
| `available_online` | `Boolean` | Optional | If true, the item can be added to shipping orders from the merchant's online store. |
| `master_image` | [`V1 Item Image Hash`]($m/V1ItemImage) | Optional | V1ItemImage |
| `category` | [`V1 Category Hash`]($m/V1Category) | Optional | V1Category |
| `variations` | [`Array<V1 Variation Hash>`]($m/V1Variation) | Optional | The item's variations. You must specify at least one variation. |
| `modifier_lists` | [`Array<V1 Modifier List Hash>`]($m/V1ModifierList) | Optional | The modifier lists that apply to the item, if any. |
| `fees` | [`Array<V1 Fee Hash>`]($m/V1Fee) | Optional | The fees that apply to the item, if any. |
| `taxable` | `Boolean` | Optional | Deprecated. This field is not used. |
| `category_id` | `String` | Optional | The ID of the item's category, if any. |
| `available_for_pickup` | `Boolean` | Optional | If true, the item can be added to pickup orders from the merchant's online store. Default value: false |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "description": null,
  "type": null,
  "color": null,
  "abbreviation": null,
  "visibility": null,
  "available_online": null,
  "master_image": null,
  "category": null,
  "variations": null,
  "modifier_lists": null,
  "fees": null,
  "taxable": null,
  "category_id": null,
  "available_for_pickup": null,
  "v2_id": null
}
```

