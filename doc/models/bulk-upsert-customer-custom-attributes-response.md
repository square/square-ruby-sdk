
# Bulk Upsert Customer Custom Attributes Response

Represents a [BulkUpsertCustomerCustomAttributes](../../doc/api/customer-custom-attributes.md#bulk-upsert-customer-custom-attributes) response,
which contains a map of responses that each corresponds to an individual upsert request.

## Structure

`Bulk Upsert Customer Custom Attributes Response`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `values` | [`Hash of Bulk Upsert Customer Custom Attributes Response Customer Custom Attribute Upsert Response Hash`](../../doc/models/bulk-upsert-customer-custom-attributes-response-customer-custom-attribute-upsert-response.md) | Optional | A map of responses that correspond to individual upsert requests. Each response has the<br>same ID as the corresponding request and contains either a `customer_id` and `custom_attribute` or an `errors` field. |
| `errors` | [`Array<Error Hash>`](../../doc/models/error.md) | Optional | Any errors that occurred during the request. |

## Example (as JSON)

```json
{
  "values": null,
  "errors": null
}
```

