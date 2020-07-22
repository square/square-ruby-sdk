## Invoice Recipient

Provides customer data that Square uses to deliver an invoice.

### Structure

`InvoiceRecipient`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Optional | The ID of the customer. This is the customer profile ID that <br>you provide when creating a draft invoice. |
| `given_name` | `String` | Optional | The recipient's given (that is, first) name. |
| `family_name` | `String` | Optional | The recipient's family (that is, last) name. |
| `email_address` | `String` | Optional | The recipient's email address. |
| `address` | [`Address Hash`](/doc/models/address.md) | Optional | Represents a physical address. |
| `phone_number` | `String` | Optional | The recipient's phone number. |
| `company_name` | `String` | Optional | The name of the recipient's company. |

### Example (as JSON)

```json
{
  "customer_id": null,
  "given_name": null,
  "family_name": null,
  "email_address": null,
  "address": null,
  "phone_number": null,
  "company_name": null
}
```

