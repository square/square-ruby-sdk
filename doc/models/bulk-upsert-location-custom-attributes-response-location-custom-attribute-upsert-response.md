
# Bulk Upsert Location Custom Attributes Response Location Custom Attribute Upsert Response

Represents a response for an individual upsert request in a [BulkUpsertLocationCustomAttributes](../../doc/api/location-custom-attributes.md#bulk-upsert-location-custom-attributes) operation.

## Structure

`Bulk Upsert Location Custom Attributes Response Location Custom Attribute Upsert Response`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | The ID of the location associated with the custom attribute. |
| `custom_attribute` | [`Custom Attribute Hash`](../../doc/models/custom-attribute.md) | Optional | A custom attribute value. Each custom attribute value has a corresponding<br>`CustomAttributeDefinition` object. |
| `errors` | [`Array<Error Hash>`](../../doc/models/error.md) | Optional | Any errors that occurred while processing the individual request. |

## Example (as JSON)

```json
{
  "location_id": "location_id8",
  "custom_attribute": {
    "key": "key2",
    "value": {
      "key1": "val1",
      "key2": "val2"
    },
    "version": 102,
    "visibility": "VISIBILITY_READ_ONLY",
    "definition": {
      "key": "key0",
      "schema": {
        "key1": "val1",
        "key2": "val2"
      },
      "name": "name0",
      "description": "description0",
      "visibility": "VISIBILITY_HIDDEN"
    }
  },
  "errors": [
    {
      "category": "MERCHANT_SUBSCRIPTION_ERROR",
      "code": "INVALID_EXPIRATION",
      "detail": "detail6",
      "field": "field4"
    },
    {
      "category": "MERCHANT_SUBSCRIPTION_ERROR",
      "code": "INVALID_EXPIRATION",
      "detail": "detail6",
      "field": "field4"
    }
  ]
}
```

