## V1 Order History Entry

V1OrderHistoryEntry

### Structure

`V1OrderHistoryEntry`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `action` | [`String (V1 Order History Entry Action)`](/doc/models/v1-order-history-entry-action.md) | Optional | - |
| `created_at` | `String` | Optional | The time when the action was performed, in ISO 8601 format. |

### Example (as JSON)

```json
{
  "action": "ORDER_PLACED",
  "created_at": "created_at2"
}
```

