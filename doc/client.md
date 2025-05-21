
# Client Class Documentation

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| `square_version` | `String` | Square Connect API versions<br>*Default*: `'2025-05-21'` |
| `custom_url` | `String` | Sets the base URL requests are made to. Defaults to `https://connect.squareup.com`<br>*Default*: `'https://connect.squareup.com'` |
| `environment` | `string` | The API environment. <br> **Default: `production`** |
| `connection` | `Faraday::Connection` | The Faraday connection object passed by the SDK user for making requests |
| `adapter` | `Faraday::Adapter` | The Faraday adapter object passed by the SDK user for performing http requests |
| `timeout` | `Float` | The value to use for connection timeout. <br> **Default: 60** |
| `max_retries` | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| `retry_interval` | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| `backoff_factor` | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 2** |
| `retry_statuses` | `Array` | A list of HTTP statuses to retry. <br> **Default: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524]** |
| `retry_methods` | `Array` | A list of HTTP methods to retry. <br> **Default: %i[get put]** |
| `http_callback` | `HttpCallBack` | The Http CallBack allows defining callables for pre and post API calls. |
| `user_agent_detail` | `string` | User agent detail, to be appended with user-agent header. |
| `additional_headers` | `String` | Additional headers to add to each API request |
| `bearer_auth_credentials` | [`BearerAuthCredentials`](auth/oauth-2-bearer-token.md) | The credential object for OAuth 2 Bearer token |

The API client can be initialized as follows:

```ruby
client = Square::Client.new(
  square_version: '2025-05-21',
  bearer_auth_credentials: BearerAuthCredentials.new(
    access_token: 'AccessToken'
  ),
  environment: 'production',
  custom_url: 'https://connect.squareup.com'
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
  square_version: '2025-05-21',
  bearer_auth_credentials: BearerAuthCredentials.new(
    access_token: 'AccessToken'
  ),
  environment: 'production',
  custom_url: 'https://connect.squareup.com'
)

result = client.locations.list_locations

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
| v1_transactions | Gets V1TransactionsApi |
| apple_pay | Gets ApplePayApi |
| bank_accounts | Gets BankAccountsApi |
| bookings | Gets BookingsApi |
| booking_custom_attributes | Gets BookingCustomAttributesApi |
| cards | Gets CardsApi |
| cash_drawers | Gets CashDrawersApi |
| catalog | Gets CatalogApi |
| customers | Gets CustomersApi |
| customer_custom_attributes | Gets CustomerCustomAttributesApi |
| customer_groups | Gets CustomerGroupsApi |
| customer_segments | Gets CustomerSegmentsApi |
| devices | Gets DevicesApi |
| disputes | Gets DisputesApi |
| employees | Gets EmployeesApi |
| events | Gets EventsApi |
| gift_cards | Gets GiftCardsApi |
| gift_card_activities | Gets GiftCardActivitiesApi |
| inventory | Gets InventoryApi |
| invoices | Gets InvoicesApi |
| labor | Gets LaborApi |
| locations | Gets LocationsApi |
| location_custom_attributes | Gets LocationCustomAttributesApi |
| checkout | Gets CheckoutApi |
| transactions | Gets TransactionsApi |
| loyalty | Gets LoyaltyApi |
| merchants | Gets MerchantsApi |
| merchant_custom_attributes | Gets MerchantCustomAttributesApi |
| orders | Gets OrdersApi |
| order_custom_attributes | Gets OrderCustomAttributesApi |
| payments | Gets PaymentsApi |
| payouts | Gets PayoutsApi |
| refunds | Gets RefundsApi |
| sites | Gets SitesApi |
| snippets | Gets SnippetsApi |
| subscriptions | Gets SubscriptionsApi |
| team | Gets TeamApi |
| terminal | Gets TerminalApi |
| vendors | Gets VendorsApi |
| webhook_subscriptions | Gets WebhookSubscriptionsApi |

