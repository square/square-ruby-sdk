## List Employees Request

Retrieve a paged-list of employees for a Square account

### Structure

`ListEmployeesRequest`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | Filter employees returned to only those that are associated with the<br>specified location. |
| `status` | [`String (Employee Status)`](/doc/models/employee-status.md) | Optional | The status of the Employee being retrieved. |
| `limit` | `Integer` | Optional | The number of employees to be returned on each page. |
| `cursor` | `String` | Optional | The token required to retrieve the specified page of results. |

### Example (as JSON)

```json
{
  "location_id": null,
  "status": null,
  "limit": null,
  "cursor": null
}
```

