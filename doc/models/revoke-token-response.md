
# Revoke Token Response

## Structure

`Revoke Token Response`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `success` | `Boolean` | Optional | If the request is successful, this is `true`. |
| `errors` | [`Array<Error Hash>`](/doc/models/error.md) | Optional | An error object that provides details about how creation of the obtain<br>token failed. |

## Example (as JSON)

```json
{
  "success": true
}
```

