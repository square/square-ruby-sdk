## V1 Settlement

V1Settlement

### Structure

`V1Settlement`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The settlement's unique identifier. |
| `status` | [`String (V1 List Settlements Request Status)`](/doc/models/v1-list-settlements-request-status.md) | Optional | - |
| `total_money` | [`V1 Money Hash`](/doc/models/v1-money.md) | Optional | - |
| `initiated_at` | `String` | Optional | The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format. |
| `bank_account_id` | `String` | Optional | The Square-issued unique identifier for the bank account associated with the settlement. |
| `entries` | [`Array<V1 Settlement Entry Hash>`](/doc/models/v1-settlement-entry.md) | Optional | The entries included in this settlement. |

### Example (as JSON)

```json
{
  "id": null,
  "status": null,
  "total_money": null,
  "initiated_at": null,
  "bank_account_id": null,
  "entries": null
}
```

