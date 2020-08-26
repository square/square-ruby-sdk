## V1 Settlement

V1Settlement

### Structure

`V1Settlement`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The settlement's unique identifier. |
| `status` | [`String (V1 Settlement Status)`](/doc/models/v1-settlement-status.md) | Optional | - |
| `total_money` | [`V1 Money Hash`](/doc/models/v1-money.md) | Optional | - |
| `initiated_at` | `String` | Optional | The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format. |
| `bank_account_id` | `String` | Optional | The Square-issued unique identifier for the bank account associated with the settlement. |
| `entries` | [`Array<V1 Settlement Entry Hash>`](/doc/models/v1-settlement-entry.md) | Optional | The entries included in this settlement. |

### Example (as JSON)

```json
{
  "id": "id0",
  "status": "FAILED",
  "total_money": {
    "amount": 250,
    "currency_code": "USS"
  },
  "initiated_at": "initiated_at2",
  "bank_account_id": "bank_account_id0"
}
```

