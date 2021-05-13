
# Client Class Documentation

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| `square_version` | `String` | Square Connect API versions<br>*Default*: `'2021-05-13'` |
| `access_token` | `String` | The OAuth 2.0 Access Token to use for API requests. |
| `custom_url` | `String` | Sets the base URL requests are made to. Defaults to `https://connect.squareup.com`<br>*Default*: `'https://connect.squareup.com'` |
| `environment` | `string` | The API environment. <br> **Default: `production`** |
| `timeout` | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| `max_retries` | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| `retry_interval` | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| `backoff_factor` | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 1** |
| `additional_headers` | `String` | Additional headers to add to each API request |

The API client can be initialized as follows:

```ruby
client = Square::Client.new(
  square_version: '2021-05-13',
  access_token: 'AccessToken',
  environment: 'production',
  custom_url: 'https://connect.squareup.com',
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

include Square

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

## Square Client

The gateway for the SDK. This class acts as a factory for the Apis and also holds the configuration of the SDK.

## API

| Name | Description |
|  --- | --- |
| mobile_authorization | Gets MobileAuthorizationApi |
| o_auth | Gets OAuthApi |
| v1_employees | Gets V1EmployeesApi |
| v1_transactions | Gets V1TransactionsApi |
| apple_pay | Gets ApplePayApi |
| bank_accounts | Gets BankAccountsApi |
| bookings | Gets BookingsApi |
| cash_drawers | Gets CashDrawersApi |
| catalog | Gets CatalogApi |
| customers | Gets CustomersApi |
| customer_groups | Gets CustomerGroupsApi |
| customer_segments | Gets CustomerSegmentsApi |
| devices | Gets DevicesApi |
| disputes | Gets DisputesApi |
| employees | Gets EmployeesApi |
| inventory | Gets InventoryApi |
| invoices | Gets InvoicesApi |
| labor | Gets LaborApi |
| locations | Gets LocationsApi |
| checkout | Gets CheckoutApi |
| transactions | Gets TransactionsApi |
| loyalty | Gets LoyaltyApi |
| merchants | Gets MerchantsApi |
| orders | Gets OrdersApi |
| payments | Gets PaymentsApi |
| refunds | Gets RefundsApi |
| sites | Gets SitesApi |
| snippets | Gets SnippetsApi |
| subscriptions | Gets SubscriptionsApi |
| team | Gets TeamApi |
| terminal | Gets TerminalApi |

