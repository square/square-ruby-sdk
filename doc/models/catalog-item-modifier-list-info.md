## Catalog Item Modifier List Info

Controls the properties of a [CatalogModifierList](#type-catalogmodifierlist) as it applies to this [CatalogItem](#type-catalogitem).

### Structure

`CatalogItemModifierListInfo`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `modifier_list_id` | `String` |  | The ID of the [CatalogModifierList](#type-catalogmodifierlist) controlled by this [CatalogModifierListInfo](#type-catalogmodifierlistinfo). |
| `modifier_overrides` | [`Array<Catalog Modifier Override Hash>`](/doc/models/catalog-modifier-override.md) | Optional | A set of [CatalogModifierOverride](#type-catalogmodifieroverride) objects that override whether a given [CatalogModifier](#type-catalogmodifier) is enabled by default. |
| `min_selected_modifiers` | `Integer` | Optional | If zero or larger, the smallest number of [CatalogModifier](#type-catalogmodifier)s that must be selected from this [CatalogModifierList](#type-catalogmodifierlist). |
| `max_selected_modifiers` | `Integer` | Optional | If zero or larger, the largest number of [CatalogModifier](#type-catalogmodifier)s that can be selected from this [CatalogModifierList](#type-catalogmodifierlist). |
| `enabled` | `Boolean` | Optional | If `true`, enable this [CatalogModifierList](#type-catalogmodifierlist). |

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

