## Loyalty Event Adjust Points

Provides metadata when the event `type` is `ADJUST_POINTS`.

### Structure

`LoyaltyEventAdjustPoints`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `loyalty_program_id` | `String` | Optional | The Square-assigned ID of the [loyalty program](#type-LoyaltyProgram). |
| `points` | `Integer` |  | The number of points added or removed. |
| `reason` | `String` | Optional | The reason for the adjustment of points. |

### Example (as JSON)

```json
{
  "loyalty_program_id": "loyalty_program_id0",
  "points": 236,
  "reason": "reason4"
}
```

