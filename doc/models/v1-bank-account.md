## V1 Bank Account

V1BankAccount

### Structure

`V1BankAccount`

### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The bank account's Square-issued ID. |
| `merchant_id` | `String` | Optional | The Square-issued ID of the merchant associated with the bank account. |
| `bank_name` | `String` | Optional | The name of the bank that manages the account. |
| `name` | `String` | Optional | The name associated with the bank account. |
| `routing_number` | `String` | Optional | The bank account's routing number. |
| `account_number_suffix` | `String` | Optional | The last few digits of the bank account number. |
| `currency_code` | `String` | Optional | The currency code of the currency associated with the bank account, in ISO 4217 format. For example, the currency code for US dollars is USD. |
| `type` | [`String (V1 Bank Account Type)`]($m/V1BankAccountType) | Optional | - |

### Example (as JSON)

```json
{
  "id": null,
  "merchant_id": null,
  "bank_name": null,
  "name": null,
  "routing_number": null,
  "account_number_suffix": null,
  "currency_code": null,
  "type": null
}
```

