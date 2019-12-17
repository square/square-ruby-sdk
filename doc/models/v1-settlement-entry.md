## V1 Settlement Entry

V1SettlementEntry

### Structure

`V1SettlementEntry`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payment_id` | `String` | Optional | The settlement's unique identifier. |
| `type` | [`String (V1 Settlement Entry Type)`]($m/V1SettlementEntryType) | Optional | - |
| `amount_money` | [`V1 Money Hash`]($m/V1Money) | Optional | - |
| `fee_money` | [`V1 Money Hash`]($m/V1Money) | Optional | - |

### Example (as JSON)

```json
{
  "payment_id": null,
  "type": null,
  "amount_money": null,
  "fee_money": null
}
```

