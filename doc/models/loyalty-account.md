## Loyalty Account

Describes a loyalty account. For more information, see 
[Loyalty Overview](https://developer.squareup.com/docs/docs/loyalty/overview).

### Structure

`LoyaltyAccount`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The Square-assigned ID of the loyalty account. |
| `mappings` | [`Array<Loyalty Account Mapping Hash>`](/doc/models/loyalty-account-mapping.md) |  | The list of mappings that the account is associated with. <br>Currently, a buyer can only be mapped to a loyalty account using <br>a phone number. Therefore, the list can only have one mapping. |
| `program_id` | `String` |  | The Square-assigned ID of the [loyalty program](#type-LoyaltyProgram) to which the account belongs. |
| `balance` | `Integer` | Optional | The available point balance in the loyalty account. |
| `lifetime_points` | `Integer` | Optional | The total points accrued during the lifetime of the account. |
| `customer_id` | `String` | Optional | The Square-assigned ID of the [customer](#type-Customer) that is associated with the account. |
| `enrolled_at` | `String` | Optional | The timestamp when enrollment occurred, in RFC 3339 format. |
| `created_at` | `String` | Optional | The timestamp when the loyalty account was created, in RFC 3339 format. |
| `updated_at` | `String` | Optional | The timestamp when the loyalty account was last updated, in RFC 3339 format. |

### Example (as JSON)

```json
{
  "id": "id0",
  "mappings": [
    {
      "id": "id4",
      "type": "type6",
      "value": "value6",
      "created_at": "created_at8"
    }
  ],
  "program_id": "program_id0",
  "balance": 64,
  "lifetime_points": 88,
  "customer_id": "customer_id8",
  "enrolled_at": "enrolled_at0"
}
```

