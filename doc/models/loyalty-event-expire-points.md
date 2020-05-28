## Loyalty Event Expire Points

Provides metadata when the event `type` is `EXPIRE_POINTS`.

### Structure

`LoyaltyEventExpirePoints`

### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `loyalty_program_id` | `String` | The Square-assigned ID of the [loyalty program](#type-LoyaltyProgram). |
| `points` | `Integer` | The number of points expired. |

### Example (as JSON)

```json
{
  "loyalty_program_id": "loyalty_program_id0",
  "points": 236
}
```

