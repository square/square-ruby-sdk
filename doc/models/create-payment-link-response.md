
# Create Payment Link Response

## Structure

`Create Payment Link Response`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](../../doc/models/error.md) | Optional | Any errors that occurred during the request. |
| `payment_link` | [`Payment Link Hash`](../../doc/models/payment-link.md) | Optional | - |
| `related_resources` | [`Payment Link Related Resources Hash`](../../doc/models/payment-link-related-resources.md) | Optional | - |

## Example (as JSON)

```json
{
  "errors": null,
  "payment_link": null,
  "related_resources": null
}
```

