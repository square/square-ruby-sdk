# Merchants

```ruby
merchants_api = client.merchants
```

## Class Name

`MerchantsApi`

## Retrieve Merchant

Retrieve a `Merchant` object for the given `merchant_id`.

```ruby
def retrieve_merchant(merchant_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `merchant_id` | `String` | Template, Required | The ID of the merchant to retrieve |

### Response Type

[`Retrieve Merchant Response Hash`](/doc/models/retrieve-merchant-response.md)

### Example Usage

```ruby
merchant_id = 'merchant_id0'

result = merchants_api.retrieve_merchant(merchant_id: merchant_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

