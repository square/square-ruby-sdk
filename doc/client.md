
# Client Class Documentation

The following parameters are configurable for the API Client.

| Parameter | Type | Description |
|  --- | --- | --- |
| `square_version` | `String` | Square Connect API versions<br>*Default*: `'2020-10-28'` |
| `access_token` | `String` | OAuth 2.0 Access Token |
| `environment` | `string` | The API environment. <br> **Default: `production`** |
| `access_token` | `String` | OAuth 2.0 Access Token |
| `timeout` | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| `max_retries` | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| `retry_interval` | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| `backoff_factor` | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 1** |
| `additional_headers` | `String` | Additional headers to add to each API request |

The API client can be initialized as following.

```ruby
client = Square::Client.new(
  square_version: '2020-10-28',
  access_token: 'AccessToken',
  environment: 'production',
)
```

API calls return an `ApiResponse` object that includes the following fields:

| Field | Description |
|  --- | --- |
| `status_code` | Status code of the HTTP response |
| `reason_phrase` | Reason phrase of the HTTP response |
| `headers` | Headers of the HTTP response as a Hash |
| `raw_body` | The body of the HTTP response as a String |
| `request` | HTTP request info |
| `errors` | Errors, if they exist |
| `cursor` | Cursor, if it exists |
| `body` | The deserialized body of the HTTP response |
| `data` | Data portion of returned body |

## Make Calls with the API Client

```ruby
require 'square'

client = Square::Client.new(
  access_token: 'AccessToken',
)

locations_api = client.locations
result = locations_api.list_locations()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## SquareClient

Gateway for the SDK. This class acts as a factory for api and also holds the configuration of the SDK.

## Api

| Name | Description |
|  --- | --- |
| mobile_authorization | Provides access to MobileAuthorizationApi |
| o_auth | Provides access to OAuthApi |
| v1_locations | Provides access to V1LocationsApi |
| v1_employees | Provides access to V1EmployeesApi |
| v1_transactions | Provides access to V1TransactionsApi |
| v1_items | Provides access to V1ItemsApi |
| apple_pay | Provides access to ApplePayApi |
| bank_accounts | Provides access to BankAccountsApi |
| cash_drawers | Provides access to CashDrawersApi |
| catalog | Provides access to CatalogApi |
| customers | Provides access to CustomersApi |
| customer_groups | Provides access to CustomerGroupsApi |
| customer_segments | Provides access to CustomerSegmentsApi |
| devices | Provides access to DevicesApi |
| disputes | Provides access to DisputesApi |
| employees | Provides access to EmployeesApi |
| inventory | Provides access to InventoryApi |
| invoices | Provides access to InvoicesApi |
| labor | Provides access to LaborApi |
| locations | Provides access to LocationsApi |
| checkout | Provides access to CheckoutApi |
| transactions | Provides access to TransactionsApi |
| loyalty | Provides access to LoyaltyApi |
| merchants | Provides access to MerchantsApi |
| orders | Provides access to OrdersApi |
| payments | Provides access to PaymentsApi |
| refunds | Provides access to RefundsApi |
| subscriptions | Provides access to SubscriptionsApi |
| team | Provides access to TeamApi |
| terminal | Provides access to TerminalApi |

