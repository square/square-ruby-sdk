## Customer

Represents one of a business's customers, which can have one or more
cards on file associated with it.

### Structure

`Customer`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` |  | The customer's unique ID. |
| `created_at` | `String` |  | The time when the customer was created, in RFC 3339 format. |
| `updated_at` | `String` |  | The time when the customer was last updated, in RFC 3339 format. |
| `cards` | [`Array<Card Hash>`](/doc/models/card.md) | Optional | The payment details of the customer's cards on file. |
| `given_name` | `String` | Optional | The customer's given (i.e., first) name. |
| `family_name` | `String` | Optional | The customer's family (i.e., last) name. |
| `nickname` | `String` | Optional | The customer's nickname. |
| `company_name` | `String` | Optional | The name of the customer's company. |
| `email_address` | `String` | Optional | The customer's email address. |
| `address` | [`Address Hash`](/doc/models/address.md) | Optional | Represents a physical address. |
| `phone_number` | `String` | Optional | The customer's phone number. |
| `birthday` | `String` | Optional | The customer's birthday in RFC-3339 format. Year is optional,<br>timezone and times are not allowed. Example: `0000-09-01T00:00:00-00:00`<br>for a birthday on September 1st. `1998-09-01T00:00:00-00:00` for a birthday<br>on September 1st 1998. |
| `reference_id` | `String` | Optional | A second ID you can set to associate the customer with an<br>entity in another system. |
| `note` | `String` | Optional | A note to associate with the customer. |
| `preferences` | [`Customer Preferences Hash`](/doc/models/customer-preferences.md) | Optional | Represents a particular customer's preferences. |
| `groups` | [`Array<Customer Group Info Hash>`](/doc/models/customer-group-info.md) | Optional | The groups the customer belongs to. |
| `creation_source` | [`String (Customer Creation Source)`](/doc/models/customer-creation-source.md) | Optional | Indicates the method used to create the customer profile. |

### Example (as JSON)

```json
{
  "id": "id0",
  "created_at": "created_at2",
  "updated_at": "updated_at4",
  "cards": null,
  "given_name": null,
  "family_name": null,
  "nickname": null,
  "company_name": null,
  "email_address": null,
  "address": null,
  "phone_number": null,
  "birthday": null,
  "reference_id": null,
  "note": null,
  "preferences": null,
  "groups": null,
  "creation_source": null
}
```

