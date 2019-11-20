## Update Customer Request

Defines the body parameters that can be provided in a request to the
UpdateCustomer endpoint.

### Structure

`UpdateCustomerRequest`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `given_name` | `String` | Optional | The given (i.e., first) name associated with the customer profile. |
| `family_name` | `String` | Optional | The family (i.e., last) name associated with the customer profile. |
| `company_name` | `String` | Optional | A business name associated with the customer profile. |
| `nickname` | `String` | Optional | A nickname for the customer profile. |
| `email_address` | `String` | Optional | The email address associated with the customer profile. |
| `address` | [`Address Hash`](/doc/models/address.md) | Optional | Represents a physical address. |
| `phone_number` | `String` | Optional | The 11-digit phone number associated with the customer profile. |
| `reference_id` | `String` | Optional | An optional, second ID used to associate the customer profile with an<br>entity in another system. |
| `note` | `String` | Optional | A custom note associated with the customer profile. |
| `birthday` | `String` | Optional | The birthday associated with the customer profile, in RFC-3339 format.<br>Year is optional, timezone and times are not allowed.<br>For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st.<br>`1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__. |

### Example (as JSON)

```json
{
  "phone_number": "",
  "email_address": "New.Amelia.Earhart@example.com",
  "note": "updated customer note"
}
```

