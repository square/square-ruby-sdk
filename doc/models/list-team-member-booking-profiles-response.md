
# List Team Member Booking Profiles Response

## Structure

`List Team Member Booking Profiles Response`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `team_member_booking_profiles` | [`Array<Team Member Booking Profile Hash>`](/doc/models/team-member-booking-profile.md) | Optional | The list of team member booking profiles. |
| `cursor` | `String` | Optional | The cursor for paginating through the results. |
| `errors` | [`Array<Error Hash>`](/doc/models/error.md) | Optional | Any errors that occurred during the request. |

## Example (as JSON)

```json
{
  "errors": [],
  "team_member_booking_profiles": [
    {
      "display_name": "Sandbox Seller",
      "is_bookable": true,
      "team_member_id": "TMXUrsBWWcHTt79t"
    },
    {
      "display_name": "Sandbox Staff",
      "is_bookable": true,
      "team_member_id": "TMaJcbiRqPIGZuS9"
    }
  ]
}
```

