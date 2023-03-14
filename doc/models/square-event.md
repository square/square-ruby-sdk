
# Square Event

## Structure

`Square Event`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `merchant_id` | `String` | Optional | The ID of the target merchant associated with the event. |
| `location_id` | `String` | Optional | The ID of the location associated with the event. |
| `type` | `String` | Optional | The type of event this represents. |
| `event_id` | `String` | Optional | A unique ID for the event. |
| `created_at` | `String` | Optional | Timestamp of when the event was created, in RFC 3339 format. |
| `data` | [`Square Event Data Hash`](../../doc/models/square-event-data.md) | Optional | - |

## Example (as JSON)

```json
{
  "merchant_id": null,
  "location_id": null,
  "type": null,
  "event_id": null,
  "created_at": null,
  "data": null
}
```

