
# Vendor

Represents a supplier to a seller.

## Structure

`Vendor`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | A unique Square-generated ID for the [Vendor](../../doc/models/vendor.md).<br>This field is required when attempting to update a [Vendor](../../doc/models/vendor.md).<br>**Constraints**: *Maximum Length*: `100` |
| `created_at` | `String` | Optional | An RFC 3339-formatted timestamp that indicates when the<br>[Vendor](../../doc/models/vendor.md) was created.<br>**Constraints**: *Maximum Length*: `34` |
| `updated_at` | `String` | Optional | An RFC 3339-formatted timestamp that indicates when the<br>[Vendor](../../doc/models/vendor.md) was last updated.<br>**Constraints**: *Maximum Length*: `34` |
| `name` | `String` | Optional | The name of the [Vendor](../../doc/models/vendor.md).<br>This field is required when attempting to create or update a [Vendor](../../doc/models/vendor.md).<br>**Constraints**: *Maximum Length*: `100` |
| `address` | [`Address Hash`](../../doc/models/address.md) | Optional | Represents a postal address in a country.<br>For more information, see [Working with Addresses](../../https://developer.squareup.com/docs/build-basics/working-with-addresses). |
| `contacts` | [`Array<Vendor Contact Hash>`](../../doc/models/vendor-contact.md) | Optional | The contacts of the [Vendor](../../doc/models/vendor.md). |
| `account_number` | `String` | Optional | The account number of the [Vendor](../../doc/models/vendor.md).<br>**Constraints**: *Maximum Length*: `100` |
| `note` | `String` | Optional | A note detailing information about the [Vendor](../../doc/models/vendor.md).<br>**Constraints**: *Maximum Length*: `4096` |
| `version` | `Integer` | Optional | The version of the [Vendor](../../doc/models/vendor.md). |
| `status` | [`String (Vendor Status)`](../../doc/models/vendor-status.md) | Optional | The status of the [Vendor](../../doc/models/vendor.md),<br>whether a [Vendor](../../doc/models/vendor.md) is active or inactive. |

## Example (as JSON)

```json
{
  "id": "id0",
  "created_at": "created_at2",
  "updated_at": "updated_at4",
  "name": "name0",
  "address": {
    "address_line_1": "address_line_16",
    "address_line_2": "address_line_26",
    "address_line_3": "address_line_32",
    "locality": "locality6",
    "sublocality": "sublocality6"
  }
}
```

