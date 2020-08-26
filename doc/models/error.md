## Error

Represents an error encountered during a request to the Connect API.

See [Handling errors](#handlingerrors) for more information.

### Structure

`Error`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `category` | [`String (Error Category)`](/doc/models/error-category.md) |  | Indicates which high-level category of error has occurred during a<br>request to the Connect API. |
| `code` | [`String (Error Code)`](/doc/models/error-code.md) |  | Indicates the specific error that occurred during a request to a<br>Square API. |
| `detail` | `String` | Optional | A human-readable description of the error for debugging purposes. |
| `field` | `String` | Optional | The name of the field provided in the original request (if any) that<br>the error pertains to. |

### Example (as JSON)

```json
{
  "category": "INVALID_REQUEST_ERROR",
  "code": "TEMPORARY_ERROR",
  "detail": "detail6",
  "field": "field6"
}
```

