## V1 Merchant

Defines the fields that are included in the response body of
a request to the **RetrieveBusiness** endpoint.

### Structure

`V1Merchant`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The merchant account's unique identifier. |
| `name` | `String` | Optional | The name associated with the merchant account. |
| `email` | `String` | Optional | The email address associated with the merchant account. |
| `account_type` | [`String (V1 Merchant Account Type)`](/doc/models/v1-merchant-account-type.md) | Optional | - |
| `account_capabilities` | `Array<String>` | Optional | Capabilities that are enabled for the merchant's Square account. Capabilities that are not listed in this array are not enabled for the account. |
| `country_code` | `String` | Optional | The country associated with the merchant account, in ISO 3166-1-alpha-2 format. |
| `language_code` | `String` | Optional | The language associated with the merchant account, in BCP 47 format. |
| `currency_code` | `String` | Optional | The currency associated with the merchant account, in ISO 4217 format. For example, the currency code for US dollars is USD. |
| `business_name` | `String` | Optional | The name of the merchant's business. |
| `business_address` | [`Address Hash`](/doc/models/address.md) | Optional | Represents a physical address. |
| `business_phone` | [`V1 Phone Number Hash`](/doc/models/v1-phone-number.md) | Optional | Represents a phone number. |
| `business_type` | [`String (V1 Merchant Business Type)`](/doc/models/v1-merchant-business-type.md) | Optional | - |
| `shipping_address` | [`Address Hash`](/doc/models/address.md) | Optional | Represents a physical address. |
| `location_details` | [`V1 Merchant Location Details Hash`](/doc/models/v1-merchant-location-details.md) | Optional | Additional information for a single-location account specified by its associated business account, if it has one. |
| `market_url` | `String` | Optional | The URL of the merchant's online store. |

### Example (as JSON)

```json
{
  "id": "id0",
  "name": "name0",
  "email": "email6",
  "account_type": "LOCATION",
  "account_capabilities": [
    "account_capabilities8"
  ]
}
```

