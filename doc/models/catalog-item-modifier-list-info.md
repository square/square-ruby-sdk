## Catalog Item Modifier List Info

Controls the properties of a [CatalogModifierList](./models/catalog-modifier-list.md) as it applies to this [CatalogItem](./models/catalog-item.md).

### Structure

`CatalogItemModifierListInfo`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `modifier_list_id` | `String` |  | The ID of the [CatalogModifierList](./models/catalog-modifier.md) controlled by this [CatalogModifierListInfo](./models/catalog-modifier-list-info.md). |
| `modifier_overrides` | [`Array<Catalog Modifier Override Hash>`](/doc/models/catalog-modifier-override.md) | Optional | A set of [CatalogModifierOverride](./models/catalog-modifier-override.md) objects that override whether a given [CatalogModifier](./models/catalog-modifier.md) is enabled by default. |
| `min_selected_modifiers` | `Integer` | Optional | If zero or larger, the smallest number of [CatalogModifier](./models/catalog-modifier.md)s that must be selected from this [CatalogModifierList](./models/catalog-modifier-list.md). |
| `max_selected_modifiers` | `Integer` | Optional | If zero or larger, the largest number of [CatalogModifier](./models/catalog-modifier.md)s that can be selected from this [CatalogModifierList](./models/catalog-modifier-list.md). |
| `enabled` | `Boolean` | Optional | If `true`, enable this [CatalogModifierList](./models/catalog-modifier-list.md). |

### Example (as JSON)

```json
{
  "modifier_list_id": "modifier_list_id6",
  "modifier_overrides": null,
  "min_selected_modifiers": null,
  "max_selected_modifiers": null,
  "enabled": null
}
```

