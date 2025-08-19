# Square Ruby Library

[![Build](https://github.com/square/square-ruby-sdk/actions/workflows/ruby.yml/badge.svg)](https://github.com/square/square-ruby-sdk/actions/workflows/ruby.yml)
[![Gem version](https://badge.fury.io/rb/square.rb.svg?new)](https://badge.fury.io/rb/square.rb)

The Square Ruby library provides convenient access to the Square API from Ruby.

## Requirements

Use of the Square Ruby SDK requires:

* Ruby 2.7+

## Installation

For more information, see [Set Up Your Square SDK for a Ruby Project](https://developer.squareup.com/docs/sdks/ruby/setup-project).

## Reference

For more information, see [Full Ruby Guide](https://developer.squareup.com/docs/sdks/ruby).

## Versioning

The Square Ruby SDK version is managed through the gem version. To use a specific version:

```bash
gem install square.rb -v 44.0.0
```

Or in your Gemfile:
```ruby
gem 'square.rb', '~> 44.0.0'
```
```

## Usage

For more information, see [Using the Square Ruby SDK](https://developer.squareup.com/docs/sdks/ruby/using-ruby-sdk).

## Legacy SDK

While the new SDK has a lot of improvements, we at Square understand that it takes time to upgrade when there are breaking changes.
To make the migration easier, the new SDK also exports the legacy SDK as `square_legacy`. Here's an example of how you can use the
legacy SDK alongside the new SDK inside a single file:

```ruby
# Load both SDKs
require 'square'
require 'square_legacy'

# Initialize new SDK client
new_client = Square::Client.new(
  access_token: 'YOUR_SQUARE_ACCESS_TOKEN'
)

# Initialize legacy SDK client
legacy_client = SquareLegacy::Client.new(
  bearer_auth_credentials: {
    access_token: 'YOUR_SQUARE_ACCESS_TOKEN'
  }
)

# Use new SDK for newer features
locations = new_client.locations.get_locations.data.locations

# Use legacy SDK for specific legacy functionality
legacy_payment = legacy_client.payments_api.create_payment(
  body: {
    source_id: 'example_1234567890',
    idempotency_key: SecureRandom.uuid,
    amount_money: {
      amount: 100,
      currency: 'USD'
    }
  }
)
```

We recommend migrating to the new SDK using the following steps:

1. Update your square.rb: `gem update square.rb`
2. Search and replace all requires from `'square'` to `'square_legacy'`
3. Update all client initializations from 
```ruby 
client = Square::Client.new(access_token: 'token')
```
to 
```ruby
client = SquareLegacy::Client.new(
  bearer_auth_credentials: { access_token: 'token' }
)
```
4. Gradually migrate over to the new SDK by importing it from the `'square'` import.

## Request And Response Types

The SDK exports all request and response types as Ruby classes. Simply require them with the
following namespace:

```ruby
require 'square'

# Create a request object
request = Square::CreateMobileAuthorizationCodeRequest.new(
  location_id: 'YOUR_LOCATION_ID'
)
```

## Exception Handling

When the API returns a non-success status code (4xx or 5xx response), a subclass of the following error
will be raised.

```ruby
require 'square'

begin
  response = client.payments.create(...)
rescue Square::ApiError => e
  puts "Status Code: #{e.status_code}"
  puts "Message: #{e.message}"
  puts "Body: #{e.body}"
end
```

## Pagination

List endpoints are paginated. The SDK provides methods to handle pagination:

```ruby
require 'square'

client = Square::Client.new(access_token: "YOUR_TOKEN")

# Get all items using pagination
response = client.bank_accounts.list
all_bank_accounts = []

while response.data.bank_accounts.any?
  all_bank_accounts.concat(response.data.bank_accounts)
  
  # Check if there are more pages
  if response.cursor
    response = client.bank_accounts.list(cursor: response.cursor)
  else
    break
  end
end

puts "Total bank accounts: #{all_bank_accounts.length}"
```

## Advanced

### Additional Headers

If you would like to send additional headers as part of the request, use the `headers` request option.

```ruby
response = client.payments.create(..., {
  headers: {
    'X-Custom-Header' => 'custom value'
  }
})
```

### Receive Extra Properties

Every response includes any extra properties in the JSON response that were not specified in the type.
This can be useful for API features not present in the SDK yet.

You can receive and interact with the extra properties by accessing the raw response data:

```ruby
response = client.locations.create(...)

# Access the raw response data
location_data = response.data.to_h

# Then access the extra property by its name
undocumented_property = location_data['undocumentedProperty']
```

### Retries

The SDK is instrumented with automatic retries with exponential backoff. A request will be retried as long
as the request is deemed retriable and the number of retry attempts has not grown larger than the configured
retry limit (default: 2).

A request is deemed retriable when any of the following HTTP status codes is returned:

- [408](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/408) (Timeout)
- [429](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/429) (Too Many Requests)
- [5XX](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500) (Internal Server Errors)

Use the `max_retries` request option to configure this behavior.

```ruby
response = client.payments.create(..., {
  max_retries: 0 # override max_retries at the request level
})
```

### Timeouts

The SDK defaults to a 60 second timeout. Use the `timeout_in_seconds` option to configure this behavior.

```ruby
response = client.payments.create(..., {
  timeout_in_seconds: 30 # override timeout to 30s
})
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!