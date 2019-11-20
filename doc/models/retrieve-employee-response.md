## Retrieve Employee Response

### Structure

`RetrieveEmployeeResponse`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee` | [`Employee Hash`](/doc/models/employee.md) | Optional | An employee object that is used by the external API. |
| `errors` | [`Array<Error Hash>`](/doc/models/error.md) | Optional | Any errors that occurred during the request. |

### Example (as JSON)

```json
{
  "employee": null,
  "errors": null
}
```

