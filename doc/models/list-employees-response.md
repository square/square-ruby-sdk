## List Employees Response

Defines the fields that are included in the response body of
a request to the ListEmployees endpoint.

One of `errors` or `employees` is present in a given response (never both).

### Structure

`ListEmployeesResponse`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employees` | [`Array<Employee Hash>`](/doc/models/employee.md) | Optional | List of employees returned from the request. |
| `cursor` | `String` | Optional | The token to be used to retrieve the next page of results. |
| `errors` | [`Array<Error Hash>`](/doc/models/error.md) | Optional | Any errors that occurred during the request. |

### Example (as JSON)

```json
{
  "employees": null,
  "cursor": null,
  "errors": null
}
```

