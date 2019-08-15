## Error

Represents an error encountered during a request to the Connect API.

### Structure

`Error`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `category` | [`String (Error Category)`](/doc/models/error-category.md) |  | Indicates which high-level category of error has occurred during a<br>request to the Connect API. |
| `code` | [`String (Error Code)`](/doc/models/error-code.md) |  | Indicates specific errors that can occur during a request to the<br>Connect API. |
| `detail` | `String` | Optional | A human-readable description of the error for debugging purposes. |
| `field` | `String` | Optional | The name of the field provided in the original request that the error<br>pertains to, if any. |

### Example (as JSON)

```json
{
  "category": "INVALID_REQUEST_ERROR",
  "code": "ACCESS_TOKEN_EXPIRED",
  "detail": null,
  "field": null
}
```

