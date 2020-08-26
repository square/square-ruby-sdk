## List Employees Request

### Structure

`ListEmployeesRequest`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | - |
| `status` | [`String (Employee Status)`](/doc/models/employee-status.md) | Optional | The status of the Employee being retrieved. |
| `limit` | `Integer` | Optional | The number of employees to be returned on each page. |
| `cursor` | `String` | Optional | The token required to retrieve the specified page of results. |

### Example (as JSON)

```json
{
  "location_id": "location_id4",
  "status": "ACTIVE",
  "limit": 172,
  "cursor": "cursor6"
}
```

