## V1 Employee

Represents one of a business's employees.

### Structure

`V1Employee`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The employee's unique ID. |
| `first_name` | `String` |  | The employee's first name. |
| `last_name` | `String` |  | The employee's last name. |
| `role_ids` | `Array<String>` | Optional | The ids of the employee's associated roles. Currently, you can specify only one or zero roles per employee. |
| `authorized_location_ids` | `Array<String>` | Optional | The IDs of the locations the employee is allowed to clock in at. |
| `email` | `String` | Optional | The employee's email address. |
| `status` | [`String (V1 Employee Status)`](/doc/models/v1-employee-status.md) | Optional | - |
| `external_id` | `String` | Optional | An ID the merchant can set to associate the employee with an entity in another system. |
| `created_at` | `String` | Optional | The time when the employee entity was created, in ISO 8601 format. |
| `updated_at` | `String` | Optional | The time when the employee entity was most recently updated, in ISO 8601 format. |

### Example (as JSON)

```json
{
  "id": "id0",
  "first_name": "first_name0",
  "last_name": "last_name8",
  "role_ids": [
    "role_ids6",
    "role_ids7",
    "role_ids8"
  ],
  "authorized_location_ids": [
    "authorized_location_ids1"
  ],
  "email": "email6",
  "status": "ACTIVE"
}
```

