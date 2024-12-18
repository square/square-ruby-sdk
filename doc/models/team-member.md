
# Team Member

A record representing an individual team member for a business.

## Structure

`Team Member`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The unique ID for the team member. |
| `reference_id` | `String` | Optional | A second ID used to associate the team member with an entity in another system. |
| `is_owner` | `TrueClass \| FalseClass` | Optional | Whether the team member is the owner of the Square account. |
| `status` | [`String (Team Member Status)`](../../doc/models/team-member-status.md) | Optional | Enumerates the possible statuses the team member can have within a business. |
| `given_name` | `String` | Optional | The given name (that is, the first name) associated with the team member. |
| `family_name` | `String` | Optional | The family name (that is, the last name) associated with the team member. |
| `email_address` | `String` | Optional | The email address associated with the team member. After accepting the invitation<br>from Square, only the team member can change this value. |
| `phone_number` | `String` | Optional | The team member's phone number, in E.164 format. For example:<br>+14155552671 - the country code is 1 for US<br>+551155256325 - the country code is 55 for BR |
| `created_at` | `String` | Optional | The timestamp when the team member was created, in RFC 3339 format. |
| `updated_at` | `String` | Optional | The timestamp when the team member was last updated, in RFC 3339 format. |
| `assigned_locations` | [`Team Member Assigned Locations Hash`](../../doc/models/team-member-assigned-locations.md) | Optional | An object that represents a team member's assignment to locations. |
| `wage_setting` | [`Wage Setting Hash`](../../doc/models/wage-setting.md) | Optional | Represents information about the overtime exemption status, job assignments, and compensation<br>for a [team member](../../doc/models/team-member.md). |

## Example (as JSON)

```json
{
  "id": "id4",
  "reference_id": "reference_id8",
  "is_owner": false,
  "status": "ACTIVE",
  "given_name": "given_name6"
}
```

