
# Employee

An employee object that is used by the external API.

DEPRECATED at version 2020-08-26. Replaced by [TeamMember](entity:TeamMember).

## Structure

`Employee`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object. |
| `first_name` | `String` | Optional | The employee's first name. |
| `last_name` | `String` | Optional | The employee's last name. |
| `email` | `String` | Optional | The employee's email address |
| `phone_number` | `String` | Optional | The employee's phone number in E.164 format, i.e. "+12125554250" |
| `location_ids` | `Array<String>` | Optional | A list of location IDs where this employee has access to. |
| `status` | [`String (Employee Status)`](../../doc/models/employee-status.md) | Optional | The status of the Employee being retrieved.<br><br>DEPRECATED at version 2020-08-26. Replaced by [TeamMemberStatus](entity:TeamMemberStatus). |
| `is_owner` | `TrueClass \| FalseClass` | Optional | Whether this employee is the owner of the merchant. Each merchant<br>has one owner employee, and that employee has full authority over<br>the account. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |
| `updated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |

## Example (as JSON)

```json
{
  "id": "id6",
  "first_name": "first_name6",
  "last_name": "last_name4",
  "email": "email0",
  "phone_number": "phone_number6"
}
```

