## V1 Modifier List

V1ModifierList

### Structure

`V1ModifierList`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The modifier list's unique ID. |
| `name` | `String` | Optional | The modifier list's name. |
| `selection_type` | [`String (V1 Modifier List Selection Type)`](/doc/models/v1-modifier-list-selection-type.md) | Optional | - |
| `modifier_options` | [`Array<V1 Modifier Option Hash>`](/doc/models/v1-modifier-option.md) | Optional | The options included in the modifier list. |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "selection_type": null,
  "modifier_options": null,
  "v2_id": null
}
```

