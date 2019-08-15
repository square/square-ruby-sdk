## Employee

An employee created in the **Square Dashboard** account of a business. 
Used by the Labor API.

### Structure

`Employee`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this `Employee`. |
| `first_name` | `String` | Optional | Given (first) name of the employee. |
| `last_name` | `String` | Optional | Family (last) name of the employee |
| `email` | `String` | Optional | Email of the employee |
| `phone_number` | `String` | Optional | Phone number of the employee in E.164 format, i.e. "+12125554250" |
| `location_ids` | `Array<String>` | Optional | A list of location IDs where this employee has access. |
| `status` | [`String (Employee Status)`](/doc/models/employee-status.md) | Optional | The status of the Employee being retrieved. |
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

