## Employee

An employee object that is used by the external API.

### Structure

`Employee`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object. |
| `first_name` | `String` | Optional | The employee's first name. |
| `last_name` | `String` | Optional | The employee's last name. |
| `email` | `String` | Optional | The employee's email address |
| `phone_number` | `String` | Optional | The employee's phone number in E.164 format, i.e. "+12125554250" |
| `location_ids` | `Array<String>` | Optional | A list of location IDs where this employee has access to. |
| `status` | [`String (Employee Status)`]($m/EmployeeStatus) | Optional | The status of the Employee being retrieved. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |
| `updated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |

### Example (as JSON)

```json
{
  "id": null,
  "first_name": null,
  "last_name": null,
  "email": null,
  "phone_number": null,
  "location_ids": null,
  "status": null,
  "created_at": null,
  "updated_at": null
}
```

