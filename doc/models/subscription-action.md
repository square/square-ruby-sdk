
# Subscription Action

Represents an action as a pending change to a subscription.

## Structure

`Subscription Action`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The ID of an action scoped to a subscription. |
| `type` | [`String (Subscription Action Type)`](../../doc/models/subscription-action-type.md) | Optional | Supported types of an action as a pending change to a subscription. |
| `effective_date` | `String` | Optional | The `YYYY-MM-DD`-formatted date when the action occurs on the subscription. |
| `new_plan_id` | `String` | Optional | The target subscription plan a subscription switches to, for a `SWAP_PLAN` action. |

## Example (as JSON)

```json
{
  "id": "id0",
  "type": "RESUME",
  "effective_date": "effective_date0",
  "new_plan_id": "new_plan_id4"
}
```

