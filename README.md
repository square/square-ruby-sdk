# Square Ruby Library

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2Fsquare%2Fsquare-ruby-sdk)
[![Gem version](https://badge.fury.io/rb/square.rb.svg?new)](https://badge.fury.io/rb/square.rb)

The Square Ruby library provides convenient access to the Square API from Ruby.

## Requirements

Use of the Square Ruby SDK requires:

* Ruby 3.3+

## Installation

The Square Ruby SDK version is managed through the gem version. To use a specific version:

```bash
gem install square.rb
```

Or in your Gemfile:
```ruby
gem 'square.rb', '~> 48.0'
```

### Upgrading to 48.0

Version 48.0 contains the following behavior changes:

* **Plain `http://` base URLs are rejected.** The SDK raises `ArgumentError` for any non-HTTPS `base_url`
  except `localhost`, `127.0.0.1` and `[::1]`, because credentials would otherwise be sent in plaintext.
  If you route requests through a proxy or gateway, give it an HTTPS URL.
* **Connection failures raise `Square::Errors::ConnectionError`.** Failed connections, DNS lookups and TLS
  handshakes no longer leak `Errno::ECONNREFUSED`, `Errno::ECONNRESET`, `SocketError` or
  `OpenSSL::SSL::SSLError`; the original exception is available as `cause`. `Errno::ETIMEDOUT` now raises
  `Square::Errors::TimeoutError`. Rescue these classes instead of the raw ones (see [Errors](#errors)).
* **Decimal fields are `Float`.** `Coordinates#latitude`, `Coordinates#longitude` and
  `V1Order#btc_price_satoshi` were `Integer`, which dropped the fractional part.
* **Unset fields are not sent.** Sparse updates such as `orders.update(order: {})` no longer send `null`
  for fields you did not set (see [Sparse Updates](#sparse-updates)).
* **Pagination** now returns an iterator that can be looped over more than once (see [Pagination](#pagination)).

## Usage

For more information, see [Using the Square Ruby SDK](https://developer.squareup.com/docs/sdks/ruby/using-ruby-sdk).

```ruby
require "square"

square = Square::Client.new(
  token: 'YOUR_API_KEY'
)

image_file = Square::FileParam.from_filepath(
  filepath: fixture_path("small.png"),
  content_type: "image/png"
)

response = square.invoices.create_invoice_attachment(
  invoice_id: "inv:0-ChA4-3sU9GPd-uOC3HgvFjMWEL4N",
  request: {
    idempotency_key: SecureRandom.uuid,
    description: "A test invoice attachment"
  },
  image_file: image_file
)
```

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

## Environments

This SDK allows you to configure different environments or custom URLs for API requests. You can either use the predefined environments or specify your own custom URL.

### Environments
```ruby
require "square"

client = Square::Client.new(
    base_url: Square::Environment::PRODUCTION
)
```

### Custom URL
```ruby
require "square"

client = Square::Client.new(
    base_url: "https://custom-staging.com"
)
```

Custom URLs must use HTTPS. Plain `http://` is only accepted for `localhost`, `127.0.0.1` and `[::1]`.

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

## Errors

Failed API calls will raise errors that can be rescued from granularly.

```ruby
require "square"

client = Square::Client.new(
  base_url: Square::Environment::PRODUCTION
)

begin
    result = client.payments.create
rescue Square::Errors::TimeoutError
    puts "API didn't respond before our timeout elapsed"
rescue Square::Errors::ConnectionError => e
    puts "Could not connect to the API: #{e.cause&.message}"
rescue Square::Errors::ServiceUnavailableError
    puts "API returned status 503, is probably overloaded, try again later"
rescue Square::Errors::ServerError
    puts "API returned some other 5xx status, this is probably a bug"
rescue Square::Errors::ResponseError => e
    puts "API returned an unexpected status other than 5xx: #{e.code} #{e.message}"
rescue Square::Errors::ApiError => e
    puts "Some other error occurred when calling the API: #{e.message}"
end
```

## Pagination

List and search endpoints return an iterator. Looping over it yields individual items and fetches further
pages as needed:

```ruby
require 'square'

client = Square::Client.new(token: "YOUR_TOKEN")

client.bank_accounts.list.each do |bank_account|
  puts bank_account.id
end
```

Use `pages` to work with whole pages instead of items:

```ruby
client.bank_accounts.list.pages.each do |page|
  puts "Got #{page.bank_accounts.length} bank accounts"
end
```

Every loop starts again from the first page, and loops (and `pages`) do not share a position, so you can
iterate a result more than once or nest loops. To step through items manually, use `next_element` and
`next?`; call `rewind` to go back to the start.

The request for the first page is sent when you first read from the iterator. To send it immediately, so
that an API error is raised at the call site, use `load_first_page`:

```ruby
items = client.bank_accounts.list.load_first_page
```

After a request, `http_response` returns the raw `Net::HTTPResponse` of the most recent page request.

## Advanced

### Additional Headers

If you would like to send additional headers as part of the request, use the `additional_headers` request option.

```ruby
response = client.payments.create(
  ...,
  request_options: {
    additional_headers: {
      'X-Custom-Header' => 'custom value'
    }
  }
)
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
- [500](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/500), [502](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/502), [503](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/503), [504](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/504) (Server Errors)
- 521, 522 and 524 (Cloudflare origin errors)

Connection failures (`Square::Errors::ConnectionError`) are not retried.

Use the `max_retries` client option to configure this behavior.

```ruby
client = Square::Client.new(
  token: "YOUR_TOKEN",
  max_retries: 0 # disable retries
)
```

### Timeouts

The SDK defaults to a 60 second timeout. Use the `timeout` client option to change it for every request, or
the `timeout_in_seconds` request option to override it for a single request.

```ruby
client = Square::Client.new(
  token: "YOUR_TOKEN",
  timeout: 30 # 30s for every request
)

response = client.payments.create(
  ...,
  request_options: {
    timeout_in_seconds: 10 # override to 10s for this request
  }
)
```

### Sparse Updates

Fields you do not set are left out of the request body, so partial updates only send what you provide.
A field you set to `nil` is still sent as `null`.

```ruby
client.orders.update(order_id: order.id, idempotency_key: SecureRandom.uuid, order: {})
# => {"order":{},"idempotency_key":"..."}

client.orders.update(order_id: order.id, idempotency_key: SecureRandom.uuid, order: { reference_id: nil })
# => {"order":{"reference_id":null},"idempotency_key":"..."}
```

### Times

`Time` values, including `ActiveSupport::TimeWithZone`, are sent as RFC 3339 strings with millisecond
precision in request bodies and query parameters (for example `begin_time`).

## Webhook Signature Verification

The SDK ships a `.fernignore`-protected helper that verifies webhook signatures, so you can
confirm that a webhook event came from Square. Require it explicitly, then pass the raw request
body exactly as received:

```ruby
require "square"
require "square/webhooks_helper"

is_valid = Square::WebhooksHelper.verify_signature(
  request_body: request.raw_post,
  signature_header: request.headers["x-square-hmacsha256-signature"],
  signature_key: ENV.fetch("SQUARE_WEBHOOK_SIGNATURE_KEY"),
  notification_url: "https://example.com/webhooks/square" # The URL where event notifications are sent.
)
```

`verify_signature` returns `false` when the signature doesn't match, and raises `ArgumentError`
if `signature_key` or `notification_url` is empty. It replaces
`SquareLegacy::WebhooksHelper.is_valid_webhook_event_signature`, so you no longer need to require
`square_legacy` to verify webhooks.

## Reporting API

The [Reporting API](https://developer.squareup.com/docs/reporting-api/overview) exposes two
polling endpoints under `client.reporting`:

- `get_metadata` — describes the data you can query (cubes, measures, dimensions, segments).
  Call it first to discover the schema.
- `load` — runs a reporting query and returns the aggregated result rows in `data`.

`load` is asynchronous: while a query is still being computed it returns an HTTP 200 whose body
is `{ "error": "Continue wait" }` rather than the results. Callers are expected to re-send the
identical request, with backoff, until real results arrive.

The SDK ships a `.fernignore`-protected helper that owns that retry loop. Require it explicitly
to add `load_and_wait` to `client.reporting`:

```ruby
require "square"
require "square/reporting_helper"

client = Square::Client.new(token: ENV.fetch("SQUARE_TOKEN"))

# 1. Discover the schema.
metadata = client.reporting.get_metadata

# 2. Run a query and transparently poll until it resolves.
response = client.reporting.load_and_wait(
  query: {
    measures: ["orders.count"],
    time_dimensions: [{ dimension: "orders.created_at", granularity: "day" }]
  }
)

response.data.each { |row| puts row }
```

`load_and_wait` accepts optional polling parameters (defaults shown): `max_attempts: 20`,
`initial_delay: 2.0`, `max_delay: 20.0`, `backoff_factor: 2.0` (seconds). It raises
`Square::Reporting::ContinueWaitTimeoutError` if the query has not resolved within
`max_attempts`. Pass a `should_cancel` predicate to abort the loop early (the Ruby idiom for an
abort signal); it raises `Square::Reporting::PollingCancelledError` when the predicate returns a
truthy value:

```ruby
deadline = Time.now + 60
response = client.reporting.load_and_wait(
  query: { measures: ["orders.count"] },
  should_cancel: -> { Time.now > deadline }
)
```

> **Note:** The Reporting API is production-only — sandbox requests return 404, and a sandbox
> token against production returns 401. Use a production, reporting-provisioned token.

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically. Additions made directly to this library would have to be moved over to our generation code, otherwise they would be overwritten upon the next generated release. Feel free to open a PR as a proof of concept, but know that we will not be able to merge it as-is. We suggest opening an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
