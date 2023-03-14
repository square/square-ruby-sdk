
# Availability

Defines an appointment slot that encapsulates the appointment segments, location and starting time available for booking.

## Structure

`Availability`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `start_at` | `String` | Optional | The RFC 3339 timestamp specifying the beginning time of the slot available for booking. |
| `location_id` | `String` | Optional | The ID of the location available for booking.<br>**Constraints**: *Maximum Length*: `32` |
| `appointment_segments` | [`Array<Appointment Segment Hash>`](../../doc/models/appointment-segment.md) | Optional | The list of appointment segments available for booking |

## Example (as JSON)

```json
{
  "start_at": null,
  "location_id": null,
  "appointment_segments": null
}
```

