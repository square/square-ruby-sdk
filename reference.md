# Reference
## Mobile
<details><summary><code>client.Mobile.AuthorizationCode(request) -> Square::Types::CreateMobileAuthorizationCodeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

__Note:__ This endpoint is used by the deprecated Reader SDK. 
Developers should update their integration to use the [Mobile Payments SDK](https://developer.squareup.com/docs/mobile-payments-sdk), which includes its own authorization methods. 

Generates code to authorize a mobile application to connect to a Square card reader.

Authorization codes are one-time-use codes and expire 60 minutes after being issued.

The `Authorization` header you provide to this endpoint must have the following format:

```
Authorization: Bearer ACCESS_TOKEN
```

Replace `ACCESS_TOKEN` with a
[valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.mobile.authorization_code({
  locationId:'YOUR_LOCATION_ID'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The Square location ID that the authorization code should be tied to.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## OAuth
<details><summary><code>client.OAuth.RevokeToken(request) -> Square::Types::RevokeTokenResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Revokes an access token generated with the OAuth flow.

If an account has more than one OAuth access token for your application, this
endpoint revokes all of them, regardless of which token you specify. 

__Important:__ The `Authorization` header for this endpoint must have the
following format:

```
Authorization: Client APPLICATION_SECRET
```

Replace `APPLICATION_SECRET` with the application secret on the **OAuth**
page for your application in the Developer Dashboard.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.revoke_token({
  clientId:'CLIENT_ID',
  accessToken:'ACCESS_TOKEN'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**clientId:** `String` 

The Square-issued ID for your application, which is available on the **OAuth** page in the
[Developer Dashboard](https://developer.squareup.com/apps).
    
</dd>
</dl>

<dl>
<dd>

**accessToken:** `String` 

The access token of the merchant whose token you want to revoke.
Do not provide a value for `merchant_id` if you provide this parameter.
    
</dd>
</dl>

<dl>
<dd>

**merchantId:** `String` 

The ID of the merchant whose token you want to revoke.
Do not provide a value for `access_token` if you provide this parameter.
    
</dd>
</dl>

<dl>
<dd>

**revokeOnlyAccessToken:** `Internal::Types::Boolean` 

If `true`, terminate the given single access token, but do not
terminate the entire authorization.
Default: `false`
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.OAuth.ObtainToken(request) -> Square::Types::ObtainTokenResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns an OAuth access token and refresh token using the `authorization_code`
or `refresh_token` grant type.

When `grant_type` is `authorization_code`:
- With the [code flow](https://developer.squareup.com/docs/oauth-api/overview#code-flow),
provide `code`, `client_id`, and `client_secret`.
- With the [PKCE flow](https://developer.squareup.com/docs/oauth-api/overview#pkce-flow),
provide `code`, `client_id`, and `code_verifier`. 

When `grant_type` is `refresh_token`:
- With the code flow, provide `refresh_token`, `client_id`, and `client_secret`.
The response returns the same refresh token provided in the request.
- With the PKCE flow, provide `refresh_token` and `client_id`. The response returns
a new refresh token.

You can use the `scopes` parameter to limit the set of permissions authorized by the
access token. You can use the `short_lived` parameter to create an access token that
expires in 24 hours.

__Important:__ OAuth tokens should be encrypted and stored on a secure server.
Application clients should never interact directly with OAuth tokens.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.obtain_token({
  clientId:'sq0idp-uaPHILoPzWZk3tlJqlML0g',
  clientSecret:'sq0csp-30a-4C_tVOnTh14Piza2BfTPBXyLafLPWSzY1qAjeBfM',
  code:'sq0cgb-l0SBqxs4uwxErTVyYOdemg',
  grantType:'authorization_code'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**clientId:** `String` 

The Square-issued ID of your application, which is available as the **Application ID**
on the **OAuth** page in the [Developer Console](https://developer.squareup.com/apps).

Required for the code flow and PKCE flow for any grant type.
    
</dd>
</dl>

<dl>
<dd>

**clientSecret:** `String` 

The secret key for your application, which is available as the **Application secret**
on the **OAuth** page in the [Developer Console](https://developer.squareup.com/apps).

Required for the code flow for any grant type. Don't confuse your client secret with your
personal access token.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` 

The authorization code to exchange for an OAuth access token. This is the `code`
value that Square sent to your redirect URL in the authorization response.

Required for the code flow and PKCE flow if `grant_type` is `authorization_code`.
    
</dd>
</dl>

<dl>
<dd>

**redirectUri:** `String` 

The redirect URL for your application, which you registered as the **Redirect URL**
on the **OAuth** page in the [Developer Console](https://developer.squareup.com/apps).

Required for the code flow and PKCE flow if `grant_type` is `authorization_code` and
you provided the `redirect_uri` parameter in your authorization URL.
    
</dd>
</dl>

<dl>
<dd>

**grantType:** `String` 

The method used to obtain an OAuth access token. The request must include the
credential that corresponds to the specified grant type. Valid values are:
- `authorization_code` - Requires the `code` field.
- `refresh_token` - Requires the `refresh_token` field.
- `migration_token` - LEGACY for access tokens obtained using a Square API version prior
to 2019-03-13. Requires the `migration_token` field.
    
</dd>
</dl>

<dl>
<dd>

**refreshToken:** `String` 

A valid refresh token used to generate a new OAuth access token. This is a
refresh token that was returned in a previous `ObtainToken` response.

Required for the code flow and PKCE flow if `grant_type` is `refresh_token`.
    
</dd>
</dl>

<dl>
<dd>

**migrationToken:** `String` 

__LEGACY__ A valid access token (obtained using a Square API version prior to 2019-03-13)
used to generate a new OAuth access token.

Required if `grant_type` is `migration_token`. For more information, see
[Migrate to Using Refresh Tokens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-tokens).
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `Internal::Types::Array[String]` 

The list of permissions that are explicitly requested for the access token.
For example, ["MERCHANT_PROFILE_READ","PAYMENTS_READ","BANK_ACCOUNTS_READ"].

The returned access token is limited to the permissions that are the intersection
of these requested permissions and those authorized by the provided `refresh_token`.

Optional for the code flow and PKCE flow if `grant_type` is `refresh_token`.
    
</dd>
</dl>

<dl>
<dd>

**shortLived:** `Internal::Types::Boolean` 

Indicates whether the returned access token should expire in 24 hours.

Optional for the code flow and PKCE flow for any grant type. The default value is `false`.
    
</dd>
</dl>

<dl>
<dd>

**codeVerifier:** `String` 

The secret your application generated for the authorization request used to
obtain the authorization code. This is the source of the `code_challenge` hash you
provided in your authorization URL.

Required for the PKCE flow if `grant_type` is `authorization_code`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.OAuth.RetrieveTokenStatus() -> Square::Types::RetrieveTokenStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns information about an [OAuth access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token) or an application’s [personal access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).

Add the access token to the Authorization header of the request.

__Important:__ The `Authorization` header you provide to this endpoint must have the following format:

```
Authorization: Bearer ACCESS_TOKEN
```

where `ACCESS_TOKEN` is a
[valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).

If the access token is expired or not a valid access token, the endpoint returns an `UNAUTHORIZED` error.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.retrieve_token_status();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.OAuth.Authorize() -> </code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.o_auth.authorize();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## V1Transactions
<details><summary><code>client.V1Transactions.V1ListOrders(LocationId) -> Internal::Types::Array[Square::Types::V1Order]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides summary information for a merchant's online store orders.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.v_1_transactions.v_1_list_orders({
  locationId:'location_id',
  limit:1,
  batchToken:'batch_token'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location to list online store orders for.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Square::Types::SortOrder` — The order in which payments are listed in the response.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of payments to return in a single response. This value cannot exceed 200.
    
</dd>
</dl>

<dl>
<dd>

**batchToken:** `String` 

A pagination cursor to retrieve the next set of results for your
original query to the endpoint.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.V1Transactions.V1RetrieveOrder(LocationId, OrderId) -> Square::Types::V1Order</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides comprehensive information for a single online store order, including the order's history.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.v_1_transactions.v_1_retrieve_order({
  locationId:'location_id',
  orderId:'order_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the order's associated location.
    
</dd>
</dl>

<dl>
<dd>

**orderId:** `String` — The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.V1Transactions.V1UpdateOrder(LocationId, OrderId, request) -> Square::Types::V1Order</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.v_1_transactions.v_1_update_order({
  locationId:'location_id',
  orderId:'order_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the order's associated location.
    
</dd>
</dl>

<dl>
<dd>

**orderId:** `String` — The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint
    
</dd>
</dl>

<dl>
<dd>

**action:** `Square::Types::V1UpdateOrderRequestAction` 

The action to perform on the order (COMPLETE, CANCEL, or REFUND).
See [V1UpdateOrderRequestAction](#type-v1updateorderrequestaction) for possible values
    
</dd>
</dl>

<dl>
<dd>

**shippedTrackingNumber:** `String` — The tracking number of the shipment associated with the order. Only valid if action is COMPLETE.
    
</dd>
</dl>

<dl>
<dd>

**completedNote:** `String` — A merchant-specified note about the completion of the order. Only valid if action is COMPLETE.
    
</dd>
</dl>

<dl>
<dd>

**refundedNote:** `String` — A merchant-specified note about the refunding of the order. Only valid if action is REFUND.
    
</dd>
</dl>

<dl>
<dd>

**canceledNote:** `String` — A merchant-specified note about the canceling of the order. Only valid if action is CANCEL.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ApplePay
<details><summary><code>client.ApplePay.RegisterDomain(request) -> Square::Types::RegisterDomainResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Activates a domain for use with Apple Pay on the Web and Square. A validation
is performed on this domain by Apple to ensure that it is properly set up as
an Apple Pay enabled domain.

This endpoint provides an easy way for platform developers to bulk activate
Apple Pay on the Web with Square for merchants using their platform.

Note: You will need to host a valid domain verification file on your domain to support Apple Pay.  The
current version of this file is always available at https://app.squareup.com/digital-wallets/apple-pay/apple-developer-merchantid-domain-association,
and should be hosted at `.well_known/apple-developer-merchantid-domain-association` on your
domain.  This file is subject to change; we strongly recommend checking for updates regularly and avoiding
long-lived caches that might not keep in sync with the correct file version.

To learn more about the Web Payments SDK and how to add Apple Pay, see [Take an Apple Pay Payment](https://developer.squareup.com/docs/web-payments/apple-pay).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.apple_pay.register_domain({
  domainName:'example.com'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**domainName:** `String` — A domain name as described in RFC-1034 that will be registered with ApplePay.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## BankAccounts
<details><summary><code>client.BankAccounts.List() -> Square::Types::ListBankAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of [BankAccount](entity:BankAccount) objects linked to a Square account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_accounts.list({
  cursor:'cursor',
  limit:1,
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

The pagination cursor returned by a previous call to this endpoint.
Use it in the next `ListBankAccounts` request to retrieve the next set 
of results.

See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

Upper limit on the number of bank accounts to return in the response. 
Currently, 1000 is the largest supported limit. You can specify a limit 
of up to 1000 bank accounts. This is also the default limit.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

Location ID. You can specify this optional filter 
to retrieve only the linked bank accounts belonging to a specific location.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.BankAccounts.GetByV1Id(V1BankAccountId) -> Square::Types::GetBankAccountByV1IdResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns details of a [BankAccount](entity:BankAccount) identified by V1 bank account ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_accounts.get_by_v_1_id({
  v1BankAccountId:'v1_bank_account_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**v1BankAccountId:** `String` 

Connect V1 ID of the desired `BankAccount`. For more information, see 
[Retrieve a bank account by using an ID issued by V1 Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.BankAccounts.Get(BankAccountId) -> Square::Types::GetBankAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns details of a [BankAccount](entity:BankAccount)
linked to a Square account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bank_accounts.get({
  bankAccountId:'bank_account_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bankAccountId:** `String` — Square-issued ID of the desired `BankAccount`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bookings
<details><summary><code>client.Bookings.List() -> Square::Types::ListBookingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a collection of bookings.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.list({
  limit:1,
  cursor:'cursor',
  customerId:'customer_id',
  teamMemberId:'team_member_id',
  locationId:'location_id',
  startAtMin:'start_at_min',
  startAtMax:'start_at_max'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results per page to return in a paged response.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The pagination cursor from the preceding response to return the next page of the results. Do not set this when retrieving the first page of the results.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — The [customer](entity:Customer) for whom to retrieve bookings. If this is not set, bookings for all customers are retrieved.
    
</dd>
</dl>

<dl>
<dd>

**teamMemberId:** `String` — The team member for whom to retrieve bookings. If this is not set, bookings of all members are retrieved.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The location for which to retrieve bookings. If this is not set, all locations' bookings are retrieved.
    
</dd>
</dl>

<dl>
<dd>

**startAtMin:** `String` — The RFC 3339 timestamp specifying the earliest of the start time. If this is not set, the current time is used.
    
</dd>
</dl>

<dl>
<dd>

**startAtMax:** `String` — The RFC 3339 timestamp specifying the latest of the start time. If this is not set, the time of 31 days after `start_at_min` is used.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.Create(request) -> Square::Types::CreateBookingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a booking.

The required input must include the following:
- `Booking.location_id`
- `Booking.start_at`
- `Booking.AppointmentSegment.team_member_id`
- `Booking.AppointmentSegment.service_variation_id`
- `Booking.AppointmentSegment.service_variation_version`

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.create({
  booking:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — A unique key to make this request an idempotent operation.
    
</dd>
</dl>

<dl>
<dd>

**booking:** `Square::Types::Booking` — The details of the booking to be created.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.SearchAvailability(request) -> Square::Types::SearchAvailabilityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for availabilities for booking.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.search_availability({
  query:{
    filter:{
      start_at_range:{}
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::SearchAvailabilityQuery` — Query conditions used to filter buyer-accessible booking availabilities.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.BulkRetrieveBookings(request) -> Square::Types::BulkRetrieveBookingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Bulk-Retrieves a list of bookings by booking IDs.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.bulk_retrieve_bookings({
  bookingIds:['booking_ids']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingIds:** `Internal::Types::Array[String]` — A non-empty list of [Booking](entity:Booking) IDs specifying bookings to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.GetBusinessProfile() -> Square::Types::GetBusinessBookingProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a seller's booking profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.get_business_profile();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.RetrieveLocationBookingProfile(LocationId) -> Square::Types::RetrieveLocationBookingProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a seller's location booking profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.retrieve_location_booking_profile({
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location to retrieve the booking profile.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.BulkRetrieveTeamMemberBookingProfiles(request) -> Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves one or more team members' booking profiles.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.bulk_retrieve_team_member_booking_profiles({
  teamMemberIds:['team_member_ids']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberIds:** `Internal::Types::Array[String]` — A non-empty list of IDs of team members whose booking profiles you want to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.Get(BookingId) -> Square::Types::GetBookingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a booking.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.get({
  bookingId:'booking_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the [Booking](entity:Booking) object representing the to-be-retrieved booking.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.Update(BookingId, request) -> Square::Types::UpdateBookingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a booking.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.update({
  bookingId:'booking_id',
  booking:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the [Booking](entity:Booking) object representing the to-be-updated booking.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — A unique key to make this request an idempotent operation.
    
</dd>
</dl>

<dl>
<dd>

**booking:** `Square::Types::Booking` — The booking to be updated. Individual attributes explicitly specified here override the corresponding values of the existing booking.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.Cancel(BookingId, request) -> Square::Types::CancelBookingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels an existing booking.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.cancel({
  bookingId:'booking_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the [Booking](entity:Booking) object representing the to-be-cancelled booking.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — A unique key to make this request an idempotent operation.
    
</dd>
</dl>

<dl>
<dd>

**bookingVersion:** `Integer` — The revision number for the booking used for optimistic concurrency.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Cards
<details><summary><code>client.Cards.List() -> Square::Types::ListCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of cards owned by the account making the request.
A max of 25 cards will be returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cards.list({
  cursor:'cursor',
  customerId:'customer_id',
  includeDisabled:true,
  referenceId:'reference_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for your original query.

See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` 

Limit results to cards associated with the customer supplied.
By default, all cards owned by the merchant are returned.
    
</dd>
</dl>

<dl>
<dd>

**includeDisabled:** `Internal::Types::Boolean` 

Includes disabled cards.
By default, all enabled cards owned by the merchant are returned.
    
</dd>
</dl>

<dl>
<dd>

**referenceId:** `String` — Limit results to cards associated with the reference_id supplied.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

Sorts the returned list by when the card was created with the specified order.
This field defaults to ASC.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cards.Create(request) -> Square::Types::CreateCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a card on file to an existing merchant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cards.create({
  idempotencyKey:'4935a656-a929-4792-b97c-8848be85c27c',
  sourceId:'cnon:uIbfJXhXETSP197M3GB',
  card:{
    cardholder_name:'Amelia Earhart',
    billing_address:{
      address_line_1:'500 Electric Ave',
      address_line_2:'Suite 600',
      locality:'New York',
      administrative_district_level_1:'NY',
      postal_code:'10003'
    },
    customer_id:'VDKXEEKPJN48QDG3BGGFAK05P8',
    reference_id:'user-id-1'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this CreateCard request. Keys can be
any valid string and must be unique for every request.

Max: 45 characters

See [Idempotency keys](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more information.
    
</dd>
</dl>

<dl>
<dd>

**sourceId:** `String` — The ID of the source which represents the card information to be stored. This can be a card nonce or a payment id.
    
</dd>
</dl>

<dl>
<dd>

**verificationToken:** `String` 

An identifying token generated by [Payments.verifyBuyer()](https://developer.squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
Verification tokens encapsulate customer device information and 3-D Secure
challenge results to indicate that Square has verified the buyer identity.

See the [SCA Overview](https://developer.squareup.com/docs/sca-overview).
    
</dd>
</dl>

<dl>
<dd>

**card:** `Square::Types::Card` — Payment details associated with the card to be stored.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cards.Get(CardId) -> Square::Types::GetCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves details for a specific Card.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cards.get({
  cardId:'card_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cardId:** `String` — Unique ID for the desired Card.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Cards.Disable(CardId) -> Square::Types::DisableCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Disables the card, preventing any further updates or charges.
Disabling an already disabled card is allowed but has no effect.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cards.disable({
  cardId:'card_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cardId:** `String` — Unique ID for the desired Card.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Catalog
<details><summary><code>client.Catalog.BatchDelete(request) -> Square::Types::BatchDeleteCatalogObjectsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a set of [CatalogItem](entity:CatalogItem)s based on the
provided list of target IDs and returns a set of successfully deleted IDs in
the response. Deletion is a cascading event such that all children of the
targeted object are also deleted. For example, deleting a CatalogItem will
also delete all of its [CatalogItemVariation](entity:CatalogItemVariation)
children.

`BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted
IDs can be deleted. The response will only include IDs that were
actually deleted.

To ensure consistency, only one delete request is processed at a time per seller account.
While one (batch or non-batch) delete request is being processed, other (batched and non-batched)
delete requests are rejected with the `429` error code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.batch_delete({
  objectIds:['W62UWFY35CWMYGVWK6TWJDNI', 'AA27W3M2GGTF3H6AVPNB77CK']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**objectIds:** `Internal::Types::Array[String]` 

The IDs of the CatalogObjects to be deleted. When an object is deleted, other objects
in the graph that depend on that object will be deleted as well (for example, deleting a
CatalogItem will delete its CatalogItemVariation.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.BatchGet(request) -> Square::Types::BatchGetCatalogObjectsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a set of objects based on the provided ID.
Each [CatalogItem](entity:CatalogItem) returned in the set includes all of its
child information including: all of its
[CatalogItemVariation](entity:CatalogItemVariation) objects, references to
its [CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
any [CatalogTax](entity:CatalogTax) objects that apply to it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.batch_get({
  objectIds:['W62UWFY35CWMYGVWK6TWJDNI', 'AA27W3M2GGTF3H6AVPNB77CK'],
  includeRelatedObjects:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**objectIds:** `Internal::Types::Array[String]` — The IDs of the CatalogObjects to be retrieved.
    
</dd>
</dl>

<dl>
<dd>

**includeRelatedObjects:** `Internal::Types::Boolean` 

If `true`, the response will include additional objects that are related to the
requested objects. Related objects are defined as any objects referenced by ID by the results in the `objects` field
of the response. These objects are put in the `related_objects` field. Setting this to `true` is
helpful when the objects are needed for immediate display to a user.
This process only goes one level deep. Objects referenced by the related objects will not be included. For example,

if the `objects` field of the response contains a CatalogItem, its associated
CatalogCategory objects, CatalogTax objects, CatalogImage objects and
CatalogModifierLists will be returned in the `related_objects` field of the
response. If the `objects` field of the response contains a CatalogItemVariation,
its parent CatalogItem will be returned in the `related_objects` field of
the response.

Default value: `false`
    
</dd>
</dl>

<dl>
<dd>

**catalogVersion:** `Integer` 

The specific version of the catalog objects to be included in the response. 
This allows you to retrieve historical versions of objects. The specified version value is matched against
the [CatalogObject](entity:CatalogObject)s' `version` attribute. If not included, results will
be from the current version of the catalog.
    
</dd>
</dl>

<dl>
<dd>

**includeDeletedObjects:** `Internal::Types::Boolean` — Indicates whether to include (`true`) or not (`false`) in the response deleted objects, namely, those with the `is_deleted` attribute set to `true`.
    
</dd>
</dl>

<dl>
<dd>

**includeCategoryPathToRoot:** `Internal::Types::Boolean` 

Specifies whether or not to include the `path_to_root` list for each returned category instance. The `path_to_root` list consists
of `CategoryPathToRootNode` objects and specifies the path that starts with the immediate parent category of the returned category
and ends with its root category. If the returned category is a top-level category, the `path_to_root` list is empty and is not returned
in the response payload.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.BatchUpsert(request) -> Square::Types::BatchUpsertCatalogObjectsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates up to 10,000 target objects based on the provided
list of objects. The target objects are grouped into batches and each batch is
inserted/updated in an all-or-nothing manner. If an object within a batch is
malformed in some way, or violates a database constraint, the entire batch
containing that item will be disregarded. However, other batches in the same
request may still succeed. Each batch may contain up to 1,000 objects, and
batches will be processed in order as long as the total object count for the
request (items, variations, modifier lists, discounts, and taxes) is no more
than 10,000.

To ensure consistency, only one update request is processed at a time per seller account.
While one (batch or non-batch) update request is being processed, other (batched and non-batched)
update requests are rejected with the `429` error code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.batch_upsert({
  idempotencyKey:'789ff020-f723-43a9-b4b5-43b5dc1fa3dc',
  batches:[{
    objects:[]
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A value you specify that uniquely identifies this
request among all your requests. A common way to create
a valid idempotency key is to use a Universally unique
identifier (UUID).

If you're unsure whether a particular request was successful,
you can reattempt it with the same idempotency key without
worrying about creating duplicate objects.

See [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more information.
    
</dd>
</dl>

<dl>
<dd>

**batches:** `Internal::Types::Array[Square::Types::CatalogObjectBatch]` 

A batch of CatalogObjects to be inserted/updated atomically.
The objects within a batch will be inserted in an all-or-nothing fashion, i.e., if an error occurs
attempting to insert or update an object within a batch, the entire batch will be rejected. However, an error
in one batch will not affect other batches within the same request.

For each object, its `updated_at` field is ignored and replaced with a current [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), and its
`is_deleted` field must not be set to `true`.

To modify an existing object, supply its ID. To create a new object, use an ID starting
with `#`. These IDs may be used to create relationships between an object and attributes of
other objects that reference it. For example, you can create a CatalogItem with
ID `#ABC` and a CatalogItemVariation with its `item_id` attribute set to
`#ABC` in order to associate the CatalogItemVariation with its parent
CatalogItem.

Any `#`-prefixed IDs are valid only within a single atomic batch, and will be replaced by server-generated IDs.

Each batch may contain up to 1,000 objects. The total number of objects across all batches for a single request
may not exceed 10,000. If either of these limits is violated, an error will be returned and no objects will
be inserted or updated.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.Info() -> Square::Types::CatalogInfoResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves information about the Square Catalog API, such as batch size
limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.info();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.List() -> Square::Types::ListCatalogResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of all [CatalogObject](entity:CatalogObject)s of the specified types in the catalog.

The `types` parameter is specified as a comma-separated list of the [CatalogObjectType](entity:CatalogObjectType) values,
for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".

__Important:__ ListCatalog does not return deleted catalog items. To retrieve
deleted catalog items, use [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
and set the `include_deleted_objects` attribute value to `true`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.list({
  cursor:'cursor',
  types:'types',
  catalogVersion:1000000
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

The pagination cursor returned in the previous response. Leave unset for an initial request.
The page size is currently set to be 100.
See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
    
</dd>
</dl>

<dl>
<dd>

**types:** `String` 

An optional case-insensitive, comma-separated list of object types to retrieve.

The valid values are defined in the [CatalogObjectType](entity:CatalogObjectType) enum, for example,
`ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,
`MODIFIER`, `MODIFIER_LIST`, `IMAGE`, etc.

If this is unspecified, the operation returns objects of all the top level types at the version
of the Square API used to make the request. Object types that are nested onto other object types
are not included in the defaults.

At the current API version the default object types are:
ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST, 
PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION, QUICK_AMOUNT_SETTINGS.
    
</dd>
</dl>

<dl>
<dd>

**catalogVersion:** `Integer` 

The specific version of the catalog objects to be included in the response.
This allows you to retrieve historical versions of objects. The specified version value is matched against
the [CatalogObject](entity:CatalogObject)s' `version` attribute.  If not included, results will be from the
current version of the catalog.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.Search(request) -> Square::Types::SearchCatalogObjectsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for [CatalogObject](entity:CatalogObject) of any type by matching supported search attribute values,
excluding custom attribute values on items or item variations, against one or more of the specified query filters.

This (`SearchCatalogObjects`) endpoint differs from the [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems)
endpoint in the following aspects:

- `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects.
- `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not.
- `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does.
- The both endpoints have different call conventions, including the query filter formats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.search({
  objectTypes:[],
  query:{
    prefix_query:{
      attribute_name:'name',
      attribute_prefix:'tea'
    }
  },
  limit:100
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

The pagination cursor returned in the previous response. Leave unset for an initial request.
See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
    
</dd>
</dl>

<dl>
<dd>

**objectTypes:** `Internal::Types::Array[Square::Types::CatalogObjectType]` 

The desired set of object types to appear in the search results.

If this is unspecified, the operation returns objects of all the top level types at the version
of the Square API used to make the request. Object types that are nested onto other object types
are not included in the defaults.

At the current API version the default object types are:
ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST, 
PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT,
SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION, QUICK_AMOUNT_SETTINGS.

Note that if you wish for the query to return objects belonging to nested types (i.e., COMPONENT, IMAGE,
ITEM_OPTION_VAL, ITEM_VARIATION, or MODIFIER), you must explicitly include all the types of interest
in this field.
    
</dd>
</dl>

<dl>
<dd>

**includeDeletedObjects:** `Internal::Types::Boolean` — If `true`, deleted objects will be included in the results. Defaults to `false`. Deleted objects will have their `is_deleted` field set to `true`. If `include_deleted_objects` is `true`, then the `include_category_path_to_root` request parameter must be `false`. Both properties cannot be `true` at the same time.
    
</dd>
</dl>

<dl>
<dd>

**includeRelatedObjects:** `Internal::Types::Boolean` 

If `true`, the response will include additional objects that are related to the
requested objects. Related objects are objects that are referenced by object ID by the objects
in the response. This is helpful if the objects are being fetched for immediate display to a user.
This process only goes one level deep. Objects referenced by the related objects will not be included.
For example:

If the `objects` field of the response contains a CatalogItem, its associated
CatalogCategory objects, CatalogTax objects, CatalogImage objects and
CatalogModifierLists will be returned in the `related_objects` field of the
response. If the `objects` field of the response contains a CatalogItemVariation,
its parent CatalogItem will be returned in the `related_objects` field of
the response.

Default value: `false`
    
</dd>
</dl>

<dl>
<dd>

**beginTime:** `String` 

Return objects modified after this [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), in RFC 3339
format, e.g., `2016-09-04T23:59:33.123Z`. The timestamp is exclusive - objects with a
timestamp equal to `begin_time` will not be included in the response.
    
</dd>
</dl>

<dl>
<dd>

**query:** `Square::Types::CatalogQuery` — A query to be used to filter or sort the results. If no query is specified, the entire catalog will be returned.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

A limit on the number of results to be returned in a single page. The limit is advisory -
the implementation may return more or fewer results. If the supplied limit is negative, zero, or
is higher than the maximum limit of 1,000, it will be ignored.
    
</dd>
</dl>

<dl>
<dd>

**includeCategoryPathToRoot:** `Internal::Types::Boolean` — Specifies whether or not to include the `path_to_root` list for each returned category instance. The `path_to_root` list consists of `CategoryPathToRootNode` objects and specifies the path that starts with the immediate parent category of the returned category and ends with its root category. If the returned category is a top-level category, the `path_to_root` list is empty and is not returned in the response payload. If `include_category_path_to_root` is `true`, then the `include_deleted_objects` request parameter must be `false`. Both properties cannot be `true` at the same time.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.SearchItems(request) -> Square::Types::SearchCatalogItemsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for catalog items or item variations by matching supported search attribute values, including
custom attribute values, against one or more of the specified query filters.

This (`SearchCatalogItems`) endpoint differs from the [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects)
endpoint in the following aspects:

- `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects.
- `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not.
- `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does.
- The both endpoints use different call conventions, including the query filter formats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.search_items({
  textFilter:'red',
  categoryIds:['WINE_CATEGORY_ID'],
  stockLevels:[],
  enabledLocationIds:['ATL_LOCATION_ID'],
  limit:100,
  productTypes:[],
  customAttributeFilters:[{
    custom_attribute_definition_id:'VEGAN_DEFINITION_ID',
    bool_filter:true
  }, {
    custom_attribute_definition_id:'BRAND_DEFINITION_ID',
    string_filter:'Dark Horse'
  }, {
    key:'VINTAGE',
    number_filter:{
      min:'min',
      max:'max'
    }
  }, {
    custom_attribute_definition_id:'VARIETAL_DEFINITION_ID'
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**textFilter:** `String` 

The text filter expression to return items or item variations containing specified text in
the `name`, `description`, or `abbreviation` attribute value of an item, or in
the `name`, `sku`, or `upc` attribute value of an item variation.
    
</dd>
</dl>

<dl>
<dd>

**categoryIds:** `Internal::Types::Array[String]` — The category id query expression to return items containing the specified category IDs.
    
</dd>
</dl>

<dl>
<dd>

**stockLevels:** `Internal::Types::Array[Square::Types::SearchCatalogItemsRequestStockLevel]` 

The stock-level query expression to return item variations with the specified stock levels.
See [SearchCatalogItemsRequestStockLevel](#type-searchcatalogitemsrequeststocklevel) for possible values
    
</dd>
</dl>

<dl>
<dd>

**enabledLocationIds:** `Internal::Types::Array[String]` — The enabled-location query expression to return items and item variations having specified enabled locations.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The pagination token, returned in the previous response, used to fetch the next batch of pending results.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results to return per page. The default value is 100.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

The order to sort the results by item names. The default sort order is ascending (`ASC`).
See [SortOrder](#type-sortorder) for possible values
    
</dd>
</dl>

<dl>
<dd>

**productTypes:** `Internal::Types::Array[Square::Types::CatalogItemProductType]` — The product types query expression to return items or item variations having the specified product types.
    
</dd>
</dl>

<dl>
<dd>

**customAttributeFilters:** `Internal::Types::Array[Square::Types::CustomAttributeFilter]` 

The customer-attribute filter to return items or item variations matching the specified
custom attribute expressions. A maximum number of 10 custom attribute expressions are supported in
a single call to the [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint.
    
</dd>
</dl>

<dl>
<dd>

**archivedState:** `Square::Types::ArchivedState` — The query filter to return not archived (`ARCHIVED_STATE_NOT_ARCHIVED`), archived (`ARCHIVED_STATE_ARCHIVED`), or either type (`ARCHIVED_STATE_ALL`) of items.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.UpdateItemModifierLists(request) -> Square::Types::UpdateItemModifierListsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the [CatalogModifierList](entity:CatalogModifierList) objects
that apply to the targeted [CatalogItem](entity:CatalogItem) without having
to perform an upsert on the entire item.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.update_item_modifier_lists({
  itemIds:['H42BRLUJ5KTZTTMPVSLFAACQ', '2JXOBJIHCWBQ4NZ3RIXQGJA6'],
  modifierListsToEnable:['H42BRLUJ5KTZTTMPVSLFAACQ', '2JXOBJIHCWBQ4NZ3RIXQGJA6'],
  modifierListsToDisable:['7WRC16CJZDVLSNDQ35PP6YAD']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**itemIds:** `Internal::Types::Array[String]` — The IDs of the catalog items associated with the CatalogModifierList objects being updated.
    
</dd>
</dl>

<dl>
<dd>

**modifierListsToEnable:** `Internal::Types::Array[String]` 

The IDs of the CatalogModifierList objects to enable for the CatalogItem.
At least one of `modifier_lists_to_enable` or `modifier_lists_to_disable` must be specified.
    
</dd>
</dl>

<dl>
<dd>

**modifierListsToDisable:** `Internal::Types::Array[String]` 

The IDs of the CatalogModifierList objects to disable for the CatalogItem.
At least one of `modifier_lists_to_enable` or `modifier_lists_to_disable` must be specified.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.UpdateItemTaxes(request) -> Square::Types::UpdateItemTaxesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the [CatalogTax](entity:CatalogTax) objects that apply to the
targeted [CatalogItem](entity:CatalogItem) without having to perform an
upsert on the entire item.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.update_item_taxes({
  itemIds:['H42BRLUJ5KTZTTMPVSLFAACQ', '2JXOBJIHCWBQ4NZ3RIXQGJA6'],
  taxesToEnable:['4WRCNHCJZDVLSNDQ35PP6YAD'],
  taxesToDisable:['AQCEGCEBBQONINDOHRGZISEX']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**itemIds:** `Internal::Types::Array[String]` 

IDs for the CatalogItems associated with the CatalogTax objects being updated.
No more than 1,000 IDs may be provided.
    
</dd>
</dl>

<dl>
<dd>

**taxesToEnable:** `Internal::Types::Array[String]` 

IDs of the CatalogTax objects to enable.
At least one of `taxes_to_enable` or `taxes_to_disable` must be specified.
    
</dd>
</dl>

<dl>
<dd>

**taxesToDisable:** `Internal::Types::Array[String]` 

IDs of the CatalogTax objects to disable.
At least one of `taxes_to_enable` or `taxes_to_disable` must be specified.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Channels
<details><summary><code>client.Channels.List() -> Square::Types::ListChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.channels.list({
  referenceId:'reference_id',
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**referenceType:** `Square::Types::ReferenceType` — Type of reference associated to channel
    
</dd>
</dl>

<dl>
<dd>

**referenceId:** `String` — id of reference associated to channel
    
</dd>
</dl>

<dl>
<dd>

**status:** `Square::Types::ChannelStatus` — Status of channel
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Cursor to fetch the next result
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

Maximum number of results to return.
When not provided the returned results will be cap at 100 channels.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Channels.BulkRetrieve(request) -> Square::Types::BulkRetrieveChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.channels.bulk_retrieve({
  channelIds:['CH_9C03D0B59', 'CH_6X139B5MN', 'NOT_EXISTING']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**channelIds:** `Internal::Types::Array[String]` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Channels.Get(ChannelId) -> Square::Types::RetrieveChannelResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.channels.get({
  channelId:'channel_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**channelId:** `String` — A channel id
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers
<details><summary><code>client.Customers.List() -> Square::Types::ListCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists customer profiles associated with a Square account.

Under normal operating conditions, newly created or updated customer profiles become available
for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated
profiles can take closer to one minute or longer, especially during network incidents and outages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.list({
  cursor:'cursor',
  limit:1,
  count:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for your original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.
If the specified limit is less than 1 or greater than 100, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 100.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**sortField:** `Square::Types::CustomerSortField` 

Indicates how customers should be sorted.

The default value is `DEFAULT`.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

Indicates whether customers should be sorted in ascending (`ASC`) or
descending (`DESC`) order.

The default value is `ASC`.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Internal::Types::Boolean` 

Indicates whether to return the total count of customers in the `count` field of the response.

The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Create(request) -> Square::Types::CreateCustomerResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new customer for a business.

You must provide at least one of the following values in your request to this
endpoint:

- `given_name`
- `family_name`
- `company_name`
- `email_address`
- `phone_number`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.create({
  givenName:'Amelia',
  familyName:'Earhart',
  emailAddress:'Amelia.Earhart@example.com',
  address:{
    address_line_1:'500 Electric Ave',
    address_line_2:'Suite 600',
    locality:'New York',
    administrative_district_level_1:'NY',
    postal_code:'10003'
  },
  phoneNumber:'+1-212-555-4240',
  referenceId:'YOUR_REFERENCE_ID',
  note:'a customer'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

The idempotency key for the request.	For more information, see
[Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**givenName:** `String` 

The given name (that is, the first name) associated with the customer profile.

The maximum length for this value is 300 characters.
    
</dd>
</dl>

<dl>
<dd>

**familyName:** `String` 

The family name (that is, the last name) associated with the customer profile.

The maximum length for this value is 300 characters.
    
</dd>
</dl>

<dl>
<dd>

**companyName:** `String` 

A business name associated with the customer profile.

The maximum length for this value is 500 characters.
    
</dd>
</dl>

<dl>
<dd>

**nickname:** `String` 

A nickname for the customer profile.

The maximum length for this value is 100 characters.
    
</dd>
</dl>

<dl>
<dd>

**emailAddress:** `String` 

The email address associated with the customer profile.

The maximum length for this value is 254 characters.
    
</dd>
</dl>

<dl>
<dd>

**address:** `Square::Types::Address` 

The physical address associated with the customer profile. For maximum length constraints, see 
[Customer addresses](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
The `first_name` and `last_name` fields are ignored if they are present in the request.
    
</dd>
</dl>

<dl>
<dd>

**phoneNumber:** `String` 

The phone number associated with the customer profile. The phone number must be valid and can contain
9–16 digits, with an optional `+` prefix and country code. For more information, see
[Customer phone numbers](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    
</dd>
</dl>

<dl>
<dd>

**referenceId:** `String` 

An optional second ID used to associate the customer profile with an
entity in another system.

The maximum length for this value is 100 characters.
    
</dd>
</dl>

<dl>
<dd>

**note:** `String` — A custom note associated with the customer profile.
    
</dd>
</dl>

<dl>
<dd>

**birthday:** `String` 

The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD` format. For example,
specify `1998-09-21` for September 21, 1998, or `09-21` for September 21. Birthdays are returned in `YYYY-MM-DD`
format, where `YYYY` is the specified birth year or `0000` if a birth year is not specified.
    
</dd>
</dl>

<dl>
<dd>

**taxIds:** `Square::Types::CustomerTaxIds` 

The tax ID associated with the customer profile. This field is available only for customers of sellers
in EU countries or the United Kingdom. For more information,
see [Customer tax IDs](https://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.BatchCreate(request) -> Square::Types::BulkCreateCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates multiple [customer profiles](entity:Customer) for a business.

This endpoint takes a map of individual create requests and returns a map of responses.

You must provide at least one of the following values in each create request:

- `given_name`
- `family_name`
- `company_name`
- `email_address`
- `phone_number`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.batch_create({
  customers:{
    '8bb76c4f-e35d-4c5b-90de-1194cd9179f0':{
      given_name:'Amelia',
      family_name:'Earhart',
      email_address:'Amelia.Earhart@example.com',
      address:{
        address_line_1:'500 Electric Ave',
        address_line_2:'Suite 600',
        locality:'New York',
        administrative_district_level_1:'NY',
        postal_code:'10003'
      },
      phone_number:'+1-212-555-4240',
      reference_id:'YOUR_REFERENCE_ID',
      note:'a customer'
    },
    'd1689f23-b25d-4932-b2f0-aed00f5e2029':{
      given_name:'Marie',
      family_name:'Curie',
      email_address:'Marie.Curie@example.com',
      address:{
        address_line_1:'500 Electric Ave',
        address_line_2:'Suite 601',
        locality:'New York',
        administrative_district_level_1:'NY',
        postal_code:'10003'
      },
      phone_number:'+1-212-444-4240',
      reference_id:'YOUR_REFERENCE_ID',
      note:'another customer'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customers:** `Internal::Types::Hash[String, Square::Types::BulkCreateCustomerData]` 

A map of 1 to 100 individual create requests, represented by `idempotency key: { customer data }`
key-value pairs.

Each key is an [idempotency key](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
that uniquely identifies the create request. Each value contains the customer data used to create the
customer profile.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.BulkDeleteCustomers(request) -> Square::Types::BulkDeleteCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes multiple customer profiles.

The endpoint takes a list of customer IDs and returns a map of responses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.bulk_delete_customers({
  customerIds:['8DDA5NZVBZFGAX0V3HPF81HHE0', 'N18CPRVXR5214XPBBA6BZQWF3C', '2GYD7WNXF7BJZW1PMGNXZ3Y8M8']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerIds:** `Internal::Types::Array[String]` — The IDs of the [customer profiles](entity:Customer) to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.BulkRetrieveCustomers(request) -> Square::Types::BulkRetrieveCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves multiple customer profiles.

This endpoint takes a list of customer IDs and returns a map of responses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.bulk_retrieve_customers({
  customerIds:['8DDA5NZVBZFGAX0V3HPF81HHE0', 'N18CPRVXR5214XPBBA6BZQWF3C', '2GYD7WNXF7BJZW1PMGNXZ3Y8M8']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerIds:** `Internal::Types::Array[String]` — The IDs of the [customer profiles](entity:Customer) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.BulkUpdateCustomers(request) -> Square::Types::BulkUpdateCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates multiple customer profiles.

This endpoint takes a map of individual update requests and returns a map of responses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.bulk_update_customers({
  customers:{
    '8DDA5NZVBZFGAX0V3HPF81HHE0':{
      email_address:'New.Amelia.Earhart@example.com',
      note:'updated customer note',
      version:2
    },
    N18CPRVXR5214XPBBA6BZQWF3C:{
      given_name:'Marie',
      family_name:'Curie',
      version:0
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customers:** `Internal::Types::Hash[String, Square::Types::BulkUpdateCustomerData]` 

A map of 1 to 100 individual update requests, represented by `customer ID: { customer data }`
key-value pairs.

Each key is the ID of the [customer profile](entity:Customer) to update. To update a customer profile
that was created by merging existing profiles, provide the ID of the newly created profile.

Each value contains the updated customer data. Only new or changed fields are required. To add or
update a field, specify the new value. To remove a field, specify `null`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Search(request) -> Square::Types::SearchCustomersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches the customer profiles associated with a Square account using one or more supported query filters.

Calling `SearchCustomers` without any explicit query filter returns all
customer profiles ordered alphabetically based on `given_name` and
`family_name`.

Under normal operating conditions, newly created or updated customer profiles become available
for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated
profiles can take closer to one minute or longer, especially during network incidents and outages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.search({
  limit:2,
  query:{
    filter:{
      creation_source:{
        values:[]
      },
      created_at:{
        start_at:'2018-01-01T00:00:00-00:00',
        end_at:'2018-02-01T00:00:00-00:00'
      },
      email_address:{
        fuzzy:'example.com'
      },
      group_ids:{
        all:['545AXB44B4XXWMVQ4W8SBT3HHF']
      }
    },
    sort:{}
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

Include the pagination cursor in subsequent calls to this endpoint to retrieve
the next set of results associated with the original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.
If the specified limit is invalid, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 100.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**query:** `Square::Types::CustomerQuery` 

The filtering and sorting criteria for the search request. If a query is not specified,
Square returns all customer profiles ordered alphabetically by `given_name` and `family_name`.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Internal::Types::Boolean` 

Indicates whether to return the total count of matching customers in the `count` field of the response.

The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Get(CustomerId) -> Square::Types::GetCustomerResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns details for a single customer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.get({
  customerId:'customer_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Update(CustomerId, request) -> Square::Types::UpdateCustomerResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a customer profile. This endpoint supports sparse updates, so only new or changed fields are required in the request.
To add or update a field, specify the new value. To remove a field, specify `null`.

To update a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.update({
  customerId:'customer_id',
  emailAddress:'New.Amelia.Earhart@example.com',
  note:'updated customer note',
  version:2
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to update.
    
</dd>
</dl>

<dl>
<dd>

**givenName:** `String` 

The given name (that is, the first name) associated with the customer profile.

The maximum length for this value is 300 characters.
    
</dd>
</dl>

<dl>
<dd>

**familyName:** `String` 

The family name (that is, the last name) associated with the customer profile.

The maximum length for this value is 300 characters.
    
</dd>
</dl>

<dl>
<dd>

**companyName:** `String` 

A business name associated with the customer profile.

The maximum length for this value is 500 characters.
    
</dd>
</dl>

<dl>
<dd>

**nickname:** `String` 

A nickname for the customer profile.

The maximum length for this value is 100 characters.
    
</dd>
</dl>

<dl>
<dd>

**emailAddress:** `String` 

The email address associated with the customer profile.

The maximum length for this value is 254 characters.
    
</dd>
</dl>

<dl>
<dd>

**address:** `Square::Types::Address` 

The physical address associated with the customer profile. Only new or changed fields are required in the request.

For maximum length constraints, see [Customer addresses](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#address).
The `first_name` and `last_name` fields are ignored if they are present in the request.
    
</dd>
</dl>

<dl>
<dd>

**phoneNumber:** `String` 

The phone number associated with the customer profile. The phone number must be valid and can contain
9–16 digits, with an optional `+` prefix and country code. For more information, see
[Customer phone numbers](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#phone-number).
    
</dd>
</dl>

<dl>
<dd>

**referenceId:** `String` 

An optional second ID used to associate the customer profile with an
entity in another system.

The maximum length for this value is 100 characters.
    
</dd>
</dl>

<dl>
<dd>

**note:** `String` — A custom note associated with the customer profile.
    
</dd>
</dl>

<dl>
<dd>

**birthday:** `String` 

The birthday associated with the customer profile, in `YYYY-MM-DD` or `MM-DD` format. For example,
specify `1998-09-21` for September 21, 1998, or `09-21` for September 21. Birthdays are returned in `YYYY-MM-DD`
format, where `YYYY` is the specified birth year or `0000` if a birth year is not specified.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the customer profile.

As a best practice, you should include this field to enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) control. For more information, see [Update a customer profile](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#update-a-customer-profile).
    
</dd>
</dl>

<dl>
<dd>

**taxIds:** `Square::Types::CustomerTaxIds` 

The tax ID associated with the customer profile. This field is available only for customers of sellers
in EU countries or the United Kingdom. For more information,
see [Customer tax IDs](https://developer.squareup.com/docs/customers-api/what-it-does#customer-tax-ids).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Delete(CustomerId) -> Square::Types::DeleteCustomerResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a customer profile from a business.

To delete a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.delete({
  customerId:'customer_id',
  version:1000000
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to delete.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the customer profile.

As a best practice, you should include this parameter to enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) control.  For more information, see [Delete a customer profile](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#delete-customer-profile).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Devices
<details><summary><code>client.Devices.List() -> Square::Types::ListDevicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List devices associated with the merchant. Currently, only Terminal API
devices are supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.devices.list({
  cursor:'cursor',
  limit:1,
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

The order in which results are listed.
- `ASC` - Oldest to newest.
- `DESC` - Newest to oldest (default).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The number of results to return in a single page.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — If present, only returns devices at the target location.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Devices.Get(DeviceId) -> Square::Types::GetDeviceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves Device with the associated `device_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.devices.get({
  deviceId:'device_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**deviceId:** `String` — The unique ID for the desired `Device`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Disputes
<details><summary><code>client.Disputes.List() -> Square::Types::ListDisputesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of disputes associated with a particular account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.list({
  cursor:'cursor',
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**states:** `Square::Types::DisputeState` — The dispute states used to filter the result. If not specified, the endpoint returns all disputes.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

The ID of the location for which to return a list of disputes.
If not specified, the endpoint returns disputes associated with all locations.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.Get(DisputeId) -> Square::Types::GetDisputeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns details about a specific dispute.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.get({
  disputeId:'dispute_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute you want more details about.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.Accept(DisputeId) -> Square::Types::AcceptDisputeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and
updates the dispute state to ACCEPTED.

Square debits the disputed amount from the seller’s Square account. If the Square account
does not have sufficient funds, Square debits the associated bank account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.accept({
  disputeId:'dispute_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute you want to accept.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.CreateEvidenceFile(DisputeId, request) -> Square::Types::CreateDisputeEvidenceFileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a file to use as evidence in a dispute challenge. The endpoint accepts HTTP
multipart/form-data file uploads in HEIC, HEIF, JPEG, PDF, PNG, and TIFF formats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.create_evidence_file({
  disputeId:'dispute_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute for which you want to upload evidence.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.CreateEvidenceText(DisputeId, request) -> Square::Types::CreateDisputeEvidenceTextResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads text to use as evidence for a dispute challenge.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.create_evidence_text({
  disputeId:'dispute_id',
  idempotencyKey:'ed3ee3933d946f1514d505d173c82648',
  evidenceText:'1Z8888888888888888'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute for which you want to upload evidence.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — A unique key identifying the request. For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**evidenceType:** `Square::Types::DisputeEvidenceType` 

The type of evidence you are uploading.
See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
    
</dd>
</dl>

<dl>
<dd>

**evidenceText:** `String` — The evidence string.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.SubmitEvidence(DisputeId) -> Square::Types::SubmitEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits evidence to the cardholder's bank.

The evidence submitted by this endpoint includes evidence uploaded
using the [CreateDisputeEvidenceFile](api-endpoint:Disputes-CreateDisputeEvidenceFile) and
[CreateDisputeEvidenceText](api-endpoint:Disputes-CreateDisputeEvidenceText) endpoints and
evidence automatically provided by Square, when available. Evidence cannot be removed from
a dispute after submission.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.submit_evidence({
  disputeId:'dispute_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute for which you want to submit evidence.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Employees
<details><summary><code>client.Employees.List() -> Square::Types::ListEmployeesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.employees.list({
  locationId:'location_id',
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — 
    
</dd>
</dl>

<dl>
<dd>

**status:** `Square::Types::EmployeeStatus` — Specifies the EmployeeStatus to filter the employee by.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The number of employees to be returned on each page.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The token required to retrieve the specified page of results.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Employees.Get(Id) -> Square::Types::GetEmployeeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>


</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.employees.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — UUID for the employee that was requested.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Events
<details><summary><code>client.Events.SearchEvents(request) -> Square::Types::SearchEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Search for Square API events that occur within a 28-day timeframe.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.events.search_events({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of events for your original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of events to return in a single page. The response might contain fewer events. The default value is 100, which is also the maximum allowed value.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).

Default: 100
    
</dd>
</dl>

<dl>
<dd>

**query:** `Square::Types::SearchEventsQuery` — The filtering and sorting criteria for the search request. To retrieve additional pages using a cursor, you must use the original query.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Events.DisableEvents() -> Square::Types::DisableEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Disables events to prevent them from being searchable.
All events are disabled by default. You must enable events to make them searchable.
Disabling events for a specific time period prevents them from being searchable, even if you re-enable them later.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.events.disable_events();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Events.EnableEvents() -> Square::Types::EnableEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enables events to make them searchable. Only events that occur while in the enabled state are searchable.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.events.enable_events();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Events.ListEventTypes() -> Square::Types::ListEventTypesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all event types that you can subscribe to as webhooks or query using the Events API.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.events.list_event_types({
  apiVersion:'api_version'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiVersion:** `String` — The API version for which to list event types. Setting this field overrides the default version used by the application.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## GiftCards
<details><summary><code>client.GiftCards.List() -> Square::Types::ListGiftCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all gift cards. You can specify optional filters to retrieve 
a subset of the gift cards. Results are sorted by `created_at` in ascending order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.list({
  type:'type',
  state:'state',
  limit:1,
  cursor:'cursor',
  customerId:'customer_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**type:** `String` 

If a [type](entity:GiftCardType) is provided, the endpoint returns gift cards of the specified type.
Otherwise, the endpoint returns gift cards of all types.
    
</dd>
</dl>

<dl>
<dd>

**state:** `String` 

If a [state](entity:GiftCardStatus) is provided, the endpoint returns the gift cards in the specified state.
Otherwise, the endpoint returns the gift cards of all states.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

If a limit is provided, the endpoint returns only the specified number of results per page.
The maximum value is 200. The default value is 30.
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
If a cursor is not provided, the endpoint returns the first page of the results. 
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — If a customer ID is provided, the endpoint returns only the gift cards linked to the specified customer.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.Create(request) -> Square::Types::CreateGiftCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a digital gift card or registers a physical (plastic) gift card. The resulting gift card
has a `PENDING` state. To activate a gift card so that it can be redeemed for purchases, call
[CreateGiftCardActivity](api-endpoint:GiftCardActivities-CreateGiftCardActivity) and create an `ACTIVATE`
activity with the initial balance. Alternatively, you can use [RefundPayment](api-endpoint:Refunds-RefundPayment)
to refund a payment to the new gift card.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.create({
  idempotencyKey:'NC9Tm69EjbjtConu',
  locationId:'81FN9BNFZTKS4',
  giftCard:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information, 
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

The ID of the [location](entity:Location) where the gift card should be registered for 
reporting purposes. Gift cards can be redeemed at any of the seller's locations.
    
</dd>
</dl>

<dl>
<dd>

**giftCard:** `Square::Types::GiftCard` 

The gift card to create. The `type` field is required for this request. The `gan_source` 
and `gan` fields are included as follows: 

To direct Square to generate a 16-digit GAN, omit `gan_source` and `gan`.

To provide a custom GAN, include `gan_source` and `gan`.
- For `gan_source`, specify `OTHER`. 
- For `gan`, provide a custom GAN containing 8 to 20 alphanumeric characters. The GAN must be 
unique for the seller and cannot start with the same bank identification number (BIN) as major 
credit cards. Do not use GANs that are easy to guess (such as 12345678) because they greatly 
increase the risk of fraud. It is the responsibility of the developer to ensure the security 
of their custom GANs. For more information, see 
[Custom GANs](https://developer.squareup.com/docs/gift-cards/using-gift-cards-api#custom-gans). 

To register an unused, physical gift card that the seller previously ordered from Square, 
include `gan` and provide the GAN that is printed on the gift card.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.GetFromGan(request) -> Square::Types::GetGiftCardFromGanResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a gift card using the gift card account number (GAN).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.get_from_gan({
  gan:'7783320001001635'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**gan:** `String` 

The gift card account number (GAN) of the gift card to retrieve.
The maximum length of a GAN is 255 digits to account for third-party GANs that have been imported.
Square-issued gift cards have 16-digit GANs.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.GetFromNonce(request) -> Square::Types::GetGiftCardFromNonceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a gift card using a secure payment token that represents the gift card.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.get_from_nonce({
  nonce:'cnon:7783322135245171'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**nonce:** `String` 

The payment token of the gift card to retrieve. Payment tokens are generated by the 
Web Payments SDK or In-App Payments SDK.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.LinkCustomer(GiftCardId, request) -> Square::Types::LinkCustomerToGiftCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Links a customer to a gift card, which is also referred to as adding a card on file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.link_customer({
  giftCardId:'gift_card_id',
  customerId:'GKY0FZ3V717AH8Q2D821PNT2ZW'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**giftCardId:** `String` — The ID of the gift card to be linked.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to link to the gift card.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.UnlinkCustomer(GiftCardId, request) -> Square::Types::UnlinkCustomerFromGiftCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unlinks a customer from a gift card, which is also referred to as removing a card on file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.unlink_customer({
  giftCardId:'gift_card_id',
  customerId:'GKY0FZ3V717AH8Q2D821PNT2ZW'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**giftCardId:** `String` — The ID of the gift card to be unlinked.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to unlink from the gift card.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.Get(Id) -> Square::Types::GetGiftCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a gift card using the gift card ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the gift card to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Inventory
<details><summary><code>client.Inventory.DeprecatedGetAdjustment(AdjustmentId) -> Square::Types::GetInventoryAdjustmentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated version of [RetrieveInventoryAdjustment](api-endpoint:Inventory-RetrieveInventoryAdjustment) after the endpoint URL
is updated to conform to the standard convention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.deprecated_get_adjustment({
  adjustmentId:'adjustment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**adjustmentId:** `String` — ID of the [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.GetAdjustment(AdjustmentId) -> Square::Types::GetInventoryAdjustmentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the [InventoryAdjustment](entity:InventoryAdjustment) object
with the provided `adjustment_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.get_adjustment({
  adjustmentId:'adjustment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**adjustmentId:** `String` — ID of the [InventoryAdjustment](entity:InventoryAdjustment) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.DeprecatedBatchChange(request) -> Square::Types::BatchChangeInventoryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated version of [BatchChangeInventory](api-endpoint:Inventory-BatchChangeInventory) after the endpoint URL
is updated to conform to the standard convention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.deprecated_batch_change({
  idempotency_key:'8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe',
  changes:[{
    physical_count:{
      reference_id:'1536bfbf-efed-48bf-b17d-a197141b2a92',
      catalog_object_id:'W62UWFY35CWMYGVWK6TWJDNI',
      location_id:'C6W5YS5QM06F5',
      quantity:'53',
      team_member_id:'LRK57NSQ5X7PUD05',
      occurred_at:'2016-11-16T22:25:24.878Z'
    }
  }],
  ignore_unchanged_counts:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::BatchChangeInventoryRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.DeprecatedBatchGetChanges(request) -> Square::Types::BatchGetInventoryChangesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated version of [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges) after the endpoint URL
is updated to conform to the standard convention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.deprecated_batch_get_changes({
  catalog_object_ids:['W62UWFY35CWMYGVWK6TWJDNI'],
  location_ids:['C6W5YS5QM06F5'],
  types:[],
  states:[],
  updated_after:'2016-11-01T00:00:00.000Z',
  updated_before:'2016-12-01T00:00:00.000Z'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::BatchRetrieveInventoryChangesRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.DeprecatedBatchGetCounts(request) -> Square::Types::BatchGetInventoryCountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated version of [BatchRetrieveInventoryCounts](api-endpoint:Inventory-BatchRetrieveInventoryCounts) after the endpoint URL
is updated to conform to the standard convention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.deprecated_batch_get_counts({
  catalog_object_ids:['W62UWFY35CWMYGVWK6TWJDNI'],
  location_ids:['59TNP9SA8VGDA'],
  updated_after:'2016-11-16T00:00:00.000Z'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::BatchGetInventoryCountsRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.BatchCreateChanges(request) -> Square::Types::BatchChangeInventoryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Applies adjustments and counts to the provided item quantities.

On success: returns the current calculated counts for all objects
referenced in the request.
On failure: returns a list of related errors.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.batch_create_changes({
  idempotency_key:'8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe',
  changes:[{
    physical_count:{
      reference_id:'1536bfbf-efed-48bf-b17d-a197141b2a92',
      catalog_object_id:'W62UWFY35CWMYGVWK6TWJDNI',
      location_id:'C6W5YS5QM06F5',
      quantity:'53',
      team_member_id:'LRK57NSQ5X7PUD05',
      occurred_at:'2016-11-16T22:25:24.878Z'
    }
  }],
  ignore_unchanged_counts:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::BatchChangeInventoryRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.BatchGetChanges(request) -> Square::Types::BatchGetInventoryChangesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns historical physical counts and adjustments based on the
provided filter criteria.

Results are paginated and sorted in ascending order according their
`occurred_at` timestamp (oldest first).

BatchRetrieveInventoryChanges is a catch-all query endpoint for queries
that cannot be handled by other, simpler endpoints.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.batch_get_changes({
  catalog_object_ids:['W62UWFY35CWMYGVWK6TWJDNI'],
  location_ids:['C6W5YS5QM06F5'],
  types:[],
  states:[],
  updated_after:'2016-11-01T00:00:00.000Z',
  updated_before:'2016-12-01T00:00:00.000Z'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::BatchRetrieveInventoryChangesRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.BatchGetCounts(request) -> Square::Types::BatchGetInventoryCountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns current counts for the provided
[CatalogObject](entity:CatalogObject)s at the requested
[Location](entity:Location)s.

Results are paginated and sorted in descending order according to their
`calculated_at` timestamp (newest first).

When `updated_after` is specified, only counts that have changed since that
time (based on the server timestamp for the most recent change) are
returned. This allows clients to perform a "sync" operation, for example
in response to receiving a Webhook notification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.batch_get_counts({
  catalog_object_ids:['W62UWFY35CWMYGVWK6TWJDNI'],
  location_ids:['59TNP9SA8VGDA'],
  updated_after:'2016-11-16T00:00:00.000Z'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::BatchGetInventoryCountsRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.DeprecatedGetPhysicalCount(PhysicalCountId) -> Square::Types::GetInventoryPhysicalCountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated version of [RetrieveInventoryPhysicalCount](api-endpoint:Inventory-RetrieveInventoryPhysicalCount) after the endpoint URL
is updated to conform to the standard convention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.deprecated_get_physical_count({
  physicalCountId:'physical_count_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**physicalCountId:** `String` 

ID of the
[InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.GetPhysicalCount(PhysicalCountId) -> Square::Types::GetInventoryPhysicalCountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the [InventoryPhysicalCount](entity:InventoryPhysicalCount)
object with the provided `physical_count_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.get_physical_count({
  physicalCountId:'physical_count_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**physicalCountId:** `String` 

ID of the
[InventoryPhysicalCount](entity:InventoryPhysicalCount) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.GetTransfer(TransferId) -> Square::Types::GetInventoryTransferResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the [InventoryTransfer](entity:InventoryTransfer) object
with the provided `transfer_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.get_transfer({
  transferId:'transfer_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferId:** `String` — ID of the [InventoryTransfer](entity:InventoryTransfer) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.Get(CatalogObjectId) -> Square::Types::GetInventoryCountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the current calculated stock count for a given
[CatalogObject](entity:CatalogObject) at a given set of
[Location](entity:Location)s. Responses are paginated and unsorted.
For more sophisticated queries, use a batch endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.get({
  catalogObjectId:'catalog_object_id',
  locationIds:'location_ids',
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**catalogObjectId:** `String` — ID of the [CatalogObject](entity:CatalogObject) to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**locationIds:** `String` 

The [Location](entity:Location) IDs to look up as a comma-separated
list. An empty list queries all locations.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for the original query.

See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Inventory.Changes(CatalogObjectId) -> Square::Types::GetInventoryChangesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a set of physical counts and inventory adjustments for the
provided [CatalogObject](entity:CatalogObject) at the requested
[Location](entity:Location)s.

You can achieve the same result by calling [BatchRetrieveInventoryChanges](api-endpoint:Inventory-BatchRetrieveInventoryChanges)
and having the `catalog_object_ids` list contain a single element of the `CatalogObject` ID.

Results are paginated and sorted in descending order according to their
`occurred_at` timestamp (newest first).

There are no limits on how far back the caller can page. This endpoint can be
used to display recent changes for a specific item. For more
sophisticated queries, use a batch endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.inventory.changes({
  catalogObjectId:'catalog_object_id',
  locationIds:'location_ids',
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**catalogObjectId:** `String` — ID of the [CatalogObject](entity:CatalogObject) to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**locationIds:** `String` 

The [Location](entity:Location) IDs to look up as a comma-separated
list. An empty list queries all locations.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for the original query.

See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Invoices
<details><summary><code>client.Invoices.List() -> Square::Types::ListInvoicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of invoices for a given location. The response 
is paginated. If truncated, the response includes a `cursor` that you    
use in a subsequent request to retrieve the next set of invoices.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.list({
  locationId:'location_id',
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location for which to list invoices.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint. 
Provide this cursor to retrieve the next set of results for your original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of invoices to return (200 is the maximum `limit`). 
If not provided, the server uses a default limit of 100 invoices.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Create(request) -> Square::Types::CreateInvoiceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a draft [invoice](entity:Invoice) 
for an order created using the Orders API.

A draft invoice remains in your account and no action is taken. 
You must publish the invoice before Square can process it (send it to the customer's email address or charge the customer’s card on file).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.create({
  invoice:{
    location_id:'ES0RJRZYEC39A',
    order_id:'CAISENgvlJ6jLWAzERDzjyHVybY',
    primary_recipient:{
      customer_id:'JDKYHBWT1D4F8MFH63DBMEN8Y4'
    },
    payment_requests:[{
      due_date:'2030-01-24',
      tipping_enabled:true,
      reminders:[{
        relative_scheduled_days:-1,
        message:'Your invoice is due tomorrow'
      }]
    }],
    invoice_number:'inv-100',
    title:'Event Planning Services',
    description:'We appreciate your business!',
    scheduled_at:'2030-01-13T10:00:00Z',
    accepted_payment_methods:{
      card:true,
      square_gift_card:false,
      bank_account:false,
      buy_now_pay_later:false,
      cash_app_pay:false
    },
    custom_fields:[{
      label:'Event Reference Number',
      value:"Ref. #1234"
    }, {
      label:'Terms of Service',
      value:'The terms of service are...'
    }],
    sale_or_service_date:'2030-01-24',
    store_payment_method_enabled:false
  },
  idempotencyKey:'ce3748f9-5fc1-4762-aa12-aae5e843f1f4'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoice:** `Square::Types::Invoice` — The invoice to create.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies the `CreateInvoice` request. If you do not 
provide `idempotency_key` (or provide an empty string as the value), the endpoint 
treats each request as independent.

For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Search(request) -> Square::Types::SearchInvoicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for invoices from a location specified in 
the filter. You can optionally specify customers in the filter for whom to 
retrieve invoices. In the current implementation, you can only specify one location and 
optionally one customer.

The response is paginated. If truncated, the response includes a `cursor` 
that you use in a subsequent request to retrieve the next set of invoices.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.search({
  query:{
    filter:{
      location_ids:['ES0RJRZYEC39A'],
      customer_ids:['JDKYHBWT1D4F8MFH63DBMEN8Y4']
    },
    sort:{
      field:'INVOICE_SORT_DATE'
    }
  },
  limit:100
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::InvoiceQuery` — Describes the query criteria for searching invoices.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of invoices to return (200 is the maximum `limit`). 
If not provided, the server uses a default limit of 100 invoices.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint. 
Provide this cursor to retrieve the next set of results for your original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Get(InvoiceId) -> Square::Types::GetInvoiceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an invoice by invoice ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.get({
  invoiceId:'invoice_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the invoice to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Update(InvoiceId, request) -> Square::Types::UpdateInvoiceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an invoice. This endpoint supports sparse updates, so you only need
to specify the fields you want to change along with the required `version` field.
Some restrictions apply to updating invoices. For example, you cannot change the
`order_id` or `location_id` field.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.update({
  invoiceId:'invoice_id',
  invoice:{
    version:1,
    payment_requests:[{
      uid:'2da7964f-f3d2-4f43-81e8-5aa220bf3355',
      tipping_enabled:false
    }]
  },
  idempotencyKey:'4ee82288-0910-499e-ab4c-5d0071dad1be'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the invoice to update.
    
</dd>
</dl>

<dl>
<dd>

**invoice:** `Square::Types::Invoice` 

The invoice fields to add, change, or clear. Fields can be cleared using
null values or the `remove` field (for individual payment requests or reminders).
The current invoice `version` is also required. For more information, including requirements,
limitations, and more examples, see [Update an Invoice](https://developer.squareup.com/docs/invoices-api/update-invoices).
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies the `UpdateInvoice` request. If you do not
provide `idempotency_key` (or provide an empty string as the value), the endpoint
treats each request as independent.

For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**fieldsToClear:** `Internal::Types::Array[String]` 

The list of fields to clear. Although this field is currently supported, we
recommend using null values or the `remove` field when possible. For examples, see
[Update an Invoice](https://developer.squareup.com/docs/invoices-api/update-invoices).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Delete(InvoiceId) -> Square::Types::DeleteInvoiceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the specified invoice. When an invoice is deleted, the 
associated order status changes to CANCELED. You can only delete a draft 
invoice (you cannot delete a published invoice, including one that is scheduled for processing).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.delete({
  invoiceId:'invoice_id',
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the invoice to delete.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The version of the [invoice](entity:Invoice) to delete.
If you do not know the version, you can call [GetInvoice](api-endpoint:Invoices-GetInvoice) or 
[ListInvoices](api-endpoint:Invoices-ListInvoices).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.CreateInvoiceAttachment(InvoiceId, request) -> Square::Types::CreateInvoiceAttachmentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a file and attaches it to an invoice. This endpoint accepts HTTP multipart/form-data file uploads
with a JSON `request` part and a `file` part. The `file` part must be a `readable stream` that contains a file
in a supported format: GIF, JPEG, PNG, TIFF, BMP, or PDF.

Invoices can have up to 10 attachments with a total file size of 25 MB. Attachments can be added only to invoices
in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.

__NOTE:__ When testing in the Sandbox environment, the total file size is limited to 1 KB.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.create_invoice_attachment({
  invoiceId:'invoice_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the [invoice](entity:Invoice) to attach the file to.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.DeleteInvoiceAttachment(InvoiceId, AttachmentId) -> Square::Types::DeleteInvoiceAttachmentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes an attachment from an invoice and permanently deletes the file. Attachments can be removed only
from invoices in the `DRAFT`, `SCHEDULED`, `UNPAID`, or `PARTIALLY_PAID` state.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.delete_invoice_attachment({
  invoiceId:'invoice_id',
  attachmentId:'attachment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the [invoice](entity:Invoice) to delete the attachment from.
    
</dd>
</dl>

<dl>
<dd>

**attachmentId:** `String` — The ID of the [attachment](entity:InvoiceAttachment) to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Cancel(InvoiceId, request) -> Square::Types::CancelInvoiceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels an invoice. The seller cannot collect payments for 
the canceled invoice.

You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.cancel({
  invoiceId:'invoice_id',
  version:0
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the [invoice](entity:Invoice) to cancel.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The version of the [invoice](entity:Invoice) to cancel.
If you do not know the version, you can call 
[GetInvoice](api-endpoint:Invoices-GetInvoice) or [ListInvoices](api-endpoint:Invoices-ListInvoices).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Invoices.Publish(InvoiceId, request) -> Square::Types::PublishInvoiceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Publishes the specified draft invoice. 

After an invoice is published, Square 
follows up based on the invoice configuration. For example, Square 
sends the invoice to the customer's email address, charges the customer's card on file, or does 
nothing. Square also makes the invoice available on a Square-hosted invoice page. 

The invoice `status` also changes from `DRAFT` to a status 
based on the invoice configuration. For example, the status changes to `UNPAID` if 
Square emails the invoice or `PARTIALLY_PAID` if Square charges a card on file for a portion of the 
invoice amount.

In addition to the required `ORDERS_WRITE` and `INVOICES_WRITE` permissions, `CUSTOMERS_READ`
and `PAYMENTS_WRITE` are required when publishing invoices configured for card-on-file payments.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.invoices.publish({
  invoiceId:'invoice_id',
  version:1,
  idempotencyKey:'32da42d0-1997-41b0-826b-f09464fc2c2e'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**invoiceId:** `String` — The ID of the invoice to publish.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The version of the [invoice](entity:Invoice) to publish.
This must match the current version of the invoice; otherwise, the request is rejected.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies the `PublishInvoice` request. If you do not 
provide `idempotency_key` (or provide an empty string as the value), the endpoint 
treats each request as independent.

For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Labor
<details><summary><code>client.Labor.CreateScheduledShift(request) -> Square::Types::CreateScheduledShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a scheduled shift by providing draft shift details such as job ID,
team member assignment, and start and end times.

The following `draft_shift_details` fields are required:
- `location_id`
- `job_id`
- `start_at`
- `end_at`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.create_scheduled_shift({
  idempotencyKey:'HIDSNG5KS478L',
  scheduledShift:{
    draft_shift_details:{
      team_member_id:'ormj0jJJZ5OZIzxrZYJI',
      location_id:'PAA1RJZZKXBFG',
      job_id:'FzbJAtt9qEWncK1BWgVCxQ6M',
      start_at:'2019-01-25T03:11:00-05:00',
      end_at:'2019-01-25T13:11:00-05:00',
      notes:'Dont forget to prep the vegetables',
      is_deleted:false
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for the `CreateScheduledShift` request, used to ensure the
[idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
of the operation.
    
</dd>
</dl>

<dl>
<dd>

**scheduledShift:** `Square::Types::ScheduledShift` 

The scheduled shift with `draft_shift_details`.
If needed, call [ListLocations](api-endpoint:Locations-ListLocations) to get location IDs,
[ListJobs](api-endpoint:Team-ListJobs) to get job IDs, and [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
to get team member IDs and current job assignments.

The `start_at` and `end_at` timestamps must be provided in the time zone + offset of the
shift location specified in `location_id`. Example for Pacific Standard Time: 2024-10-31T12:30:00-08:00
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.BulkPublishScheduledShifts(request) -> Square::Types::BulkPublishScheduledShiftsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Publishes 1 - 100 scheduled shifts. This endpoint takes a map of individual publish
requests and returns a map of responses. When a scheduled shift is published, Square keeps
the `draft_shift_details` field as is and copies it to the `published_shift_details` field.

The minimum `start_at` and maximum `end_at` timestamps of all shifts in a
`BulkPublishScheduledShifts` request must fall within a two-week period.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.bulk_publish_scheduled_shifts({
  scheduledShifts:{
    key:{}
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**scheduledShifts:** `Internal::Types::Hash[String, Square::Types::BulkPublishScheduledShiftsData]` 

A map of 1 to 100 key-value pairs that represent individual publish requests.

- Each key is the ID of a scheduled shift you want to publish.
- Each value is a `BulkPublishScheduledShiftsData` object that contains the
`version` field or is an empty object.
    
</dd>
</dl>

<dl>
<dd>

**scheduledShiftNotificationAudience:** `Square::Types::ScheduledShiftNotificationAudience` 

Indicates whether Square should send email notifications to team members and
which team members should receive the notifications. This setting applies to all shifts
specified in the bulk operation. The default value is `AFFECTED`.
See [ScheduledShiftNotificationAudience](#type-scheduledshiftnotificationaudience) for possible values
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.SearchScheduledShifts(request) -> Square::Types::SearchScheduledShiftsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of scheduled shifts, with optional filter and sort settings.
By default, results are sorted by `start_at` in ascending order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.search_scheduled_shifts({
  query:{
    filter:{},
    sort:{}
  },
  limit:2,
  cursor:'xoxp-1234-5678-90123'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::ScheduledShiftQuery` — Query conditions used to filter and sort the results.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results to return in a single response page. The default value is 50.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The pagination cursor returned by the previous call to this endpoint. Provide
this cursor to retrieve the next page of results for your original request. For more
information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.RetrieveScheduledShift(Id) -> Square::Types::RetrieveScheduledShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a scheduled shift by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.retrieve_scheduled_shift({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the scheduled shift to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.UpdateScheduledShift(Id, request) -> Square::Types::UpdateScheduledShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the draft shift details for a scheduled shift. This endpoint supports
sparse updates, so only new, changed, or removed fields are required in the request.
You must publish the shift to make updates public.

You can make the following updates to `draft_shift_details`:
- Change the `location_id`, `job_id`, `start_at`, and `end_at` fields.
- Add, change, or clear the `team_member_id` and `notes` fields. To clear these fields,
set the value to null.
- Change the `is_deleted` field. To delete a scheduled shift, set `is_deleted` to true
and then publish the shift.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.update_scheduled_shift({
  id:'id',
  scheduledShift:{
    draft_shift_details:{
      team_member_id:'ormj0jJJZ5OZIzxrZYJI',
      location_id:'PAA1RJZZKXBFG',
      job_id:'FzbJAtt9qEWncK1BWgVCxQ6M',
      start_at:'2019-03-25T03:11:00-05:00',
      end_at:'2019-03-25T13:18:00-05:00',
      notes:'Dont forget to prep the vegetables',
      is_deleted:false
    },
    version:1
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the scheduled shift to update.
    
</dd>
</dl>

<dl>
<dd>

**scheduledShift:** `Square::Types::ScheduledShift` 

The scheduled shift with any updates in the `draft_shift_details` field.
If needed, call [ListLocations](api-endpoint:Locations-ListLocations) to get location IDs,
[ListJobs](api-endpoint:Team-ListJobs) to get job IDs, and [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
to get team member IDs and current job assignments. Updates made to `published_shift_details`
are ignored.

If provided, the `start_at` and `end_at` timestamps must be in the time zone + offset of the
shift location specified in `location_id`. Example for Pacific Standard Time: 2024-10-31T12:30:00-08:00

To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control for the request, provide the current version of the shift in the `version` field.
If the provided version doesn't match the server version, the request fails. If `version` is
omitted, Square executes a blind write, potentially overwriting data from another publish request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.PublishScheduledShift(Id, request) -> Square::Types::PublishScheduledShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Publishes a scheduled shift. When a scheduled shift is published, Square keeps the
`draft_shift_details` field as is and copies it to the `published_shift_details` field.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.publish_scheduled_shift({
  id:'id',
  idempotencyKey:'HIDSNG5KS478L',
  version:2
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the scheduled shift to publish.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for the `PublishScheduledShift` request, used to ensure the
[idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
of the operation.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the scheduled shift, used to enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control. If the provided version doesn't match the server version, the request fails.
If omitted, Square executes a blind write, potentially overwriting data from another publish request.
    
</dd>
</dl>

<dl>
<dd>

**scheduledShiftNotificationAudience:** `Square::Types::ScheduledShiftNotificationAudience` 

Indicates whether Square should send an email notification to team members and
which team members should receive the notification. The default value is `AFFECTED`.
See [ScheduledShiftNotificationAudience](#type-scheduledshiftnotificationaudience) for possible values
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.CreateTimecard(request) -> Square::Types::CreateTimecardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new `Timecard`.

A `Timecard` represents a complete workday for a single team member.
You must provide the following values in your request to this
endpoint:

- `location_id`
- `team_member_id`
- `start_at`

An attempt to create a new `Timecard` can result in a `BAD_REQUEST` error when:
- The `status` of the new `Timecard` is `OPEN` and the team member has another
timecard with an `OPEN` status.
- The `start_at` date is in the future.
- The `start_at` or `end_at` date overlaps another timecard for the same team member.
- The `Break` instances are set in the request and a break `start_at`
is before the `Timecard.start_at`, a break `end_at` is after
the `Timecard.end_at`, or both.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.create_timecard({
  idempotencyKey:'HIDSNG5KS478L',
  timecard:{
    location_id:'PAA1RJZZKXBFG',
    start_at:'2019-01-25T03:11:00-05:00',
    end_at:'2019-01-25T13:11:00-05:00',
    wage:{
      title:'Barista',
      hourly_rate:{
        amount:1100
      },
      tip_eligible:true
    },
    breaks:[{
      start_at:'2019-01-25T06:11:00-05:00',
      end_at:'2019-01-25T06:16:00-05:00',
      break_type_id:'REGS1EQR1TPZ5',
      name:'Tea Break',
      expected_duration:'PT5M',
      is_paid:true
    }],
    team_member_id:'ormj0jJJZ5OZIzxrZYJI',
    declared_cash_tip_money:{
      amount:500
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string value to ensure the idempotency of the operation.
    
</dd>
</dl>

<dl>
<dd>

**timecard:** `Square::Types::Timecard` — The `Timecard` to be created.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.SearchTimecards(request) -> Square::Types::SearchTimecardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of `Timecard` records for a business.
The list to be returned can be filtered by:
- Location IDs
- Team member IDs
- Timecard status (`OPEN` or `CLOSED`)
- Timecard start
- Timecard end
- Workday details

The list can be sorted by:
- `START_AT`
- `END_AT`
- `CREATED_AT`
- `UPDATED_AT`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.search_timecards({
  query:{
    filter:{
      workday:{
        date_range:{
          start_date:'2019-01-20',
          end_date:'2019-02-03'
        },
        default_timezone:'America/Los_Angeles'
      }
    }
  },
  limit:100
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::TimecardQuery` — Query filters.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The number of resources in a page (200 by default).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — An opaque cursor for fetching the next page.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.RetrieveTimecard(Id) -> Square::Types::RetrieveTimecardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single `Timecard` specified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.retrieve_timecard({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `Timecard` being retrieved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.UpdateTimecard(Id, request) -> Square::Types::UpdateTimecardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing `Timecard`.

When adding a `Break` to a `Timecard`, any earlier `Break` instances in the `Timecard` have
the `end_at` property set to a valid RFC-3339 datetime string.

When closing a `Timecard`, all `Break` instances in the `Timecard` must be complete with `end_at`
set on each `Break`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.update_timecard({
  id:'id',
  timecard:{
    location_id:'PAA1RJZZKXBFG',
    start_at:'2019-01-25T03:11:00-05:00',
    end_at:'2019-01-25T13:11:00-05:00',
    wage:{
      title:'Bartender',
      hourly_rate:{
        amount:1500
      },
      tip_eligible:true
    },
    breaks:[{
      id:'X7GAQYVVRRG6P',
      start_at:'2019-01-25T06:11:00-05:00',
      end_at:'2019-01-25T06:16:00-05:00',
      break_type_id:'REGS1EQR1TPZ5',
      name:'Tea Break',
      expected_duration:'PT5M',
      is_paid:true
    }],
    version:1,
    team_member_id:'ormj0jJJZ5OZIzxrZYJI',
    declared_cash_tip_money:{
      amount:500
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the object being updated.
    
</dd>
</dl>

<dl>
<dd>

**timecard:** `Square::Types::Timecard` — The updated `Timecard` object.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.DeleteTimecard(Id) -> Square::Types::DeleteTimecardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a `Timecard`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.delete_timecard({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `Timecard` being deleted.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Locations
<details><summary><code>client.Locations.List() -> Square::Types::ListLocationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
including those with an inactive status. Locations are listed alphabetically by `name`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.list();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Create(request) -> Square::Types::CreateLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a [location](https://developer.squareup.com/docs/locations-api).
Creating new locations allows for separate configuration of receipt layouts, item prices,
and sales reports. Developers can use locations to separate sales activity through applications
that integrate with Square from sales activity elsewhere in a seller's account.
Locations created programmatically with the Locations API last forever and
are visible to the seller for their own management. Therefore, ensure that
each location has a sensible and unique name.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.create({
  location:{
    name:'Midtown',
    address:{
      address_line_1:'1234 Peachtree St. NE',
      locality:'Atlanta',
      administrative_district_level_1:'GA',
      postal_code:'30309'
    },
    description:'Midtown Atlanta store'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**location:** `Square::Types::Location` 

The initial values of the location being created. The `name` field is required and must be unique within a seller account.
All other fields are optional, but any information you care about for the location should be included.
The remaining fields are automatically added based on the data from the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Get(LocationId) -> Square::Types::GetLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves details of a single location. Specify "main"
as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.get({
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` 

The ID of the location to retrieve. Specify the string
"main" to return the main location.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Update(LocationId, request) -> Square::Types::UpdateLocationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a [location](https://developer.squareup.com/docs/locations-api).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.update({
  locationId:'location_id',
  location:{
    business_hours:{
      periods:[{
        start_local_time:'07:00',
        end_local_time:'18:00'
      }, {
        start_local_time:'07:00',
        end_local_time:'18:00'
      }, {
        start_local_time:'09:00',
        end_local_time:'15:00'
      }]
    },
    description:'Midtown Atlanta store - Open weekends'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location to update.
    
</dd>
</dl>

<dl>
<dd>

**location:** `Square::Types::Location` — The `Location` object with only the fields to update.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Checkouts(LocationId, request) -> Square::Types::CreateCheckoutResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Links a `checkoutId` to a `checkout_page_url` that customers are
directed to in order to provide their payment information using a
payment processing workflow hosted on connect.squareup.com. 


NOTE: The Checkout API has been updated with new features. 
For more information, see [Checkout API highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.checkouts({
  locationId:'location_id',
  idempotencyKey:'86ae1696-b1e3-4328-af6d-f1e04d947ad6',
  order:{
    order:{
      location_id:'location_id',
      reference_id:'reference_id',
      customer_id:'customer_id',
      line_items:[{
        name:'Printed T Shirt',
        quantity:'2',
        applied_taxes:[{
          tax_uid:'38ze1696-z1e3-5628-af6d-f1e04d947fg3'
        }],
        applied_discounts:[{
          discount_uid:'56ae1696-z1e3-9328-af6d-f1e04d947gd4'
        }],
        base_price_money:{
          amount:1500
        }
      }, {
        name:'Slim Jeans',
        quantity:'1',
        base_price_money:{
          amount:2500
        }
      }, {
        name:'Woven Sweater',
        quantity:'3',
        base_price_money:{
          amount:3500
        }
      }],
      taxes:[{
        uid:'38ze1696-z1e3-5628-af6d-f1e04d947fg3',
        percentage:'7.75'
      }],
      discounts:[{
        uid:'56ae1696-z1e3-9328-af6d-f1e04d947gd4',
        amount_money:{
          amount:100
        }
      }]
    },
    idempotency_key:'12ae1696-z1e3-4328-af6d-f1e04d947gd4'
  },
  askForShippingAddress:true,
  merchantSupportEmail:'merchant+support@website.com',
  prePopulateBuyerEmail:'example@email.com',
  prePopulateShippingAddress:{
    address_line_1:'1455 Market St.',
    address_line_2:'Suite 600',
    locality:'San Francisco',
    administrative_district_level_1:'CA',
    postal_code:'94103',
    first_name:'Jane',
    last_name:'Doe'
  },
  redirectUrl:'https://merchant.website.com/order-confirm',
  additionalRecipients:[{
    location_id:'057P5VYJ4A5X1',
    description:'Application fees',
    amount_money:{
      amount:60
    }
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the business location to associate the checkout with.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this checkout among others you have created. It can be
any valid string but must be unique for every order sent to Square Checkout for a given location ID.

The idempotency key is used to avoid processing the same order more than once. If you are 
unsure whether a particular checkout was created successfully, you can attempt it again with
the same idempotency key and all the same other parameters without worrying about creating duplicates.

You should use a random number/string generator native to the language
you are working in to generate strings for your idempotency keys.

For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**order:** `Square::Types::CreateOrderRequest` — The order including line items to be checked out.
    
</dd>
</dl>

<dl>
<dd>

**askForShippingAddress:** `Internal::Types::Boolean` 

If `true`, Square Checkout collects shipping information on your behalf and stores 
that information with the transaction information in the Square Seller Dashboard.

Default: `false`.
    
</dd>
</dl>

<dl>
<dd>

**merchantSupportEmail:** `String` 

The email address to display on the Square Checkout confirmation page
and confirmation email that the buyer can use to contact the seller.

If this value is not set, the confirmation page and email display the
primary email address associated with the seller's Square account.

Default: none; only exists if explicitly set.
    
</dd>
</dl>

<dl>
<dd>

**prePopulateBuyerEmail:** `String` 

If provided, the buyer's email is prepopulated on the checkout page
as an editable text field.

Default: none; only exists if explicitly set.
    
</dd>
</dl>

<dl>
<dd>

**prePopulateShippingAddress:** `Square::Types::Address` 

If provided, the buyer's shipping information is prepopulated on the
checkout page as editable text fields.

Default: none; only exists if explicitly set.
    
</dd>
</dl>

<dl>
<dd>

**redirectUrl:** `String` 

The URL to redirect to after the checkout is completed with `checkoutId`,
`transactionId`, and `referenceId` appended as URL parameters. For example,
if the provided redirect URL is `http://www.example.com/order-complete`, a
successful transaction redirects the customer to:

`http://www.example.com/order-complete?checkoutId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx`

If you do not provide a redirect URL, Square Checkout displays an order
confirmation page on your behalf; however, it is strongly recommended that
you provide a redirect URL so you can verify the transaction results and
finalize the order through your existing/normal confirmation workflow.

Default: none; only exists if explicitly set.
    
</dd>
</dl>

<dl>
<dd>

**additionalRecipients:** `Internal::Types::Array[Square::Types::ChargeRequestAdditionalRecipient]` 

The basic primitive of a multi-party transaction. The value is optional.
The transaction facilitated by you can be split from here.

If you provide this value, the `amount_money` value in your `additional_recipients` field
cannot be more than 90% of the `total_money` calculated by Square for your order.
The `location_id` must be a valid seller location where the checkout is occurring.

This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.

This field is currently not supported in the Square Sandbox.
    
</dd>
</dl>

<dl>
<dd>

**note:** `String` 

An optional note to associate with the `checkout` object.

This value cannot exceed 60 characters.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Loyalty
<details><summary><code>client.Loyalty.SearchEvents(request) -> Square::Types::SearchLoyaltyEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for loyalty events.

A Square loyalty program maintains a ledger of events that occur during the lifetime of a
buyer's loyalty account. Each change in the point balance
(for example, points earned, points redeemed, and points expired) is
recorded in the ledger. Using this endpoint, you can search the ledger for events.

Search results are sorted by `created_at` in descending order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.search_events({
  query:{
    filter:{
      order_filter:{
        order_id:'PyATxhYLfsMqpVkcKJITPydgEYfZY'
      }
    }
  },
  limit:30
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::LoyaltyEventQuery` 

A set of one or more predefined query filters to apply when 
searching for loyalty events. The endpoint performs a logical AND to 
evaluate multiple filters and performs a logical OR on arrays  
that specifies multiple field values.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to include in the response. 
The last page might contain fewer events. 
The default is 30 events.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for your original query.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Merchants
<details><summary><code>client.Merchants.List() -> Square::Types::ListMerchantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides details about the merchant associated with a given access token.

The access token used to connect your application to a Square seller is associated
with a single merchant. That means that `ListMerchants` returns a list
with a single `Merchant` object. You can specify your personal access token
to get your own merchant information or specify an OAuth token to get the
information for the merchant that granted your application access.

If you know the merchant ID, you can also use the [RetrieveMerchant](api-endpoint:Merchants-RetrieveMerchant)
endpoint to retrieve the merchant information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.list({
  cursor:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `Integer` — The cursor generated by the previous response.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.Get(MerchantId) -> Square::Types::GetMerchantResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the `Merchant` object for the given `merchant_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.get({
  merchantId:'merchant_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchantId:** `String` 

The ID of the merchant to retrieve. If the string "me" is supplied as the ID,
then retrieve the merchant that is currently accessible to this call.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Checkout
<details><summary><code>client.Checkout.RetrieveLocationSettings(LocationId) -> Square::Types::RetrieveLocationSettingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the location-level settings for a Square-hosted checkout page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.retrieve_location_settings({
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location for which to retrieve settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.UpdateLocationSettings(LocationId, request) -> Square::Types::UpdateLocationSettingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the location-level settings for a Square-hosted checkout page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.update_location_settings({
  locationId:'location_id',
  locationSettings:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location for which to retrieve settings.
    
</dd>
</dl>

<dl>
<dd>

**locationSettings:** `Square::Types::CheckoutLocationSettings` — Describe your updates using the `location_settings` object. Make sure it contains only the fields that have changed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.RetrieveMerchantSettings() -> Square::Types::RetrieveMerchantSettingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the merchant-level settings for a Square-hosted checkout page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.retrieve_merchant_settings();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.UpdateMerchantSettings(request) -> Square::Types::UpdateMerchantSettingsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the merchant-level settings for a Square-hosted checkout page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.update_merchant_settings({
  merchantSettings:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchantSettings:** `Square::Types::CheckoutMerchantSettings` — Describe your updates using the `merchant_settings` object. Make sure it contains only the fields that have changed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Orders
<details><summary><code>client.Orders.Create(request) -> Square::Types::CreateOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new [order](entity:Order) that can include information about products for
purchase and settings to apply to the purchase.

To pay for a created order, see
[Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).

You can modify open orders using the [UpdateOrder](api-endpoint:Orders-UpdateOrder) endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.create({
  order:{
    location_id:'057P5VYJ4A5X1',
    reference_id:'my-order-001',
    line_items:[{
      name:'New York Strip Steak',
      quantity:'1',
      base_price_money:{
        amount:1599
      }
    }, {
      quantity:'2',
      catalog_object_id:'BEMYCSMIJL46OCDV4KYIKXIB',
      modifiers:[{
        catalog_object_id:'CHQX7Y4KY6N5KINJKZCFURPZ'
      }],
      applied_discounts:[{
        discount_uid:'one-dollar-off'
      }]
    }],
    taxes:[{
      uid:'state-sales-tax',
      name:'State Sales Tax',
      percentage:'9'
    }],
    discounts:[{
      uid:'labor-day-sale',
      name:'Labor Day Sale',
      percentage:'5'
    }, {
      uid:'membership-discount',
      catalog_object_id:'DB7L55ZH2BGWI4H23ULIWOQ7'
    }, {
      uid:'one-dollar-off',
      name:'Sale - $1.00 off',
      amount_money:{
        amount:100
      }
    }]
  },
  idempotency_key:'8193148c-9586-11e6-99f9-28cfe92138cf'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::CreateOrderRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.BatchGet(request) -> Square::Types::BatchGetOrdersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a set of [orders](entity:Order) by their IDs.

If a given order ID does not exist, the ID is ignored instead of generating an error.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.batch_get({
  locationId:'057P5VYJ4A5X1',
  orderIds:['CAISEM82RcpmcFBM0TfOyiHV3es', 'CAISENgvlJ6jLWAzERDzjyHVybY']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` 

The ID of the location for these orders. This field is optional: omit it to retrieve
orders within the scope of the current authorization's merchant ID.
    
</dd>
</dl>

<dl>
<dd>

**orderIds:** `Internal::Types::Array[String]` — The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.Calculate(request) -> Square::Types::CalculateOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enables applications to preview order pricing without creating an order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.calculate({
  order:{
    location_id:'D7AVYMEAPJ3A3',
    line_items:[{
      name:'Item 1',
      quantity:'1',
      base_price_money:{
        amount:500
      }
    }, {
      name:'Item 2',
      quantity:'2',
      base_price_money:{
        amount:300
      }
    }],
    discounts:[{
      name:'50% Off',
      percentage:'50'
    }]
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**order:** `Square::Types::Order` — The order to be calculated. Expects the entire order, not a sparse update.
    
</dd>
</dl>

<dl>
<dd>

**proposedRewards:** `Internal::Types::Array[Square::Types::OrderReward]` 

Identifies one or more loyalty reward tiers to apply during the order calculation.
The discounts defined by the reward tiers are added to the order only to preview the
effect of applying the specified rewards. The rewards do not correspond to actual
redemptions; that is, no `reward`s are created. Therefore, the reward `id`s are
random strings used only to reference the reward tier.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.Clone(request) -> Square::Types::CloneOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new order, in the `DRAFT` state, by duplicating an existing order. The newly created order has
only the core fields (such as line items, taxes, and discounts) copied from the original order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.clone({
  orderId:'ZAISEM52YcpmcWAzERDOyiWS123',
  version:3,
  idempotencyKey:'UNIQUE_STRING'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the order to clone.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

An optional order version for concurrency protection.

If a version is provided, it must match the latest stored version of the order to clone.
If a version is not provided, the API clones the latest version.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A value you specify that uniquely identifies this clone request.

If you are unsure whether a particular order was cloned successfully,
you can reattempt the call with the same idempotency key without
worrying about creating duplicate cloned orders.
The originally cloned order is returned.

For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.Search(request) -> Square::Types::SearchOrdersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Search all orders for one or more locations. Orders include all sales,
returns, and exchanges regardless of how or when they entered the Square
ecosystem (such as Point of Sale, Invoices, and Connect APIs).

`SearchOrders` requests need to specify which locations to search and define a
[SearchOrdersQuery](entity:SearchOrdersQuery) object that controls
how to sort or filter the results. Your `SearchOrdersQuery` can:

  Set filter criteria.
  Set the sort order.
  Determine whether to return results as complete `Order` objects or as
[OrderEntry](entity:OrderEntry) objects.

Note that details for orders processed with Square Point of Sale while in
offline mode might not be transmitted to Square for up to 72 hours. Offline
orders have a `created_at` value that reflects the time the order was created,
not the time it was subsequently transmitted to Square.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.search({
  locationIds:['057P5VYJ4A5X1', '18YC4JDH91E1H'],
  query:{
    filter:{
      state_filter:{
        states:[]
      },
      date_time_filter:{
        closed_at:{
          start_at:'2018-03-03T20:00:00+00:00',
          end_at:'2019-03-04T21:54:45+00:00'
        }
      }
    },
    sort:{}
  },
  limit:3,
  returnEntries:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationIds:** `Internal::Types::Array[String]` 

The location IDs for the orders to query. All locations must belong to
the same merchant.

Max: 10 location IDs.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for your original query.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**query:** `Square::Types::SearchOrdersQuery` 

Query conditions used to filter or sort the results. Note that when
retrieving additional pages using a cursor, you must use the original query.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to be returned in a single page.

Default: `500`
Max: `1000`
    
</dd>
</dl>

<dl>
<dd>

**returnEntries:** `Internal::Types::Boolean` 

A Boolean that controls the format of the search results. If `true`,
`SearchOrders` returns [OrderEntry](entity:OrderEntry) objects. If `false`, `SearchOrders`
returns complete order objects.

Default: `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.Get(OrderId) -> Square::Types::GetOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an [Order](entity:Order) by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.get({
  orderId:'order_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the order to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.Update(OrderId, request) -> Square::Types::UpdateOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an open [order](entity:Order) by adding, replacing, or deleting
fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.

An `UpdateOrder` request requires the following:

- The `order_id` in the endpoint path, identifying the order to update.
- The latest `version` of the order to update.
- The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
containing only the fields to update and the version to which the update is
being applied.
- If deleting fields, the [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
identifying the fields to clear.

To pay for an order, see
[Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.update({
  orderId:'order_id',
  order:{
    location_id:'location_id',
    line_items:[{
      uid:'cookie_uid',
      name:'COOKIE',
      quantity:'2',
      base_price_money:{
        amount:200
      }
    }],
    version:1
  },
  fieldsToClear:['discounts'],
  idempotencyKey:'UNIQUE_STRING'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the order to update.
    
</dd>
</dl>

<dl>
<dd>

**order:** `Square::Types::Order` 

The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects)
containing only the fields to update and the version to which the update is
being applied.
    
</dd>
</dl>

<dl>
<dd>

**fieldsToClear:** `Internal::Types::Array[String]` 

The [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete)
fields to clear. For example, `line_items[uid].note`.
For more information, see [Deleting fields](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#deleting-fields).
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A value you specify that uniquely identifies this update request.

If you are unsure whether a particular update was applied to an order successfully,
you can reattempt it with the same idempotency key without
worrying about creating duplicate updates to the order.
The latest order version is returned.

For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.Pay(OrderId, request) -> Square::Types::PayOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pay for an [order](entity:Order) using one or more approved [payments](entity:Payment)
or settle an order with a total of `0`.

The total of the `payment_ids` listed in the request must be equal to the order
total. Orders with a total amount of `0` can be marked as paid by specifying an empty
array of `payment_ids` in the request.

To be used with `PayOrder`, a payment must:

- Reference the order by specifying the `order_id` when [creating the payment](api-endpoint:Payments-CreatePayment).
Any approved payments that reference the same `order_id` not specified in the
`payment_ids` is canceled.
- Be approved with [delayed capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture).
Using a delayed capture payment with `PayOrder` completes the approved payment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.pay({
  orderId:'order_id',
  idempotencyKey:'c043a359-7ad9-4136-82a9-c3f1d66dcbff',
  paymentIds:['EnZdNAlWCmfh6Mt5FMNST1o7taB', '0LRiVlbXVwe8ozu4KbZxd12mvaB']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the order being paid.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A value you specify that uniquely identifies this request among requests you have sent. If
you are unsure whether a particular payment request was completed successfully, you can reattempt
it with the same idempotency key without worrying about duplicate payments.

For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**orderVersion:** `Integer` — The version of the order being paid. If not supplied, the latest version will be paid.
    
</dd>
</dl>

<dl>
<dd>

**paymentIds:** `Internal::Types::Array[String]` 

The IDs of the [payments](entity:Payment) to collect.
The payment total must match the order total.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payments
<details><summary><code>client.Payments.List() -> Square::Types::ListPaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of payments taken by the account making the request.

Results are eventually consistent, and new payments or changes to payments might take several
seconds to appear.

The maximum results per page is 100.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.list({
  beginTime:'begin_time',
  endTime:'end_time',
  sortOrder:'sort_order',
  cursor:'cursor',
  locationId:'location_id',
  total:1000000,
  last4:'last_4',
  cardBrand:'card_brand',
  limit:1,
  isOfflinePayment:true,
  offlineBeginTime:'offline_begin_time',
  offlineEndTime:'offline_end_time',
  updatedAtBeginTime:'updated_at_begin_time',
  updatedAtEndTime:'updated_at_end_time'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beginTime:** `String` 

Indicates the start of the time range to retrieve payments for, in RFC 3339 format.
The range is determined using the `created_at` field for each Payment.
Inclusive. Default: The current time minus one year.
    
</dd>
</dl>

<dl>
<dd>

**endTime:** `String` 

Indicates the end of the time range to retrieve payments for, in RFC 3339 format.  The
range is determined using the `created_at` field for each Payment.

Default: The current time.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `String` 

The order in which results are listed by `ListPaymentsRequest.sort_field`:
- `ASC` - Oldest to newest.
- `DESC` - Newest to oldest (default).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

Limit results to the location supplied. By default, results are returned
for the default (main) location associated with the seller.
    
</dd>
</dl>

<dl>
<dd>

**total:** `Integer` — The exact amount in the `total_money` for a payment.
    
</dd>
</dl>

<dl>
<dd>

**last4:** `String` — The last four digits of a payment card.
    
</dd>
</dl>

<dl>
<dd>

**cardBrand:** `String` — The brand of the payment card (for example, VISA).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to be returned in a single page.
It is possible to receive fewer results than the specified limit on a given page.

The default value of 100 is also the maximum allowed value. If the provided value is 
greater than 100, it is ignored and the default value is used instead.

Default: `100`
    
</dd>
</dl>

<dl>
<dd>

**isOfflinePayment:** `Internal::Types::Boolean` — Whether the payment was taken offline or not.
    
</dd>
</dl>

<dl>
<dd>

**offlineBeginTime:** `String` 

Indicates the start of the time range for which to retrieve offline payments, in RFC 3339
format for timestamps. The range is determined using the
`offline_payment_details.client_created_at` field for each Payment. If set, payments without a
value set in `offline_payment_details.client_created_at` will not be returned.

Default: The current time.
    
</dd>
</dl>

<dl>
<dd>

**offlineEndTime:** `String` 

Indicates the end of the time range for which to retrieve offline payments, in RFC 3339
format for timestamps. The range is determined using the
`offline_payment_details.client_created_at` field for each Payment. If set, payments without a
value set in `offline_payment_details.client_created_at` will not be returned.

Default: The current time.
    
</dd>
</dl>

<dl>
<dd>

**updatedAtBeginTime:** `String` 

Indicates the start of the time range to retrieve payments for, in RFC 3339 format.  The
range is determined using the `updated_at` field for each Payment.
    
</dd>
</dl>

<dl>
<dd>

**updatedAtEndTime:** `String` 

Indicates the end of the time range to retrieve payments for, in RFC 3339 format.  The
range is determined using the `updated_at` field for each Payment.
    
</dd>
</dl>

<dl>
<dd>

**sortField:** `Square::Types::ListPaymentsRequestSortField` — The field used to sort results by. The default is `CREATED_AT`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payments.Create(request) -> Square::Types::CreatePaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a payment using the provided source. You can use this endpoint 
to charge a card (credit/debit card or    
Square gift card) or record a payment that the seller received outside of Square 
(cash payment from a buyer or a payment that an external entity 
processed on behalf of the seller).

The endpoint creates a 
`Payment` object and returns it in the response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.create({
  sourceId:'ccof:GaJGNaZa8x4OgDJn4GB',
  idempotencyKey:'7b0f3ec5-086a-4871-8f13-3c81b3875218',
  amountMoney:{
    amount:1000
  },
  appFeeMoney:{
    amount:10
  },
  autocomplete:true,
  customerId:'W92WH6P11H4Z77CTET0RNTGFW8',
  locationId:'L88917AVBK2S5',
  referenceId:'123456',
  note:'Brief description'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**sourceId:** `String` 

The ID for the source of funds for this payment.
This could be a payment token generated by the Web Payments SDK for any of its
[supported methods](https://developer.squareup.com/docs/web-payments/overview#explore-payment-methods),
including cards, bank transfers, Afterpay or Cash App Pay. If recording a payment
that the seller received outside of Square, specify either "CASH" or "EXTERNAL".
For more information, see
[Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreatePayment` request. Keys can be any valid string
but must be unique for every `CreatePayment` request.

Note: The number of allowed characters might be less than the stated maximum, if multi-byte
characters are used.

For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**amountMoney:** `Square::Types::Money` 

The amount of money to accept for this payment, not including `tip_money`.

The amount must be specified in the smallest denomination of the applicable currency
(for example, US dollar amounts are specified in cents). For more information, see
[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).

The currency code must match the currency associated with the business
that is accepting the payment.
    
</dd>
</dl>

<dl>
<dd>

**tipMoney:** `Square::Types::Money` 

The amount designated as a tip, in addition to `amount_money`.

The amount must be specified in the smallest denomination of the applicable currency
(for example, US dollar amounts are specified in cents). For more information, see
[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).

The currency code must match the currency associated with the business
that is accepting the payment.
    
</dd>
</dl>

<dl>
<dd>

**appFeeMoney:** `Square::Types::Money` 

The amount of money that the developer is taking as a fee
for facilitating the payment on behalf of the seller.

The amount cannot be more than 90% of the total amount of the payment.

The amount must be specified in the smallest denomination of the applicable currency
(for example, US dollar amounts are specified in cents). For more information, see
[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).

The fee currency code must match the currency associated with the seller
that is accepting the payment. The application must be from a developer
account in the same country and using the same currency code as the seller.

For more information about the application fee scenario, see
[Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).

To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required.
For more information, see [Permissions](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees#permissions).
    
</dd>
</dl>

<dl>
<dd>

**delayDuration:** `String` 

The duration of time after the payment's creation when Square automatically
either completes or cancels the payment depending on the `delay_action` field value.
For more information, see
[Time threshold](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).

This parameter should be specified as a time duration, in RFC 3339 format.

Note: This feature is only supported for card payments. This parameter can only be set for a delayed
capture payment (`autocomplete=false`).

Default:

- Card-present payments: "PT36H" (36 hours) from the creation time.
- Card-not-present payments: "P7D" (7 days) from the creation time.
    
</dd>
</dl>

<dl>
<dd>

**delayAction:** `String` 

The action to be applied to the payment when the `delay_duration` has elapsed. The action must be
CANCEL or COMPLETE. For more information, see
[Time Threshold](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture#time-threshold).

Default: CANCEL
    
</dd>
</dl>

<dl>
<dd>

**autocomplete:** `Internal::Types::Boolean` 

If set to `true`, this payment will be completed when possible. If
set to `false`, this payment is held in an approved state until either
explicitly completed (captured) or canceled (voided). For more information, see
[Delayed capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments#delayed-capture-of-a-card-payment).

Default: true
    
</dd>
</dl>

<dl>
<dd>

**orderId:** `String` — Associates a previously created order with this payment.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` 

The [Customer](entity:Customer) ID of the customer associated with the payment.

This is required if the `source_id` refers to a card on file created using the Cards API.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

The location ID to associate with the payment. If not specified, the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location) is
used.
    
</dd>
</dl>

<dl>
<dd>

**teamMemberId:** `String` 

An optional [TeamMember](entity:TeamMember) ID to associate with
this payment.
    
</dd>
</dl>

<dl>
<dd>

**referenceId:** `String` 

A user-defined ID to associate with the payment.

You can use this field to associate the payment to an entity in an external system
(for example, you might specify an order ID that is generated by a third-party shopping cart).
    
</dd>
</dl>

<dl>
<dd>

**verificationToken:** `String` 

An identifying token generated by [payments.verifyBuyer()](https://developer.squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
Verification tokens encapsulate customer device information and 3-D Secure
challenge results to indicate that Square has verified the buyer identity.

For more information, see [SCA Overview](https://developer.squareup.com/docs/sca-overview).
    
</dd>
</dl>

<dl>
<dd>

**acceptPartialAuthorization:** `Internal::Types::Boolean` 

If set to `true` and charging a Square Gift Card, a payment might be returned with
`amount_money` equal to less than what was requested. For example, a request for $20 when charging
a Square Gift Card with a balance of $5 results in an APPROVED payment of $5. You might choose
to prompt the buyer for an additional payment to cover the remainder or cancel the Gift Card
payment. This field cannot be `true` when `autocomplete = true`.

For more information, see
[Partial amount with Square Gift Cards](https://developer.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).

Default: false
    
</dd>
</dl>

<dl>
<dd>

**buyerEmailAddress:** `String` — The buyer's email address.
    
</dd>
</dl>

<dl>
<dd>

**buyerPhoneNumber:** `String` 

The buyer's phone number.
Must follow the following format:
1. A leading + symbol (followed by a country code)
2. The phone number can contain spaces and the special characters `(` , `)` , `-` , and `.`.
Alphabetical characters aren't allowed.
3. The phone number must contain between 9 and 16 digits.
    
</dd>
</dl>

<dl>
<dd>

**billingAddress:** `Square::Types::Address` — The buyer's billing address.
    
</dd>
</dl>

<dl>
<dd>

**shippingAddress:** `Square::Types::Address` — The buyer's shipping address.
    
</dd>
</dl>

<dl>
<dd>

**note:** `String` — An optional note to be entered by the developer when creating a payment.
    
</dd>
</dl>

<dl>
<dd>

**statementDescriptionIdentifier:** `String` 

Optional additional payment information to include on the customer's card statement
as part of the statement description. This can be, for example, an invoice number, ticket number,
or short description that uniquely identifies the purchase.

Note that the `statement_description_identifier` might get truncated on the statement description
to fit the required information including the Square identifier (SQ *) and name of the
seller taking the payment.
    
</dd>
</dl>

<dl>
<dd>

**cashDetails:** `Square::Types::CashPaymentDetails` — Additional details required when recording a cash payment (`source_id` is CASH).
    
</dd>
</dl>

<dl>
<dd>

**externalDetails:** `Square::Types::ExternalPaymentDetails` — Additional details required when recording an external payment (`source_id` is EXTERNAL).
    
</dd>
</dl>

<dl>
<dd>

**customerDetails:** `Square::Types::CustomerDetails` — Details about the customer making the payment.
    
</dd>
</dl>

<dl>
<dd>

**offlinePaymentDetails:** `Square::Types::OfflinePaymentDetails` 

An optional field for specifying the offline payment details. This is intended for
internal 1st-party callers only.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payments.CancelByIdempotencyKey(request) -> Square::Types::CancelPaymentByIdempotencyKeyResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels (voids) a payment identified by the idempotency key that is specified in the
request.

Use this method when the status of a `CreatePayment` request is unknown (for example, after you send a
`CreatePayment` request, a network error occurs and you do not get a response). In this case, you can
direct Square to cancel the payment using this endpoint. In the request, you provide the same
idempotency key that you provided in your `CreatePayment` request that you want to cancel. After
canceling the payment, you can submit your `CreatePayment` request again.

Note that if no payment with the specified idempotency key is found, no action is taken and the endpoint
returns successfully.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.cancel_by_idempotency_key({
  idempotencyKey:'a7e36d40-d24b-11e8-b568-0800200c9a66'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — The `idempotency_key` identifying the payment to be canceled.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payments.Get(PaymentId) -> Square::Types::GetPaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves details for a specific payment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.get({
  paymentId:'payment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — A unique ID for the desired payment.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payments.Update(PaymentId, request) -> Square::Types::UpdatePaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a payment with the APPROVED status.
You can update the `amount_money` and `tip_money` using this endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.update({
  paymentId:'payment_id',
  payment:{
    amount_money:{
      amount:1000
    },
    tip_money:{
      amount:100
    },
    version_token:'ODhwVQ35xwlzRuoZEwKXucfu7583sPTzK48c5zoGd0g6o'
  },
  idempotencyKey:'956f8b13-e4ec-45d6-85e8-d1d95ef0c5de'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The ID of the payment to update.
    
</dd>
</dl>

<dl>
<dd>

**payment:** `Square::Types::Payment` — The updated `Payment` object.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `UpdatePayment` request. Keys can be any valid string
but must be unique for every `UpdatePayment` request.

For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payments.Cancel(PaymentId) -> Square::Types::CancelPaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels (voids) a payment. You can use this endpoint to cancel a payment with 
the APPROVED `status`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.cancel({
  paymentId:'payment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The ID of the payment to cancel.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payments.Complete(PaymentId, request) -> Square::Types::CompletePaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Completes (captures) a payment.
By default, payments are set to complete immediately after they are created.

You can use this endpoint to complete a payment with the APPROVED `status`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payments.complete({
  paymentId:'payment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The unique ID identifying the payment to be completed.
    
</dd>
</dl>

<dl>
<dd>

**versionToken:** `String` 

Used for optimistic concurrency. This opaque token identifies the current `Payment`
version that the caller expects. If the server has a different version of the Payment,
the update fails and a response with a VERSION_MISMATCH error is returned.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payouts
<details><summary><code>client.Payouts.List() -> Square::Types::ListPayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of all payouts for the default location.
You can filter payouts by location ID, status, time range, and order them in ascending or descending order.
To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payouts.list({
  locationId:'location_id',
  beginTime:'begin_time',
  endTime:'end_time',
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` 

The ID of the location for which to list the payouts.
By default, payouts are returned for the default (main) location associated with the seller.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Square::Types::PayoutStatus` — If provided, only payouts with the given status are returned.
    
</dd>
</dl>

<dl>
<dd>

**beginTime:** `String` 

The timestamp for the beginning of the payout creation time, in RFC 3339 format.
Inclusive. Default: The current time minus one year.
    
</dd>
</dl>

<dl>
<dd>

**endTime:** `String` 

The timestamp for the end of the payout creation time, in RFC 3339 format.
Default: The current time.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` — The order in which payouts are listed.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
If request parameters change between requests, subsequent results may contain duplicates or missing records.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to be returned in a single page.
It is possible to receive fewer results than the specified limit on a given page.
The default value of 100 is also the maximum allowed value. If the provided value is
greater than 100, it is ignored and the default value is used instead.
Default: `100`
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payouts.Get(PayoutId) -> Square::Types::GetPayoutResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves details of a specific payout identified by a payout ID.
To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payouts.get({
  payoutId:'payout_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payoutId:** `String` — The ID of the payout to retrieve the information for.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Payouts.ListEntries(PayoutId) -> Square::Types::ListPayoutEntriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of all payout entries for a specific payout.
To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.payouts.list_entries({
  payoutId:'payout_id',
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**payoutId:** `String` — The ID of the payout to retrieve the information for.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` — The order in which payout entries are listed.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
If request parameters change between requests, subsequent results may contain duplicates or missing records.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to be returned in a single page.
It is possible to receive fewer results than the specified limit on a given page.
The default value of 100 is also the maximum allowed value. If the provided value is
greater than 100, it is ignored and the default value is used instead.
Default: `100`
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Refunds
<details><summary><code>client.Refunds.List() -> Square::Types::ListPaymentRefundsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of refunds for the account making the request.

Results are eventually consistent, and new refunds or changes to refunds might take several
seconds to appear.

The maximum results per page is 100.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refunds.list({
  beginTime:'begin_time',
  endTime:'end_time',
  sortOrder:'sort_order',
  cursor:'cursor',
  locationId:'location_id',
  status:'status',
  sourceType:'source_type',
  limit:1,
  updatedAtBeginTime:'updated_at_begin_time',
  updatedAtEndTime:'updated_at_end_time'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**beginTime:** `String` 

Indicates the start of the time range to retrieve each `PaymentRefund` for, in RFC 3339 
format.  The range is determined using the `created_at` field for each `PaymentRefund`. 

Default: The current time minus one year.
    
</dd>
</dl>

<dl>
<dd>

**endTime:** `String` 

Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC 3339 
format.  The range is determined using the `created_at` field for each `PaymentRefund`.

Default: The current time.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `String` 

The order in which results are listed by `PaymentRefund.created_at`:
- `ASC` - Oldest to newest.
- `DESC` - Newest to oldest (default).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

Limit results to the location supplied. By default, results are returned
for all locations associated with the seller.
    
</dd>
</dl>

<dl>
<dd>

**status:** `String` 

If provided, only refunds with the given status are returned.
For a list of refund status values, see [PaymentRefund](entity:PaymentRefund).

Default: If omitted, refunds are returned regardless of their status.
    
</dd>
</dl>

<dl>
<dd>

**sourceType:** `String` 

If provided, only returns refunds whose payments have the indicated source type.
Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, and `EXTERNAL`.
For information about these payment source types, see
[Take Payments](https://developer.squareup.com/docs/payments-api/take-payments).

Default: If omitted, refunds are returned regardless of the source type.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to be returned in a single page.

It is possible to receive fewer results than the specified limit on a given page.

If the supplied value is greater than 100, no more than 100 results are returned.

Default: 100
    
</dd>
</dl>

<dl>
<dd>

**updatedAtBeginTime:** `String` 

Indicates the start of the time range to retrieve each `PaymentRefund` for, in RFC 3339
format.  The range is determined using the `updated_at` field for each `PaymentRefund`.

Default: If omitted, the time range starts at `begin_time`.
    
</dd>
</dl>

<dl>
<dd>

**updatedAtEndTime:** `String` 

Indicates the end of the time range to retrieve each `PaymentRefund` for, in RFC 3339
format.  The range is determined using the `updated_at` field for each `PaymentRefund`.

Default: The current time.
    
</dd>
</dl>

<dl>
<dd>

**sortField:** `Square::Types::ListPaymentRefundsRequestSortField` — The field used to sort results by. The default is `CREATED_AT`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Refunds.RefundPayment(request) -> Square::Types::RefundPaymentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Refunds a payment. You can refund the entire payment amount or a
portion of it. You can use this endpoint to refund a card payment or record a 
refund of a cash or external payment. For more information, see
[Refund Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refunds.refund_payment({
  idempotencyKey:'9b7f2dcf-49da-4411-b23e-a2d6af21333a',
  amountMoney:{
    amount:1000
  },
  appFeeMoney:{
    amount:10
  },
  paymentId:'R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY',
  reason:'Example'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

 A unique string that identifies this `RefundPayment` request. The key can be any valid string
but must be unique for every `RefundPayment` request.

Keys are limited to a max of 45 characters - however, the number of allowed characters might be
less than 45, if multi-byte characters are used.

For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**amountMoney:** `Square::Types::Money` 

The amount of money to refund.

This amount cannot be more than the `total_money` value of the payment minus the total
amount of all previously completed refunds for this payment.

This amount must be specified in the smallest denomination of the applicable currency
(for example, US dollar amounts are specified in cents). For more information, see
[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).

The currency code must match the currency associated with the business
that is charging the card.
    
</dd>
</dl>

<dl>
<dd>

**appFeeMoney:** `Square::Types::Money` 

The amount of money the developer contributes to help cover the refunded amount.
This amount is specified in the smallest denomination of the applicable currency (for example,
US dollar amounts are specified in cents).

The value cannot be more than the `amount_money`.

You can specify this parameter in a refund request only if the same parameter was also included
when taking the payment. This is part of the application fee scenario the API supports. For more
information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).

To set this field, `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required.
For more information, see [Permissions](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees#permissions).
    
</dd>
</dl>

<dl>
<dd>

**paymentId:** `String` 

The unique ID of the payment being refunded.
Required when unlinked=false, otherwise must not be set.
    
</dd>
</dl>

<dl>
<dd>

**destinationId:** `String` 

The ID indicating where funds will be refunded to. Required for unlinked refunds. For more
information, see [Process an Unlinked Refund](https://developer.squareup.com/docs/refunds-api/unlinked-refunds).

For refunds linked to Square payments, `destination_id` is usually omitted; in this case, funds
will be returned to the original payment source. The field may be specified in order to request
a cross-method refund to a gift card. For more information,
see [Cross-method refunds to gift cards](https://developer.squareup.com/docs/payments-api/refund-payments#cross-method-refunds-to-gift-cards).
    
</dd>
</dl>

<dl>
<dd>

**unlinked:** `Internal::Types::Boolean` 

Indicates that the refund is not linked to a Square payment.
If set to true, `destination_id` and `location_id` must be supplied while `payment_id` must not
be provided.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

The location ID associated with the unlinked refund.
Required for requests specifying `unlinked=true`.
Otherwise, if included when `unlinked=false`, will throw an error.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` 

The [Customer](entity:Customer) ID of the customer associated with the refund.
This is required if the `destination_id` refers to a card on file created using the Cards
API. Only allowed when `unlinked=true`.
    
</dd>
</dl>

<dl>
<dd>

**reason:** `String` — A description of the reason for the refund.
    
</dd>
</dl>

<dl>
<dd>

**paymentVersionToken:** `String` 

 Used for optimistic concurrency. This opaque token identifies the current `Payment`
version that the caller expects. If the server has a different version of the Payment,
the update fails and a response with a VERSION_MISMATCH error is returned.
If the versions match, or the field is not provided, the refund proceeds as normal.
    
</dd>
</dl>

<dl>
<dd>

**teamMemberId:** `String` — An optional [TeamMember](entity:TeamMember) ID to associate with this refund.
    
</dd>
</dl>

<dl>
<dd>

**cashDetails:** `Square::Types::DestinationDetailsCashRefundDetails` — Additional details required when recording an unlinked cash refund (`destination_id` is CASH).
    
</dd>
</dl>

<dl>
<dd>

**externalDetails:** `Square::Types::DestinationDetailsExternalRefundDetails` 

Additional details required when recording an unlinked external refund
(`destination_id` is EXTERNAL).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Refunds.Get(RefundId) -> Square::Types::GetPaymentRefundResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a specific refund using the `refund_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.refunds.get({
  refundId:'refund_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**refundId:** `String` — The unique ID for the desired `PaymentRefund`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Sites
<details><summary><code>client.Sites.List() -> Square::Types::ListSitesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the Square Online sites that belong to a seller. Sites are listed in descending order by the `created_at` date.


__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.sites.list();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Snippets
<details><summary><code>client.Snippets.Get(SiteId) -> Square::Types::GetSnippetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet applications, but you can retrieve only the snippet that was added by your application.

You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.


__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.snippets.get({
  siteId:'site_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**siteId:** `String` — The ID of the site that contains the snippet.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Snippets.Upsert(SiteId, request) -> Square::Types::UpsertSnippetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a snippet to a Square Online site or updates the existing snippet on the site. 
The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages. A snippet application can add one snippet to a given site. 

You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.


__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.snippets.upsert({
  siteId:'site_id',
  snippet:{
    content:'<script>var js = 1;</script>'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**siteId:** `String` — The ID of the site where you want to add or update the snippet.
    
</dd>
</dl>

<dl>
<dd>

**snippet:** `Square::Types::Snippet` — The snippet for the site.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Snippets.Delete(SiteId) -> Square::Types::DeleteSnippetResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes your snippet from a Square Online site.

You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.


__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.snippets.delete({
  siteId:'site_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**siteId:** `String` — The ID of the site that contains the snippet.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Subscriptions
<details><summary><code>client.Subscriptions.Create(request) -> Square::Types::CreateSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enrolls a customer in a subscription.

If you provide a card on file in the request, Square charges the card for
the subscription. Otherwise, Square sends an invoice to the customer's email
address. The subscription starts immediately, unless the request includes
the optional `start_date`. Each individual subscription is associated with a particular location.

For more information, see [Create a subscription](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions#create-a-subscription).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.create({
  idempotencyKey:'8193148c-9586-11e6-99f9-28cfe92138cf',
  locationId:'S8GWD5R9QB376',
  planVariationId:'6JHXF3B2CW3YKHDV4XEM674H',
  customerId:'CHFGVKYY8RSV93M5KCYTG4PN0G',
  startDate:'2023-06-20',
  cardId:'ccof:qy5x8hHGYsgLrp4Q4GB',
  timezone:'America/Los_Angeles',
  source:{
    name:'My Application'
  },
  phases:[{
    ordinal:0,
    order_template_id:'U2NaowWxzXwpsZU697x7ZHOAnCNZY'
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreateSubscription` request.
If you do not provide a unique string (or provide an empty string as the value),
the endpoint treats each request as independent.

For more information, see [Idempotency keys](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The ID of the location the subscription is associated with.
    
</dd>
</dl>

<dl>
<dd>

**planVariationId:** `String` — The ID of the [subscription plan variation](https://developer.squareup.com/docs/subscriptions-api/plans-and-variations#plan-variations) created using the Catalog API.
    
</dd>
</dl>

<dl>
<dd>

**customerId:** `String` — The ID of the [customer](entity:Customer) subscribing to the subscription plan variation.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `String` 

The `YYYY-MM-DD`-formatted date to start the subscription. 
If it is unspecified, the subscription starts immediately.
    
</dd>
</dl>

<dl>
<dd>

**canceledDate:** `String` 

The `YYYY-MM-DD`-formatted date when the newly created subscription is scheduled for cancellation. 

This date overrides the cancellation date set in the plan variation configuration.
If the cancellation date is earlier than the end date of a subscription cycle, the subscription stops
at the canceled date and the subscriber is sent a prorated invoice at the beginning of the canceled cycle. 

When the subscription plan of the newly created subscription has a fixed number of cycles and the `canceled_date`
occurs before the subscription plan completes, the specified `canceled_date` sets the date when the subscription
stops through the end of the last cycle.
    
</dd>
</dl>

<dl>
<dd>

**taxPercentage:** `String` 

The tax to add when billing the subscription.
The percentage is expressed in decimal form, using a `'.'` as the decimal
separator and without a `'%'` sign. For example, a value of 7.5
corresponds to 7.5%.
    
</dd>
</dl>

<dl>
<dd>

**priceOverrideMoney:** `Square::Types::Money` 

A custom price which overrides the cost of a subscription plan variation with `STATIC` pricing.
This field does not affect itemized subscriptions with `RELATIVE` pricing. Instead, 
you should edit the Subscription's [order template](https://developer.squareup.com/docs/subscriptions-api/manage-subscriptions#phases-and-order-templates).
    
</dd>
</dl>

<dl>
<dd>

**cardId:** `String` 

The ID of the [subscriber's](entity:Customer) [card](entity:Card) to charge.
If it is not specified, the subscriber receives an invoice via email with a link to pay for their subscription.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String` 

The timezone that is used in date calculations for the subscription. If unset, defaults to
the location timezone. If a timezone is not configured for the location, defaults to "America/New_York".
Format: the IANA Timezone Database identifier for the location timezone. For
a list of time zones, see [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
    
</dd>
</dl>

<dl>
<dd>

**source:** `Square::Types::SubscriptionSource` — The origination details of the subscription.
    
</dd>
</dl>

<dl>
<dd>

**monthlyBillingAnchorDate:** `Integer` — The day-of-the-month to change the billing date to.
    
</dd>
</dl>

<dl>
<dd>

**phases:** `Internal::Types::Array[Square::Types::Phase]` — array of phases for this subscription
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.BulkSwapPlan(request) -> Square::Types::BulkSwapPlanResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Schedules a plan variation change for all active subscriptions under a given plan
variation. For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.bulk_swap_plan({
  newPlanVariationId:'FQ7CDXXWSLUJRPM3GFJSJGZ7',
  oldPlanVariationId:'6JHXF3B2CW3YKHDV4XEM674H',
  locationId:'S8GWD5R9QB376'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**newPlanVariationId:** `String` 

The ID of the new subscription plan variation.

This field is required.
    
</dd>
</dl>

<dl>
<dd>

**oldPlanVariationId:** `String` 

The ID of the plan variation whose subscriptions should be swapped. Active subscriptions
using this plan variation will be subscribed to the new plan variation on their next billing
day.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The ID of the location to associate with the swapped subscriptions.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.Search(request) -> Square::Types::SearchSubscriptionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for subscriptions.

Results are ordered chronologically by subscription creation date. If
the request specifies more than one location ID,
the endpoint orders the result
by location ID, and then by creation date within each location. If no locations are given
in the query, all locations are searched.

You can also optionally specify `customer_ids` to search by customer.
If left unset, all customers
associated with the specified locations are returned.
If the request specifies customer IDs, the endpoint orders results
first by location, within location by customer ID, and within
customer by subscription creation date.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.search({
  query:{
    filter:{
      customer_ids:['CHFGVKYY8RSV93M5KCYTG4PN0G'],
      location_ids:['S8GWD5R9QB376'],
      source_names:['My App']
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

When the total number of resulting subscriptions exceeds the limit of a paged response, 
specify the cursor returned from a preceding response here to fetch the next set of results.
If the cursor is unset, the response contains the last page of the results.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The upper limit on the number of subscriptions to return
in a paged response.
    
</dd>
</dl>

<dl>
<dd>

**query:** `Square::Types::SearchSubscriptionsQuery` 

A subscription query consisting of specified filtering conditions.

If this `query` field is unspecified, the `SearchSubscriptions` call will return all subscriptions.
    
</dd>
</dl>

<dl>
<dd>

**include:** `Internal::Types::Array[String]` 

An option to include related information in the response. 

The supported values are: 

- `actions`: to include scheduled actions on the targeted subscriptions.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.Get(SubscriptionId) -> Square::Types::GetSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a specific subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.get({
  subscriptionId:'subscription_id',
  include:'include'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**include:** `String` 

A query parameter to specify related information to be included in the response. 

The supported query parameter values are: 

- `actions`: to include scheduled actions on the targeted subscription.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.Update(SubscriptionId, request) -> Square::Types::UpdateSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a subscription by modifying or clearing `subscription` field values.
To clear a field, set its value to `null`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.update({
  subscriptionId:'subscription_id',
  subscription:{
    card_id:'{NEW CARD ID}'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to update.
    
</dd>
</dl>

<dl>
<dd>

**subscription:** `Square::Types::Subscription` 

The subscription object containing the current version, and fields to update.
Unset fields will be left at their current server values, and JSON `null` values will
be treated as a request to clear the relevant data.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.DeleteAction(SubscriptionId, ActionId) -> Square::Types::DeleteSubscriptionActionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a scheduled action for a subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.delete_action({
  subscriptionId:'subscription_id',
  actionId:'action_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription the targeted action is to act upon.
    
</dd>
</dl>

<dl>
<dd>

**actionId:** `String` — The ID of the targeted action to be deleted.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.ChangeBillingAnchorDate(SubscriptionId, request) -> Square::Types::ChangeBillingAnchorDateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes the [billing anchor date](https://developer.squareup.com/docs/subscriptions-api/subscription-billing#billing-dates)
for a subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.change_billing_anchor_date({
  subscriptionId:'subscription_id',
  monthlyBillingAnchorDate:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to update the billing anchor date.
    
</dd>
</dl>

<dl>
<dd>

**monthlyBillingAnchorDate:** `Integer` — The anchor day for the billing cycle.
    
</dd>
</dl>

<dl>
<dd>

**effectiveDate:** `String` 

The `YYYY-MM-DD`-formatted date when the scheduled `BILLING_ANCHOR_CHANGE` action takes
place on the subscription.

When this date is unspecified or falls within the current billing cycle, the billing anchor date
is changed immediately.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.Cancel(SubscriptionId) -> Square::Types::CancelSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Schedules a `CANCEL` action to cancel an active subscription. This 
sets the `canceled_date` field to the end of the active billing period. After this date, 
the subscription status changes from ACTIVE to CANCELED.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.cancel({
  subscriptionId:'subscription_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to cancel.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.ListEvents(SubscriptionId) -> Square::Types::ListSubscriptionEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all [events](https://developer.squareup.com/docs/subscriptions-api/actions-events) for a specific subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.list_events({
  subscriptionId:'subscription_id',
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to retrieve the events for.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

When the total number of resulting subscription events exceeds the limit of a paged response, 
specify the cursor returned from a preceding response here to fetch the next set of results.
If the cursor is unset, the response contains the last page of the results.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The upper limit on the number of subscription events to return
in a paged response.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.Pause(SubscriptionId, request) -> Square::Types::PauseSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Schedules a `PAUSE` action to pause an active subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.pause({
  subscriptionId:'subscription_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to pause.
    
</dd>
</dl>

<dl>
<dd>

**pauseEffectiveDate:** `String` 

The `YYYY-MM-DD`-formatted date when the scheduled `PAUSE` action takes place on the subscription.

When this date is unspecified or falls within the current billing cycle, the subscription is paused
on the starting date of the next billing cycle.
    
</dd>
</dl>

<dl>
<dd>

**pauseCycleDuration:** `Integer` 

The number of billing cycles the subscription will be paused before it is reactivated. 

When this is set, a `RESUME` action is also scheduled to take place on the subscription at 
the end of the specified pause cycle duration. In this case, neither `resume_effective_date` 
nor `resume_change_timing` may be specified.
    
</dd>
</dl>

<dl>
<dd>

**resumeEffectiveDate:** `String` 

The date when the subscription is reactivated by a scheduled `RESUME` action. 
This date must be at least one billing cycle ahead of `pause_effective_date`.
    
</dd>
</dl>

<dl>
<dd>

**resumeChangeTiming:** `Square::Types::ChangeTiming` 

The timing whether the subscription is reactivated immediately or at the end of the billing cycle, relative to 
`resume_effective_date`.
See [ChangeTiming](#type-changetiming) for possible values
    
</dd>
</dl>

<dl>
<dd>

**pauseReason:** `String` — The user-provided reason to pause the subscription.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.Resume(SubscriptionId, request) -> Square::Types::ResumeSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Schedules a `RESUME` action to resume a paused or a deactivated subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.resume({
  subscriptionId:'subscription_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to resume.
    
</dd>
</dl>

<dl>
<dd>

**resumeEffectiveDate:** `String` — The `YYYY-MM-DD`-formatted date when the subscription reactivated.
    
</dd>
</dl>

<dl>
<dd>

**resumeChangeTiming:** `Square::Types::ChangeTiming` 

The timing to resume a subscription, relative to the specified
`resume_effective_date` attribute value.
See [ChangeTiming](#type-changetiming) for possible values
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Subscriptions.SwapPlan(SubscriptionId, request) -> Square::Types::SwapPlanResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Schedules a `SWAP_PLAN` action to swap a subscription plan variation in an existing subscription. 
For more information, see [Swap Subscription Plan Variations](https://developer.squareup.com/docs/subscriptions-api/swap-plan-variations).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.subscriptions.swap_plan({
  subscriptionId:'subscription_id',
  newPlanVariationId:'FQ7CDXXWSLUJRPM3GFJSJGZ7',
  phases:[{
    ordinal:0,
    order_template_id:'uhhnjH9osVv3shUADwaC0b3hNxQZY'
  }]
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — The ID of the subscription to swap the subscription plan for.
    
</dd>
</dl>

<dl>
<dd>

**newPlanVariationId:** `String` 

The ID of the new subscription plan variation.

This field is required.
    
</dd>
</dl>

<dl>
<dd>

**phases:** `Internal::Types::Array[Square::Types::PhaseInput]` — A list of PhaseInputs, to pass phase-specific information used in the swap.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TeamMembers
<details><summary><code>client.TeamMembers.Create(request) -> Square::Types::CreateTeamMemberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates.
You must provide the following values in your request to this endpoint:
- `given_name`
- `family_name`

Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.create({
  idempotency_key:'idempotency-key-0',
  team_member:{
    reference_id:'reference_id_1',
    given_name:'Joe',
    family_name:'Doe',
    email_address:'joe_doe@gmail.com',
    phone_number:'+14159283333',
    assigned_locations:{
      location_ids:['YSGH2WBKG94QZ', 'GA2Y9HSJ8KRYT']
    },
    wage_setting:{
      job_assignments:[{
        annual_rate:{
          amount:3000000
        },
        weekly_hours:40,
        job_id:'FjS8x95cqHiMenw4f1NAUH4P'
      }, {
        hourly_rate:{
          amount:2000
        },
        job_id:'VDNpRv8da51NU8qZFC5zDWpF'
      }],
      is_overtime_exempt:true
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Square::Types::CreateTeamMemberRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TeamMembers.BatchCreate(request) -> Square::Types::BatchCreateTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates.
This process is non-transactional and processes as much of the request as possible. If one of the creates in
the request cannot be successfully processed, the request is not marked as failed, but the body of the response
contains explicit error information for the failed create.

Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.batch_create({
  teamMembers:{
    'idempotency-key-1':{
      team_member:{
        reference_id:'reference_id_1',
        given_name:'Joe',
        family_name:'Doe',
        email_address:'joe_doe@gmail.com',
        phone_number:'+14159283333',
        assigned_locations:{
          location_ids:['YSGH2WBKG94QZ', 'GA2Y9HSJ8KRYT']
        }
      }
    },
    'idempotency-key-2':{
      team_member:{
        reference_id:'reference_id_2',
        given_name:'Jane',
        family_name:'Smith',
        email_address:'jane_smith@gmail.com',
        phone_number:'+14159223334',
        assigned_locations:{}
      }
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMembers:** `Internal::Types::Hash[String, Square::Types::CreateTeamMemberRequest]` 

The data used to create the `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
The maximum number of create objects is 25.

If you include a team member's `wage_setting`, you must provide `job_id` for each job assignment. To get job IDs,
call [ListJobs](api-endpoint:Team-ListJobs).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TeamMembers.BatchUpdate(request) -> Square::Types::BatchUpdateTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates.
This process is non-transactional and processes as much of the request as possible. If one of the updates in
the request cannot be successfully processed, the request is not marked as failed, but the body of the response
contains explicit error information for the failed update.
Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.batch_update({
  teamMembers:{
    'AFMwA08kR-MIF-3Vs0OE':{
      team_member:{
        reference_id:'reference_id_2',
        is_owner:false,
        given_name:'Jane',
        family_name:'Smith',
        email_address:'jane_smith@gmail.com',
        phone_number:'+14159223334',
        assigned_locations:{}
      }
    },
    'fpgteZNMaf0qOK-a4t6P':{
      team_member:{
        reference_id:'reference_id_1',
        is_owner:false,
        given_name:'Joe',
        family_name:'Doe',
        email_address:'joe_doe@gmail.com',
        phone_number:'+14159283333',
        assigned_locations:{
          location_ids:['YSGH2WBKG94QZ', 'GA2Y9HSJ8KRYT']
        }
      }
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMembers:** `Internal::Types::Hash[String, Square::Types::UpdateTeamMemberRequest]` 

The data used to update the `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
The maximum number of update objects is 25.

For each team member, include the fields to add, change, or clear. Fields can be cleared using a null value.
To update `wage_setting.job_assignments`, you must provide the complete list of job assignments. If needed,
call [ListJobs](api-endpoint:Team-ListJobs) to get the required `job_id` values.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TeamMembers.Search(request) -> Square::Types::SearchTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of `TeamMember` objects for a business. 
The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether
the team member is the Square account owner.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.search({
  query:{
    filter:{
      location_ids:['0G5P3VGACMMQZ']
    }
  },
  limit:10
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::SearchTeamMembersQuery` — The query parameters.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of `TeamMember` objects in a page (100 by default).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The opaque cursor for fetching the next page. For more information, see
[pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TeamMembers.Get(TeamMemberId) -> Square::Types::GetTeamMemberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a `TeamMember` object for the given `TeamMember.id`.
Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.get({
  teamMemberId:'team_member_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberId:** `String` — The ID of the team member to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TeamMembers.Update(TeamMemberId, request) -> Square::Types::UpdateTeamMemberResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates.
Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.update({
  teamMemberId:'team_member_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberId:** `String` — The ID of the team member to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Square::Types::UpdateTeamMemberRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Team
<details><summary><code>client.Team.ListJobs() -> Square::Types::ListJobsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists jobs in a seller account. Results are sorted by title in ascending order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.list_jobs({
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

The pagination cursor returned by the previous call to this endpoint. Provide this
cursor to retrieve the next page of results for your original request. For more information,
see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Team.CreateJob(request) -> Square::Types::CreateJobResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a job in a seller account. A job defines a title and tip eligibility. Note that
compensation is defined in a [job assignment](entity:JobAssignment) in a team member's wage setting.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.create_job({
  job:{
    title:'Cashier',
    is_tip_eligible:true
  },
  idempotencyKey:'idempotency-key-0'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**job:** `Square::Types::Job` — The job to create. The `title` field is required and `is_tip_eligible` defaults to true.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for the `CreateJob` request. Keys can be any valid string,
but must be unique for each request. For more information, see
[Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Team.RetrieveJob(JobId) -> Square::Types::RetrieveJobResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a specified job.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.retrieve_job({
  jobId:'job_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**jobId:** `String` — The ID of the job to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Team.UpdateJob(JobId, request) -> Square::Types::UpdateJobResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the title or tip eligibility of a job. Changes to the title propagate to all
`JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job ID. Changes to
tip eligibility propagate to all `TeamMemberWage` objects that reference the job ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team.update_job({
  jobId:'job_id',
  job:{
    title:'Cashier 1',
    is_tip_eligible:true
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**jobId:** `String` — The ID of the job to update.
    
</dd>
</dl>

<dl>
<dd>

**job:** `Square::Types::Job` 

The job with the updated fields, either `title`, `is_tip_eligible`, or both. Only changed fields need
to be included in the request. Optionally include `version` to enable optimistic concurrency control.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Terminal
<details><summary><code>client.Terminal.DismissTerminalAction(ActionId) -> Square::Types::DismissTerminalActionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Dismisses a Terminal action request if the status and type of the request permits it.

See [Link and Dismiss Actions](https://developer.squareup.com/docs/terminal-api/advanced-features/custom-workflows/link-and-dismiss-actions) for more details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.dismiss_terminal_action({
  actionId:'action_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**actionId:** `String` — Unique ID for the `TerminalAction` associated with the action to be dismissed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.DismissTerminalCheckout(CheckoutId) -> Square::Types::DismissTerminalCheckoutResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Dismisses a Terminal checkout request if the status and type of the request permits it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.dismiss_terminal_checkout({
  checkoutId:'checkout_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**checkoutId:** `String` — Unique ID for the `TerminalCheckout` associated with the checkout to be dismissed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.DismissTerminalRefund(TerminalRefundId) -> Square::Types::DismissTerminalRefundResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Dismisses a Terminal refund request if the status and type of the request permits it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.dismiss_terminal_refund({
  terminalRefundId:'terminal_refund_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**terminalRefundId:** `String` — Unique ID for the `TerminalRefund` associated with the refund to be dismissed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TransferOrders
<details><summary><code>client.TransferOrders.Create(request) -> Square::Types::CreateTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new transfer order in [DRAFT](entity:TransferOrderStatus) status. A transfer order represents the intent 
to move [CatalogItemVariation](entity:CatalogItemVariation)s from one [Location](entity:Location) to another. 
The source and destination locations must be different and must belong to your Square account.

In [DRAFT](entity:TransferOrderStatus) status, you can:
- Add or remove items
- Modify quantities
- Update shipping information
- Delete the entire order via [DeleteTransferOrder](api-endpoint:TransferOrders-DeleteTransferOrder)

The request requires source_location_id and destination_location_id.
Inventory levels are not affected until the order is started via 
[StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder).

Common integration points:
- Sync with warehouse management systems
- Automate regular stock transfers
- Initialize transfers from inventory optimization systems

Creates a [transfer_order.created](webhook:transfer_order.created) webhook event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.create({
  idempotencyKey:'65cc0586-3e82-384s-b524-3885cffd52',
  transferOrder:{
    source_location_id:'EXAMPLE_SOURCE_LOCATION_ID_123',
    destination_location_id:'EXAMPLE_DEST_LOCATION_ID_456',
    expected_at:'2025-11-09T05:00:00Z',
    notes:'Example transfer order for inventory redistribution between locations',
    tracking_number:'TRACK123456789',
    created_by_team_member_id:'EXAMPLE_TEAM_MEMBER_ID_789',
    line_items:[{
      item_variation_id:'EXAMPLE_ITEM_VARIATION_ID_001',
      quantity_ordered:'5'
    }, {
      item_variation_id:'EXAMPLE_ITEM_VARIATION_ID_002',
      quantity_ordered:'3'
    }]
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this CreateTransferOrder request. Keys can be
any valid string but must be unique for every CreateTransferOrder request.
    
</dd>
</dl>

<dl>
<dd>

**transferOrder:** `Square::Types::CreateTransferOrderData` — The transfer order to create
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Search(request) -> Square::Types::SearchTransferOrdersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for transfer orders using filters. Returns a paginated list of matching
[TransferOrder](entity:TransferOrder)s sorted by creation date.

Common search scenarios:
- Find orders for a source [Location](entity:Location)
- Find orders for a destination [Location](entity:Location)
- Find orders in a particular [TransferOrderStatus](entity:TransferOrderStatus)
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.search({
  query:{
    filter:{
      source_location_ids:['EXAMPLE_SOURCE_LOCATION_ID_123'],
      destination_location_ids:['EXAMPLE_DEST_LOCATION_ID_456'],
      statuses:[]
    },
    sort:{}
  },
  cursor:'eyJsYXN0X3VwZGF0ZWRfYXQiOjE3NTMxMTg2NjQ4NzN9',
  limit:10
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::TransferOrderQuery` — The search query
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Pagination cursor from a previous search response
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Maximum number of results to return (1-100)
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Get(TransferOrderId) -> Square::Types::RetrieveTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a specific [TransferOrder](entity:TransferOrder) by ID. Returns the complete
order details including:

- Basic information (status, dates, notes)
- Line items with ordered and received quantities
- Source and destination [Location](entity:Location)s
- Tracking information (if available)
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.get({
  transferOrderId:'transfer_order_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferOrderId:** `String` — The ID of the transfer order to retrieve
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Update(TransferOrderId, request) -> Square::Types::UpdateTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing transfer order. This endpoint supports sparse updates,
allowing you to modify specific fields without affecting others.

Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.update({
  transferOrderId:'transfer_order_id',
  idempotencyKey:'f47ac10b-58cc-4372-a567-0e02b2c3d479',
  transferOrder:{
    source_location_id:'EXAMPLE_SOURCE_LOCATION_ID_789',
    destination_location_id:'EXAMPLE_DEST_LOCATION_ID_101',
    expected_at:'2025-11-10T08:00:00Z',
    notes:'Updated: Priority transfer due to low stock at destination',
    tracking_number:'TRACK987654321',
    line_items:[{
      uid:'1',
      quantity_ordered:'7'
    }, {
      item_variation_id:'EXAMPLE_NEW_ITEM_VARIATION_ID_003',
      quantity_ordered:'2'
    }, {
      uid:'2',
      remove:true
    }]
  },
  version:1753109537351
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferOrderId:** `String` — The ID of the transfer order to update
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string that identifies this UpdateTransferOrder request. Keys must contain only alphanumeric characters, dashes and underscores
    
</dd>
</dl>

<dl>
<dd>

**transferOrder:** `Square::Types::UpdateTransferOrderData` — The transfer order updates to apply
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` — Version for optimistic concurrency
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Delete(TransferOrderId) -> Square::Types::DeleteTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a transfer order in [DRAFT](entity:TransferOrderStatus) status.
Only draft orders can be deleted. Once an order is started via 
[StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder), it can no longer be deleted.

Creates a [transfer_order.deleted](webhook:transfer_order.deleted) webhook event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.delete({
  transferOrderId:'transfer_order_id',
  version:1000000
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferOrderId:** `String` — The ID of the transfer order to delete
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` — Version for optimistic concurrency
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Cancel(TransferOrderId, request) -> Square::Types::CancelTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a transfer order in [STARTED](entity:TransferOrderStatus) or 
[PARTIALLY_RECEIVED](entity:TransferOrderStatus) status. Any unreceived quantities will no
longer be receivable and will be immediately returned to the source [Location](entity:Location)'s inventory.

Common reasons for cancellation:
- Items no longer needed at destination
- Source location needs the inventory
- Order created in error

Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.cancel({
  transferOrderId:'transfer_order_id',
  idempotencyKey:'65cc0586-3e82-4d08-b524-3885cffd52',
  version:1753117449752
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferOrderId:** `String` — The ID of the transfer order to cancel. Must be in STARTED or PARTIALLY_RECEIVED status.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this UpdateTransferOrder request. Keys can be
any valid string but must be unique for every UpdateTransferOrder request.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` — Version for optimistic concurrency
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Receive(TransferOrderId, request) -> Square::Types::ReceiveTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records receipt of [CatalogItemVariation](entity:CatalogItemVariation)s for a transfer order.
This endpoint supports partial receiving - you can receive items in multiple batches.

For each line item, you can specify:
- Quantity received in good condition (added to destination inventory with [InventoryState](entity:InventoryState) of IN_STOCK)
- Quantity damaged during transit/handling (added to destination inventory with [InventoryState](entity:InventoryState) of WASTE)
- Quantity canceled (returned to source location's inventory)

The order must be in [STARTED](entity:TransferOrderStatus) or [PARTIALLY_RECEIVED](entity:TransferOrderStatus) status.
Received quantities are added to the destination [Location](entity:Location)'s inventory according to their condition.
Canceled quantities are immediately returned to the source [Location](entity:Location)'s inventory.

When all items are either received, damaged, or canceled, the order moves to
[COMPLETED](entity:TransferOrderStatus) status.

Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.receive({
  transferOrderId:'transfer_order_id',
  idempotencyKey:'EXAMPLE_IDEMPOTENCY_KEY_101',
  receipt:{
    line_items:[{
      transfer_order_line_uid:'transfer_order_line_uid',
      quantity_received:'3',
      quantity_damaged:'1',
      quantity_canceled:'1'
    }, {
      transfer_order_line_uid:'transfer_order_line_uid',
      quantity_received:'2',
      quantity_canceled:'1'
    }]
  },
  version:1753118664873
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferOrderId:** `String` — The ID of the transfer order to receive items for
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — A unique key to make this request idempotent
    
</dd>
</dl>

<dl>
<dd>

**receipt:** `Square::Types::TransferOrderGoodsReceipt` — The receipt details
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` — Version for optimistic concurrency
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TransferOrders.Start(TransferOrderId, request) -> Square::Types::StartTransferOrderResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes a [DRAFT](entity:TransferOrderStatus) transfer order to [STARTED](entity:TransferOrderStatus) status.
This decrements inventory at the source [Location](entity:Location) and marks it as in-transit.

The order must be in [DRAFT](entity:TransferOrderStatus) status and have all required fields populated.
Once started, the order can no longer be deleted, but it can be canceled via 
[CancelTransferOrder](api-endpoint:TransferOrders-CancelTransferOrder).

Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.transfer_orders.start({
  transferOrderId:'transfer_order_id',
  idempotencyKey:'EXAMPLE_IDEMPOTENCY_KEY_789',
  version:1753109537351
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**transferOrderId:** `String` — The ID of the transfer order to start. Must be in DRAFT status.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this UpdateTransferOrder request. Keys can be
any valid string but must be unique for every UpdateTransferOrder request.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` — Version for optimistic concurrency
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Vendors
<details><summary><code>client.Vendors.BatchCreate(request) -> Square::Types::BatchCreateVendorsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates one or more [Vendor](entity:Vendor) objects to represent suppliers to a seller.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.batch_create({
  vendors:{
    '8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe':{
      name:"Joe's Fresh Seafood",
      address:{
        address_line_1:'505 Electric Ave',
        address_line_2:'Suite 600',
        locality:'New York',
        administrative_district_level_1:'NY',
        postal_code:'10003'
      },
      contacts:[{
        name:'Joe Burrow',
        email_address:'joe@joesfreshseafood.com',
        phone_number:'1-212-555-4250',
        ordinal:1
      }],
      account_number:'4025391',
      note:'a vendor'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**vendors:** `Internal::Types::Hash[String, Square::Types::Vendor]` — Specifies a set of new [Vendor](entity:Vendor) objects as represented by a collection of idempotency-key/`Vendor`-object pairs.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Vendors.BatchGet(request) -> Square::Types::BatchGetVendorsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves one or more vendors of specified [Vendor](entity:Vendor) IDs.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.batch_get({
  vendorIds:['INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4']
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**vendorIds:** `Internal::Types::Array[String]` — IDs of the [Vendor](entity:Vendor) objects to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Vendors.BatchUpdate(request) -> Square::Types::BatchUpdateVendorsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates one or more of existing [Vendor](entity:Vendor) objects as suppliers to a seller.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.batch_update({
  vendors:{
    FMCYHBWT1TPL8MFH52PBMEN92A:{
      vendor:{}
    },
    INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4:{
      vendor:{}
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**vendors:** `Internal::Types::Hash[String, Square::Types::UpdateVendorRequest]` 

A set of [UpdateVendorRequest](entity:UpdateVendorRequest) objects encapsulating to-be-updated [Vendor](entity:Vendor)
objects. The set is represented by  a collection of `Vendor`-ID/`UpdateVendorRequest`-object pairs.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Vendors.Create(request) -> Square::Types::CreateVendorResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a single [Vendor](entity:Vendor) object to represent a supplier to a seller.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.create({
  idempotencyKey:'8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe',
  vendor:{
    name:"Joe's Fresh Seafood",
    address:{
      address_line_1:'505 Electric Ave',
      address_line_2:'Suite 600',
      locality:'New York',
      administrative_district_level_1:'NY',
      postal_code:'10003'
    },
    contacts:[{
      name:'Joe Burrow',
      email_address:'joe@joesfreshseafood.com',
      phone_number:'1-212-555-4250',
      ordinal:1
    }],
    account_number:'4025391',
    note:'a vendor'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A client-supplied, universally unique identifier (UUID) to make this [CreateVendor](api-endpoint:Vendors-CreateVendor) call idempotent.

See [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) in the
[API Development 101](https://developer.squareup.com/docs/buildbasics) section for more
information.
    
</dd>
</dl>

<dl>
<dd>

**vendor:** `Square::Types::Vendor` — The requested [Vendor](entity:Vendor) to be created.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Vendors.Search(request) -> Square::Types::SearchVendorsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for vendors using a filter against supported [Vendor](entity:Vendor) properties and a supported sorter.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.search({});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**filter:** `Square::Types::SearchVendorsRequestFilter` — Specifies a filter used to search for vendors.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `Square::Types::SearchVendorsRequestSort` — Specifies a sorter used to sort the returned vendors.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for the original query.

See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Vendors.Get(VendorId) -> Square::Types::GetVendorResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the vendor of a specified [Vendor](entity:Vendor) ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.get({
  vendorId:'vendor_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**vendorId:** `String` — ID of the [Vendor](entity:Vendor) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Vendors.Update(VendorId, request) -> Square::Types::UpdateVendorResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing [Vendor](entity:Vendor) object as a supplier to a seller.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.vendors.update({
  vendorId:'vendor_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**vendorId:** `String` — ID of the [Vendor](entity:Vendor) to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Square::Types::UpdateVendorRequest` 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bookings CustomAttributeDefinitions
<details><summary><code>client.Bookings.CustomAttributeDefinitions.List() -> Square::Types::ListBookingCustomAttributeDefinitionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get all bookings custom attribute definitions.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attribute_definitions.list({
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributeDefinitions.Create(request) -> Square::Types::CreateBookingCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a bookings custom attribute definition.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attribute_definitions.create({
  customAttributeDefinition:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition to create, with the following fields:

- `key`

- `name`. If provided, `name` must be unique (case-sensitive) across all visible booking-related custom attribute
definitions for the seller.

- `description`

- `visibility`. Note that all custom attributes are visible in exported booking data, including those set to
`VISIBILITY_HIDDEN`.

- `schema`. With the exception of the `Selection` data type, the `schema` is specified as a
simple URL to the JSON schema definition hosted on the Square CDN. For more information, see
[Specifying the schema](https://developer.squareup.com/docs/booking-custom-attributes-api/custom-attribute-definitions#specify-schema).
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributeDefinitions.Get(Key) -> Square::Types::RetrieveBookingCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a bookings custom attribute definition.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attribute_definitions.get({
  key:'key',
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute definition to retrieve. If the requesting application
is not the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute definition, which is used for strongly consistent
reads to guarantee that you receive the most up-to-date data. When included in the request,
Square returns the specified version or a higher version if one exists. If the specified version
is higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributeDefinitions.Update(Key, request) -> Square::Types::UpdateBookingCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a bookings custom attribute definition.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attribute_definitions.update({
  key:'key',
  customAttributeDefinition:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to update.
    
</dd>
</dl>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition that contains the fields to update. Only the following fields can be updated:
- `name`
- `description`
- `visibility`
- `schema` for a `Selection` data type. Only changes to the named options or the maximum number of allowed
selections are supported.

For more information, see
[Updatable definition fields](https://developer.squareup.com/docs/booking-custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).

To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control, include the optional `version` field and specify the current version of the custom attribute definition.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributeDefinitions.Delete(Key) -> Square::Types::DeleteBookingCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a bookings custom attribute definition.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attribute_definitions.delete({
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bookings CustomAttributes
<details><summary><code>client.Bookings.CustomAttributes.BatchDelete(request) -> Square::Types::BulkDeleteBookingCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Bulk deletes bookings custom attributes.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attributes.batch_delete({
  values:{
    key:{
      booking_id:'booking_id',
      key:'key'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BookingCustomAttributeDeleteRequest]` 

A map containing 1 to 25 individual Delete requests. For each request, provide an
arbitrary ID that is unique for this `BulkDeleteBookingCustomAttributes` request and the
information needed to delete a custom attribute.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributes.BatchUpsert(request) -> Square::Types::BulkUpsertBookingCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Bulk upserts bookings custom attributes.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attributes.batch_upsert({
  values:{
    key:{
      booking_id:'booking_id',
      custom_attribute:{}
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BookingCustomAttributeUpsertRequest]` 

A map containing 1 to 25 individual upsert requests. For each request, provide an
arbitrary ID that is unique for this `BulkUpsertBookingCustomAttributes` request and the
information needed to create or update a custom attribute.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributes.List(BookingId) -> Square::Types::ListBookingCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists a booking's custom attributes.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attributes.list({
  bookingId:'booking_id',
  limit:1,
  cursor:'cursor',
  withDefinitions:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the target [booking](entity:Booking).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request. For more
information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**withDefinitions:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each
custom attribute. Set this parameter to `true` to get the name and description of each custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributes.Get(BookingId, Key) -> Square::Types::RetrieveBookingCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a bookings custom attribute.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attributes.get({
  bookingId:'booking_id',
  key:'key',
  withDefinition:true,
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the target [booking](entity:Booking).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to retrieve. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**withDefinition:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of
the custom attribute. Set this parameter to `true` to get the name and description of the custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute, which is used for strongly consistent reads to
guarantee that you receive the most up-to-date data. When included in the request, Square
returns the specified version or a higher version if one exists. If the specified version is
higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributes.Upsert(BookingId, Key, request) -> Square::Types::UpsertBookingCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Upserts a bookings custom attribute.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attributes.upsert({
  bookingId:'booking_id',
  key:'key',
  customAttribute:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the target [booking](entity:Booking).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to create or update. This key must match the `key` of a
custom attribute definition in the Square seller account. If the requesting application is not
the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**customAttribute:** `Square::Types::CustomAttribute` 

The custom attribute to create or update, with the following fields:

- `value`. This value must conform to the `schema` specified by the definition.
For more information, see [Value data types](https://developer.squareup.com/docs/booking-custom-attributes-api/custom-attributes#value-data-types).

- `version`. To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control for an update operation, include this optional field and specify the current version
of the custom attribute.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.CustomAttributes.Delete(BookingId, Key) -> Square::Types::DeleteBookingCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a bookings custom attribute.

To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.

For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
or *Appointments Premium*.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.custom_attributes.delete({
  bookingId:'booking_id',
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookingId:** `String` — The ID of the target [booking](entity:Booking).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to delete. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bookings LocationProfiles
<details><summary><code>client.Bookings.LocationProfiles.List() -> Square::Types::ListLocationBookingProfilesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists location booking profiles of a seller.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.location_profiles.list({
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results to return in a paged response.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The pagination cursor from the preceding response to return the next page of the results. Do not set this when retrieving the first page of the results.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bookings TeamMemberProfiles
<details><summary><code>client.Bookings.TeamMemberProfiles.List() -> Square::Types::ListTeamMemberBookingProfilesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists booking profiles for team members.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.team_member_profiles.list({
  bookableOnly:true,
  limit:1,
  cursor:'cursor',
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bookableOnly:** `Internal::Types::Boolean` — Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results to return in a paged response.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — The pagination cursor from the preceding response to return the next page of the results. Do not set this when retrieving the first page of the results.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — Indicates whether to include only team members enabled at the given location in the returned result.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Bookings.TeamMemberProfiles.Get(TeamMemberId) -> Square::Types::GetTeamMemberBookingProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a team member's booking profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.bookings.team_member_profiles.get({
  teamMemberId:'team_member_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberId:** `String` — The ID of the team member to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CashDrawers Shifts
<details><summary><code>client.CashDrawers.Shifts.List() -> Square::Types::ListCashDrawerShiftsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides the details for all of the cash drawer shifts for a location
in a date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cash_drawers.shifts.list({
  locationId:'location_id',
  beginTime:'begin_time',
  endTime:'end_time',
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location to query for a list of cash drawer shifts.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

The order in which cash drawer shifts are listed in the response,
based on their opened_at field. Default value: ASC
    
</dd>
</dl>

<dl>
<dd>

**beginTime:** `String` — The inclusive start time of the query on opened_at, in ISO 8601 format.
    
</dd>
</dl>

<dl>
<dd>

**endTime:** `String` — The exclusive end date of the query on opened_at, in ISO 8601 format.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

Number of cash drawer shift events in a page of results (200 by
default, 1000 max).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Opaque cursor for fetching the next page of results.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CashDrawers.Shifts.Get(ShiftId) -> Square::Types::GetCashDrawerShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides the summary details for a single cash drawer shift. See
[ListCashDrawerShiftEvents](api-endpoint:CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cash_drawers.shifts.get({
  shiftId:'shift_id',
  locationId:'location_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**shiftId:** `String` — The shift ID.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The ID of the location to retrieve cash drawer shifts from.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.CashDrawers.Shifts.ListEvents(ShiftId) -> Square::Types::ListCashDrawerShiftEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides a paginated list of events for a single cash drawer shift.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.cash_drawers.shifts.list_events({
  shiftId:'shift_id',
  locationId:'location_id',
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**shiftId:** `String` — The shift ID.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The ID of the location to list cash drawer shifts for.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

Number of resources to be returned in a page of results (200 by
default, 1000 max).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — Opaque cursor for fetching the next page of results.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Catalog Images
<details><summary><code>client.Catalog.Images.Create(request) -> Square::Types::CreateCatalogImageResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads an image file to be represented by a [CatalogImage](entity:CatalogImage) object that can be linked to an existing
[CatalogObject](entity:CatalogObject) instance. The resulting `CatalogImage` is unattached to any `CatalogObject` if the `object_id`
is not specified.

This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in
JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.images.create({});
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.Images.Update(ImageId, request) -> Square::Types::UpdateCatalogImageResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a new image file to replace the existing one in the specified [CatalogImage](entity:CatalogImage) object.

This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in
JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.images.update({
  imageId:'image_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**imageId:** `String` — The ID of the `CatalogImage` object to update the encapsulated image file.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Catalog Object_
<details><summary><code>client.Catalog.Object_.Upsert(request) -> Square::Types::UpsertCatalogObjectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new or updates the specified [CatalogObject](entity:CatalogObject).

To ensure consistency, only one update request is processed at a time per seller account.
While one (batch or non-batch) update request is being processed, other (batched and non-batched)
update requests are rejected with the `429` error code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.object.upsert({
  idempotencyKey:'af3d1afc-7212-4300-b463-0bfc5314a5ae'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A value you specify that uniquely identifies this
request among all your requests. A common way to create
a valid idempotency key is to use a Universally unique
identifier (UUID).

If you're unsure whether a particular request was successful,
you can reattempt it with the same idempotency key without
worrying about creating duplicate objects.

See [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more information.
    
</dd>
</dl>

<dl>
<dd>

**object:** `Square::Types::CatalogObject` 

A CatalogObject to be created or updated.

- For updates, the object must be active (the `is_deleted` field is not `true`).
- For creates, the object ID must start with `#`. The provided ID is replaced with a server-generated ID.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.Object_.Get(ObjectId) -> Square::Types::GetCatalogObjectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single [CatalogItem](entity:CatalogItem) as a
[CatalogObject](entity:CatalogObject) based on the provided ID. The returned
object includes all of the relevant [CatalogItem](entity:CatalogItem)
information including: [CatalogItemVariation](entity:CatalogItemVariation)
children, references to its
[CatalogModifierList](entity:CatalogModifierList) objects, and the ids of
any [CatalogTax](entity:CatalogTax) objects that apply to it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.object.get({
  objectId:'object_id',
  includeRelatedObjects:true,
  catalogVersion:1000000,
  includeCategoryPathToRoot:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**objectId:** `String` — The object ID of any type of catalog objects to be retrieved.
    
</dd>
</dl>

<dl>
<dd>

**includeRelatedObjects:** `Internal::Types::Boolean` 

If `true`, the response will include additional objects that are related to the
requested objects. Related objects are defined as any objects referenced by ID by the results in the `objects` field
of the response. These objects are put in the `related_objects` field. Setting this to `true` is
helpful when the objects are needed for immediate display to a user.
This process only goes one level deep. Objects referenced by the related objects will not be included. For example,

if the `objects` field of the response contains a CatalogItem, its associated
CatalogCategory objects, CatalogTax objects, CatalogImage objects and
CatalogModifierLists will be returned in the `related_objects` field of the
response. If the `objects` field of the response contains a CatalogItemVariation,
its parent CatalogItem will be returned in the `related_objects` field of
the response.

Default value: `false`
    
</dd>
</dl>

<dl>
<dd>

**catalogVersion:** `Integer` 

Requests objects as of a specific version of the catalog. This allows you to retrieve historical
versions of objects. The value to retrieve a specific version of an object can be found
in the version field of [CatalogObject](entity:CatalogObject)s. If not included, results will
be from the current version of the catalog.
    
</dd>
</dl>

<dl>
<dd>

**includeCategoryPathToRoot:** `Internal::Types::Boolean` 

Specifies whether or not to include the `path_to_root` list for each returned category instance. The `path_to_root` list consists
of `CategoryPathToRootNode` objects and specifies the path that starts with the immediate parent category of the returned category
and ends with its root category. If the returned category is a top-level category, the `path_to_root` list is empty and is not returned
in the response payload.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Catalog.Object_.Delete(ObjectId) -> Square::Types::DeleteCatalogObjectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a single [CatalogObject](entity:CatalogObject) based on the
provided ID and returns the set of successfully deleted IDs in the response.
Deletion is a cascading event such that all children of the targeted object
are also deleted. For example, deleting a [CatalogItem](entity:CatalogItem)
will also delete all of its
[CatalogItemVariation](entity:CatalogItemVariation) children.

To ensure consistency, only one delete request is processed at a time per seller account.
While one (batch or non-batch) delete request is being processed, other (batched and non-batched)
delete requests are rejected with the `429` error code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.catalog.object.delete({
  objectId:'object_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**objectId:** `String` 

The ID of the catalog object to be deleted. When an object is deleted, other
objects in the graph that depend on that object will be deleted as well (for example, deleting a
catalog item will delete its catalog item variations).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Checkout PaymentLinks
<details><summary><code>client.Checkout.PaymentLinks.List() -> Square::Types::ListPaymentLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all payment links.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.payment_links.list({
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
If a cursor is not provided, the endpoint returns the first page of the results.
For more  information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

A limit on the number of results to return per page. The limit is advisory and
the implementation might return more or less results. If the supplied limit is negative, zero, or
greater than the maximum limit of 1000, it is ignored.

Default value: `100`
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.PaymentLinks.Create(request) -> Square::Types::CreatePaymentLinkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a Square-hosted checkout page. Applications can share the resulting payment link with their buyer to pay for goods and services.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.payment_links.create({
  idempotencyKey:'cd9e25dc-d9f2-4430-aedb-61605070e95f',
  quickPay:{
    name:'Auto Detailing',
    price_money:{
      amount:10000
    },
    location_id:'A9Y43N9ABXZBP'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreatePaymentLinkRequest` request.
If you do not provide a unique string (or provide an empty string as the value),
the endpoint treats each request as independent.

For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**description:** `String` 

A description of the payment link. You provide this optional description that is useful in your
application context. It is not used anywhere.
    
</dd>
</dl>

<dl>
<dd>

**quickPay:** `Square::Types::QuickPay` 

Describes an ad hoc item and price for which to generate a quick pay checkout link.
For more information,
see [Quick Pay Checkout](https://developer.squareup.com/docs/checkout-api/quick-pay-checkout).
    
</dd>
</dl>

<dl>
<dd>

**order:** `Square::Types::Order` 

Describes the `Order` for which to create a checkout link.
For more information,
see [Square Order Checkout](https://developer.squareup.com/docs/checkout-api/square-order-checkout).
    
</dd>
</dl>

<dl>
<dd>

**checkoutOptions:** `Square::Types::CheckoutOptions` 

Describes optional fields to add to the resulting checkout page.
For more information,
see [Optional Checkout Configurations](https://developer.squareup.com/docs/checkout-api/optional-checkout-configurations).
    
</dd>
</dl>

<dl>
<dd>

**prePopulatedData:** `Square::Types::PrePopulatedData` 

Describes fields to prepopulate in the resulting checkout page.
For more information, see [Prepopulate the shipping address](https://developer.squareup.com/docs/checkout-api/optional-checkout-configurations#prepopulate-the-shipping-address).
    
</dd>
</dl>

<dl>
<dd>

**paymentNote:** `String` — A note for the payment. After processing the payment, Square adds this note to the resulting `Payment`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.PaymentLinks.Get(Id) -> Square::Types::GetPaymentLinkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a payment link.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.payment_links.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of link to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.PaymentLinks.Update(Id, request) -> Square::Types::UpdatePaymentLinkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a payment link. You can update the `payment_link` fields such as
`description`, `checkout_options`, and  `pre_populated_data`.
You cannot update other fields such as the `order_id`, `version`, `URL`, or `timestamp` field.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.payment_links.update({
  id:'id',
  paymentLink:{
    version:1,
    checkout_options:{
      ask_for_shipping_address:true
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the payment link to update.
    
</dd>
</dl>

<dl>
<dd>

**paymentLink:** `Square::Types::PaymentLink` 

The `payment_link` object describing the updates to apply.
For more information, see [Update a payment link](https://developer.squareup.com/docs/checkout-api/manage-checkout#update-a-payment-link).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Checkout.PaymentLinks.Delete(Id) -> Square::Types::DeletePaymentLinkResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a payment link.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.checkout.payment_links.delete({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the payment link to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers CustomAttributeDefinitions
<details><summary><code>client.Customers.CustomAttributeDefinitions.List() -> Square::Types::ListCustomerCustomAttributeDefinitionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the customer-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.

When all response pages are retrieved, the results include all custom attribute definitions
that are visible to the requesting application, including those that are created by other
applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attribute_definitions.list({
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributeDefinitions.Create(request) -> Square::Types::CreateCustomerCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a customer-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
Use this endpoint to define a custom attribute that can be associated with customer profiles.

A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
for a custom attribute. After the definition is created, you can call
[UpsertCustomerCustomAttribute](api-endpoint:CustomerCustomAttributes-UpsertCustomerCustomAttribute) or
[BulkUpsertCustomerCustomAttributes](api-endpoint:CustomerCustomAttributes-BulkUpsertCustomerCustomAttributes)
to set the custom attribute for customer profiles in the seller's Customer Directory.

Sellers can view all custom attributes in exported customer data, including those set to
`VISIBILITY_HIDDEN`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attribute_definitions.create({
  customAttributeDefinition:{
    key:'favoritemovie',
    schema:{},
    name:'Favorite Movie',
    description:'The favorite movie of the customer.'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition to create. Note the following:
- With the exception of the `Selection` data type, the `schema` is specified as a simple URL to the JSON schema
definition hosted on the Square CDN. For more information, including supported values and constraints, see
[Specifying the schema](https://developer.squareup.com/docs/customer-custom-attributes-api/custom-attribute-definitions#specify-schema).
- If provided, `name` must be unique (case-sensitive) across all visible customer-related custom attribute definitions for the seller.
- All custom attributes are visible in exported customer data, including those set to `VISIBILITY_HIDDEN`.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributeDefinitions.Get(Key) -> Square::Types::GetCustomerCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a customer-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.

To retrieve a custom attribute definition created by another application, the `visibility`
setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attribute_definitions.get({
  key:'key',
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute definition to retrieve. If the requesting application
is not the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute definition, which is used for strongly consistent
reads to guarantee that you receive the most up-to-date data. When included in the request,
Square returns the specified version or a higher version if one exists. If the specified version
is higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributeDefinitions.Update(Key, request) -> Square::Types::UpdateCustomerCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a customer-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.

Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
`schema` for a `Selection` data type.

Only the definition owner can update a custom attribute definition. Note that sellers can view
all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attribute_definitions.update({
  key:'key',
  customAttributeDefinition:{
    description:'Update the description as desired.'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to update.
    
</dd>
</dl>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition that contains the fields to update. This endpoint
supports sparse updates, so only new or changed fields need to be included in the request.
Only the following fields can be updated:

- `name`
- `description`
- `visibility`
- `schema` for a `Selection` data type. Only changes to the named options or the maximum number of allowed
selections are supported.

For more information, see
[Updatable definition fields](https://developer.squareup.com/docs/customer-custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).

To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) 
control, include the optional `version` field and specify the current version of the custom attribute definition.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributeDefinitions.Delete(Key) -> Square::Types::DeleteCustomerCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a customer-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.

Deleting a custom attribute definition also deletes the corresponding custom attribute from
all customer profiles in the seller's Customer Directory.

Only the definition owner can delete a custom attribute definition.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attribute_definitions.delete({
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributeDefinitions.BatchUpsert(request) -> Square::Types::BatchUpsertCustomerCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates [custom attributes](entity:CustomAttribute) for customer profiles as a bulk operation.

Use this endpoint to set the value of one or more custom attributes for one or more customer profiles.
A custom attribute is based on a custom attribute definition in a Square seller account, which is
created using the [CreateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition) endpoint.

This `BulkUpsertCustomerCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
requests and returns a map of individual upsert responses. Each upsert request has a unique ID
and provides a customer ID and custom attribute. Each upsert response is returned with the ID
of the corresponding request.

To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attribute_definitions.batch_upsert({
  values:{
    id1:{
      customer_id:'N3NCVYY3WS27HF0HKANA3R9FP8',
      custom_attribute:{
        key:'favoritemovie'
      }
    },
    id2:{
      customer_id:'SY8EMWRNDN3TQDP2H4KS1QWMMM',
      custom_attribute:{
        key:'ownsmovie'
      }
    },
    id3:{
      customer_id:'SY8EMWRNDN3TQDP2H4KS1QWMMM',
      custom_attribute:{
        key:'favoritemovie'
      }
    },
    id4:{
      customer_id:'N3NCVYY3WS27HF0HKANA3R9FP8',
      custom_attribute:{
        key:'square:a0f1505a-2aa1-490d-91a8-8d31ff181808'
      }
    },
    id5:{
      customer_id:'70548QG1HN43B05G0KCZ4MMC1G',
      custom_attribute:{
        key:'sq0ids-0evKIskIGaY45fCyNL66aw:backupemail'
      }
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BatchUpsertCustomerCustomAttributesRequestCustomerCustomAttributeUpsertRequest]` 

A map containing 1 to 25 individual upsert requests. For each request, provide an
arbitrary ID that is unique for this `BulkUpsertCustomerCustomAttributes` request and the
information needed to create or update a custom attribute.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers Groups
<details><summary><code>client.Customers.Groups.List() -> Square::Types::ListCustomerGroupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the list of customer groups of a business.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.list({
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for your original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.
If the limit is less than 1 or greater than 50, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Groups.Create(request) -> Square::Types::CreateCustomerGroupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new customer group for a business.

The request must include the `name` value of the group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.create({
  group:{
    name:'Loyal Customers'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — The idempotency key for the request. For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>

<dl>
<dd>

**group:** `Square::Types::CustomerGroup` — The customer group to create.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Groups.Get(GroupId) -> Square::Types::GetCustomerGroupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a specific customer group as identified by the `group_id` value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.get({
  groupId:'group_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**groupId:** `String` — The ID of the customer group to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Groups.Update(GroupId, request) -> Square::Types::UpdateCustomerGroupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a customer group as identified by the `group_id` value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.update({
  groupId:'group_id',
  group:{
    name:'Loyal Customers'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**groupId:** `String` — The ID of the customer group to update.
    
</dd>
</dl>

<dl>
<dd>

**group:** `Square::Types::CustomerGroup` — The `CustomerGroup` object including all the updates you want to make.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Groups.Delete(GroupId) -> Square::Types::DeleteCustomerGroupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a customer group as identified by the `group_id` value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.delete({
  groupId:'group_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**groupId:** `String` — The ID of the customer group to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Groups.Add(CustomerId, GroupId) -> Square::Types::AddGroupToCustomerResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a group membership to a customer.

The customer is identified by the `customer_id` value
and the customer group is identified by the `group_id` value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.add({
  customerId:'customer_id',
  groupId:'group_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to add to a group.
    
</dd>
</dl>

<dl>
<dd>

**groupId:** `String` — The ID of the customer group to add the customer to.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Groups.Remove(CustomerId, GroupId) -> Square::Types::RemoveGroupFromCustomerResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes a group membership from a customer.

The customer is identified by the `customer_id` value
and the customer group is identified by the `group_id` value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.groups.remove({
  customerId:'customer_id',
  groupId:'group_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the customer to remove from the group.
    
</dd>
</dl>

<dl>
<dd>

**groupId:** `String` — The ID of the customer group to remove the customer from.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers Segments
<details><summary><code>client.Customers.Segments.List() -> Square::Types::ListCustomerSegmentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the list of customer segments of a business.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.segments.list({
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by previous calls to `ListCustomerSegments`.
This cursor is used to retrieve the next set of query results.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.
If the specified limit is less than 1 or greater than 50, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Segments.Get(SegmentId) -> Square::Types::GetCustomerSegmentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a specific customer segment as identified by the `segment_id` value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.segments.get({
  segmentId:'segment_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**segmentId:** `String` — The Square-issued ID of the customer segment.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers Cards
<details><summary><code>client.Customers.Cards.Create(CustomerId, request) -> Square::Types::CreateCustomerCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a card on file to an existing customer.

As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
calls with the same card nonce return the same card record that was created
with the provided nonce during the _first_ call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.cards.create({
  customerId:'customer_id',
  cardNonce:'YOUR_CARD_NONCE',
  billingAddress:{
    address_line_1:'500 Electric Ave',
    address_line_2:'Suite 600',
    locality:'New York',
    administrative_district_level_1:'NY',
    postal_code:'10003'
  },
  cardholderName:'Amelia Earhart'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The Square ID of the customer profile the card is linked to.
    
</dd>
</dl>

<dl>
<dd>

**cardNonce:** `String` 

A card nonce representing the credit card to link to the customer.

Card nonces are generated by the Square payment form when customers enter
their card information. For more information, see
[Walkthrough: Integrate Square Payments in a Website](https://developer.squareup.com/docs/web-payments/take-card-payment).

__NOTE:__ Card nonces generated by digital wallets (such as Apple Pay)
cannot be used to create a customer card.
    
</dd>
</dl>

<dl>
<dd>

**billingAddress:** `Square::Types::Address` 

Address information for the card on file.

__NOTE:__ If a billing address is provided in the request, the
`CreateCustomerCardRequest.billing_address.postal_code` must match
the postal code encoded in the card nonce.
    
</dd>
</dl>

<dl>
<dd>

**cardholderName:** `String` — The full name printed on the credit card.
    
</dd>
</dl>

<dl>
<dd>

**verificationToken:** `String` 

An identifying token generated by [Payments.verifyBuyer()](https://developer.squareup.com/reference/sdks/web/payments/objects/Payments#Payments.verifyBuyer).
Verification tokens encapsulate customer device information and 3-D Secure
challenge results to indicate that Square has verified the buyer identity.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.Cards.Delete(CustomerId, CardId) -> Square::Types::DeleteCustomerCardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes a card on file from a customer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.cards.delete({
  customerId:'customer_id',
  cardId:'card_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the customer that the card on file belongs to.
    
</dd>
</dl>

<dl>
<dd>

**cardId:** `String` — The ID of the card on file to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Customers CustomAttributes
<details><summary><code>client.Customers.CustomAttributes.List(CustomerId) -> Square::Types::ListCustomerCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the [custom attributes](entity:CustomAttribute) associated with a customer profile.

You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
in the same call.

When all response pages are retrieved, the results include all custom attributes that are
visible to the requesting application, including those that are owned by other applications
and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attributes.list({
  customerId:'customer_id',
  limit:1,
  cursor:'cursor',
  withDefinitions:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the target [customer profile](entity:Customer).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request. For more
information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**withDefinitions:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each
custom attribute. Set this parameter to `true` to get the name and description of each custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributes.Get(CustomerId, Key) -> Square::Types::GetCustomerCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a [custom attribute](entity:CustomAttribute) associated with a customer profile.

You can use the `with_definition` query parameter to also retrieve the custom attribute definition
in the same call.

To retrieve a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attributes.get({
  customerId:'customer_id',
  key:'key',
  withDefinition:true,
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the target [customer profile](entity:Customer).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to retrieve. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**withDefinition:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of
the custom attribute. Set this parameter to `true` to get the name and description of the custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute, which is used for strongly consistent reads to
guarantee that you receive the most up-to-date data. When included in the request, Square
returns the specified version or a higher version if one exists. If the specified version is
higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributes.Upsert(CustomerId, Key, request) -> Square::Types::UpsertCustomerCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates a [custom attribute](entity:CustomAttribute) for a customer profile.

Use this endpoint to set the value of a custom attribute for a specified customer profile.
A custom attribute is based on a custom attribute definition in a Square seller account, which
is created using the [CreateCustomerCustomAttributeDefinition](api-endpoint:CustomerCustomAttributes-CreateCustomerCustomAttributeDefinition) endpoint.

To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attributes.upsert({
  customerId:'customer_id',
  key:'key',
  customAttribute:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the target [customer profile](entity:Customer).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to create or update. This key must match the `key` of a
custom attribute definition in the Square seller account. If the requesting application is not
the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**customAttribute:** `Square::Types::CustomAttribute` 

The custom attribute to create or update, with the following fields:

- `value`. This value must conform to the `schema` specified by the definition. 
For more information, see [Value data types](https://developer.squareup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).

- `version`. To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control for an update operation, include this optional field and specify the current version
of the custom attribute.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Customers.CustomAttributes.Delete(CustomerId, Key) -> Square::Types::DeleteCustomerCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a [custom attribute](entity:CustomAttribute) associated with a customer profile.

To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.customers.custom_attributes.delete({
  customerId:'customer_id',
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customerId:** `String` — The ID of the target [customer profile](entity:Customer).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to delete. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Devices Codes
<details><summary><code>client.Devices.Codes.List() -> Square::Types::ListDeviceCodesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all DeviceCodes associated with the merchant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.devices.codes.list({
  cursor:'cursor',
  locationId:'location_id',
  productType:'TERMINAL_API'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for your original query.

See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

If specified, only returns DeviceCodes of the specified location.
Returns DeviceCodes of all locations if empty.
    
</dd>
</dl>

<dl>
<dd>

**productType:** `String` 

If specified, only returns DeviceCodes targeting the specified product type.
Returns DeviceCodes of all product types if empty.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Square::Types::DeviceCodeStatus` 

If specified, returns DeviceCodes with the specified statuses.
Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Devices.Codes.Create(request) -> Square::Types::CreateDeviceCodeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a DeviceCode that can be used to login to a Square Terminal device to enter the connected
terminal mode.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.devices.codes.create({
  idempotencyKey:'01bb00a6-0c86-4770-94ed-f5fca973cd56',
  deviceCode:{
    name:'Counter 1',
    product_type:'TERMINAL_API',
    location_id:'B5E4484SHHNYH'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this CreateDeviceCode request. Keys can
be any valid string but must be unique for every CreateDeviceCode request.

See [Idempotency keys](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more information.
    
</dd>
</dl>

<dl>
<dd>

**deviceCode:** `Square::Types::DeviceCode` — The device code to create.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Devices.Codes.Get(Id) -> Square::Types::GetDeviceCodeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves DeviceCode with the associated ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.devices.codes.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier for the device code.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Disputes Evidence
<details><summary><code>client.Disputes.Evidence.List(DisputeId) -> Square::Types::ListDisputeEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of evidence associated with a dispute.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.evidence.list({
  disputeId:'dispute_id',
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.Evidence.Get(DisputeId, EvidenceId) -> Square::Types::GetDisputeEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the metadata for the evidence specified in the request URL path.

You must maintain a copy of any evidence uploaded if you want to reference it later. Evidence cannot be downloaded after you upload it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.evidence.get({
  disputeId:'dispute_id',
  evidenceId:'evidence_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute from which you want to retrieve evidence metadata.
    
</dd>
</dl>

<dl>
<dd>

**evidenceId:** `String` — The ID of the evidence to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Disputes.Evidence.Delete(DisputeId, EvidenceId) -> Square::Types::DeleteDisputeEvidenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes specified evidence from a dispute.
Square does not send the bank any evidence that is removed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.disputes.evidence.delete({
  disputeId:'dispute_id',
  evidenceId:'evidence_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**disputeId:** `String` — The ID of the dispute from which you want to remove evidence.
    
</dd>
</dl>

<dl>
<dd>

**evidenceId:** `String` — The ID of the evidence you want to remove.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## GiftCards Activities
<details><summary><code>client.GiftCards.Activities.List() -> Square::Types::ListGiftCardActivitiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists gift card activities. By default, you get gift card activities for all
gift cards in the seller's account. You can optionally specify query parameters to
filter the list. For example, you can get a list of gift card activities for a gift card,
for all gift cards in a specific region, or for activities within a time window.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.activities.list({
  giftCardId:'gift_card_id',
  type:'type',
  locationId:'location_id',
  beginTime:'begin_time',
  endTime:'end_time',
  limit:1,
  cursor:'cursor',
  sortOrder:'sort_order'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**giftCardId:** `String` 

If a gift card ID is provided, the endpoint returns activities related 
to the specified gift card. Otherwise, the endpoint returns all gift card activities for 
the seller.
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` 

If a [type](entity:GiftCardActivityType) is provided, the endpoint returns gift card activities of the specified type. 
Otherwise, the endpoint returns all types of gift card activities.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` 

If a location ID is provided, the endpoint returns gift card activities for the specified location. 
Otherwise, the endpoint returns gift card activities for all locations.
    
</dd>
</dl>

<dl>
<dd>

**beginTime:** `String` 

The timestamp for the beginning of the reporting period, in RFC 3339 format.
This start time is inclusive. The default value is the current time minus one year.
    
</dd>
</dl>

<dl>
<dd>

**endTime:** `String` 

The timestamp for the end of the reporting period, in RFC 3339 format.
This end time is inclusive. The default value is the current time.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

If a limit is provided, the endpoint returns the specified number 
of results (or fewer) per page. The maximum value is 100. The default value is 50.
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
If a cursor is not provided, the endpoint returns the first page of the results.
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `String` 

The order in which the endpoint returns the activities, based on `created_at`.
- `ASC` - Oldest to newest.
- `DESC` - Newest to oldest (default).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.GiftCards.Activities.Create(request) -> Square::Types::CreateGiftCardActivityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a gift card activity to manage the balance or state of a [gift card](entity:GiftCard).
For example, create an `ACTIVATE` activity to activate a gift card with an initial balance before first use.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.gift_cards.activities.create({
  idempotencyKey:'U16kfr-kA70er-q4Rsym-7U7NnY',
  giftCardActivity:{
    location_id:'81FN9BNFZTKS4',
    gift_card_id:'gftc:6d55a72470d940c6ba09c0ab8ad08d20',
    activate_activity_details:{
      order_id:'jJNGHm4gLI6XkFbwtiSLqK72KkAZY',
      line_item_uid:'eIWl7X0nMuO9Ewbh0ChIx'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string that identifies the `CreateGiftCardActivity` request.
    
</dd>
</dl>

<dl>
<dd>

**giftCardActivity:** `Square::Types::GiftCardActivity` 

The activity to create for the gift card. This activity must specify `gift_card_id` or `gift_card_gan` for the target
gift card, the `location_id` where the activity occurred, and the activity `type` along with the corresponding activity details.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Labor BreakTypes
<details><summary><code>client.Labor.BreakTypes.List() -> Square::Types::ListBreakTypesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of `BreakType` instances for a business.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.break_types.list({
  locationId:'location_id',
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` 

Filter the returned `BreakType` results to only those that are associated with the
specified location.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of `BreakType` results to return per page. The number can range between 1
and 200. The default is 200.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A pointer to the next page of `BreakType` results to fetch.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.BreakTypes.Create(request) -> Square::Types::CreateBreakTypeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new `BreakType`.

A `BreakType` is a template for creating `Break` objects.
You must provide the following values in your request to this
endpoint:

- `location_id`
- `break_name`
- `expected_duration`
- `is_paid`

You can only have three `BreakType` instances per location. If you attempt to add a fourth
`BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3 breaks per location."
is returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.break_types.create({
  idempotencyKey:'PAD3NG5KSN2GL',
  breakType:{
    location_id:'CGJN03P1D08GF',
    break_name:'Lunch Break',
    expected_duration:'PT30M',
    is_paid:true
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string value to ensure the idempotency of the operation.
    
</dd>
</dl>

<dl>
<dd>

**breakType:** `Square::Types::BreakType` — The `BreakType` to be created.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.BreakTypes.Get(Id) -> Square::Types::GetBreakTypeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single `BreakType` specified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.break_types.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `BreakType` being retrieved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.BreakTypes.Update(Id, request) -> Square::Types::UpdateBreakTypeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing `BreakType`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.break_types.update({
  id:'id',
  breakType:{
    location_id:'26M7H24AZ9N6R',
    break_name:'Lunch',
    expected_duration:'PT50M',
    is_paid:true,
    version:1
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` —  The UUID for the `BreakType` being updated.
    
</dd>
</dl>

<dl>
<dd>

**breakType:** `Square::Types::BreakType` — The updated `BreakType`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.BreakTypes.Delete(Id) -> Square::Types::DeleteBreakTypeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an existing `BreakType`.

A `BreakType` can be deleted even if it is referenced from a `Shift`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.break_types.delete({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `BreakType` being deleted.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Labor EmployeeWages
<details><summary><code>client.Labor.EmployeeWages.List() -> Square::Types::ListEmployeeWagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of `EmployeeWage` instances for a business.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.employee_wages.list({
  employeeId:'employee_id',
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**employeeId:** `String` — Filter the returned wages to only those that are associated with the specified employee.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of `EmployeeWage` results to return per page. The number can range between
1 and 200. The default is 200.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A pointer to the next page of `EmployeeWage` results to fetch.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.EmployeeWages.Get(Id) -> Square::Types::GetEmployeeWageResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single `EmployeeWage` specified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.employee_wages.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `EmployeeWage` being retrieved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Labor Shifts
<details><summary><code>client.Labor.Shifts.Create(request) -> Square::Types::CreateShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new `Shift`.

A `Shift` represents a complete workday for a single team member.
You must provide the following values in your request to this
endpoint:

- `location_id`
- `team_member_id`
- `start_at`

An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when:
- The `status` of the new `Shift` is `OPEN` and the team member has another
shift with an `OPEN` status.
- The `start_at` date is in the future.
- The `start_at` or `end_at` date overlaps another shift for the same team member.
- The `Break` instances are set in the request and a break `start_at`
is before the `Shift.start_at`, a break `end_at` is after
the `Shift.end_at`, or both.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.shifts.create({
  idempotencyKey:'HIDSNG5KS478L',
  shift:{
    location_id:'PAA1RJZZKXBFG',
    start_at:'2019-01-25T03:11:00-05:00',
    end_at:'2019-01-25T13:11:00-05:00',
    wage:{
      title:'Barista',
      hourly_rate:{
        amount:1100
      },
      tip_eligible:true
    },
    breaks:[{
      start_at:'2019-01-25T06:11:00-05:00',
      end_at:'2019-01-25T06:16:00-05:00',
      break_type_id:'REGS1EQR1TPZ5',
      name:'Tea Break',
      expected_duration:'PT5M',
      is_paid:true
    }],
    team_member_id:'ormj0jJJZ5OZIzxrZYJI',
    declared_cash_tip_money:{
      amount:500
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string value to ensure the idempotency of the operation.
    
</dd>
</dl>

<dl>
<dd>

**shift:** `Square::Types::Shift` — The `Shift` to be created.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.Shifts.Search(request) -> Square::Types::SearchShiftsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of `Shift` records for a business.
The list to be returned can be filtered by:
- Location IDs
- Team member IDs
- Shift status (`OPEN` or `CLOSED`)
- Shift start
- Shift end
- Workday details

The list can be sorted by:
- `START_AT`
- `END_AT`
- `CREATED_AT`
- `UPDATED_AT`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.shifts.search({
  query:{
    filter:{
      workday:{
        date_range:{
          start_date:'2019-01-20',
          end_date:'2019-02-03'
        },
        default_timezone:'America/Los_Angeles'
      }
    }
  },
  limit:100
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::ShiftQuery` — Query filters.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The number of resources in a page (200 by default).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — An opaque cursor for fetching the next page.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.Shifts.Get(Id) -> Square::Types::GetShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single `Shift` specified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.shifts.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `Shift` being retrieved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.Shifts.Update(Id, request) -> Square::Types::UpdateShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing `Shift`.

When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift` have
the `end_at` property set to a valid RFC-3339 datetime string.

When closing a `Shift`, all `Break` instances in the `Shift` must be complete with `end_at`
set on each `Break`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.shifts.update({
  id:'id',
  shift:{
    location_id:'PAA1RJZZKXBFG',
    start_at:'2019-01-25T03:11:00-05:00',
    end_at:'2019-01-25T13:11:00-05:00',
    wage:{
      title:'Bartender',
      hourly_rate:{
        amount:1500
      },
      tip_eligible:true
    },
    breaks:[{
      id:'X7GAQYVVRRG6P',
      start_at:'2019-01-25T06:11:00-05:00',
      end_at:'2019-01-25T06:16:00-05:00',
      break_type_id:'REGS1EQR1TPZ5',
      name:'Tea Break',
      expected_duration:'PT5M',
      is_paid:true
    }],
    version:1,
    team_member_id:'ormj0jJJZ5OZIzxrZYJI',
    declared_cash_tip_money:{
      amount:500
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the object being updated.
    
</dd>
</dl>

<dl>
<dd>

**shift:** `Square::Types::Shift` — The updated `Shift` object.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.Shifts.Delete(Id) -> Square::Types::DeleteShiftResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a `Shift`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.shifts.delete({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `Shift` being deleted.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Labor TeamMemberWages
<details><summary><code>client.Labor.TeamMemberWages.List() -> Square::Types::ListTeamMemberWagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of `TeamMemberWage` instances for a business.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.team_member_wages.list({
  teamMemberId:'team_member_id',
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberId:** `String` 

Filter the returned wages to only those that are associated with the
specified team member.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of `TeamMemberWage` results to return per page. The number can range between
1 and 200. The default is 200.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A pointer to the next page of `EmployeeWage` results to fetch.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.TeamMemberWages.Get(Id) -> Square::Types::GetTeamMemberWageResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single `TeamMemberWage` specified by `id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.team_member_wages.get({
  id:'id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `TeamMemberWage` being retrieved.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Labor WorkweekConfigs
<details><summary><code>client.Labor.WorkweekConfigs.List() -> Square::Types::ListWorkweekConfigsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of `WorkweekConfig` instances for a business.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.workweek_configs.list({
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**limit:** `Integer` — The maximum number of `WorkweekConfigs` results to return per page.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` — A pointer to the next page of `WorkweekConfig` results to fetch.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Labor.WorkweekConfigs.Get(Id, request) -> Square::Types::UpdateWorkweekConfigResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a `WorkweekConfig`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.labor.workweek_configs.get({
  id:'id',
  workweekConfig:{
    start_of_day_local_time:'10:00',
    version:10
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The UUID for the `WorkweekConfig` object being updated.
    
</dd>
</dl>

<dl>
<dd>

**workweekConfig:** `Square::Types::WorkweekConfig` — The updated `WorkweekConfig` object.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Locations CustomAttributeDefinitions
<details><summary><code>client.Locations.CustomAttributeDefinitions.List() -> Square::Types::ListLocationCustomAttributeDefinitionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the location-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.
When all response pages are retrieved, the results include all custom attribute definitions
that are visible to the requesting application, including those that are created by other
applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attribute_definitions.list({
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**visibilityFilter:** `Square::Types::VisibilityFilter` — Filters the `CustomAttributeDefinition` results by their `visibility` values.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributeDefinitions.Create(request) -> Square::Types::CreateLocationCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a location-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
Use this endpoint to define a custom attribute that can be associated with locations.
A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
for a custom attribute. After the definition is created, you can call
[UpsertLocationCustomAttribute](api-endpoint:LocationCustomAttributes-UpsertLocationCustomAttribute) or
[BulkUpsertLocationCustomAttributes](api-endpoint:LocationCustomAttributes-BulkUpsertLocationCustomAttributes)
to set the custom attribute for locations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attribute_definitions.create({
  customAttributeDefinition:{
    key:'bestseller',
    schema:{},
    name:'Bestseller',
    description:'Bestselling item at location'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition to create. Note the following:
- With the exception of the `Selection` data type, the `schema` is specified as a simple URL to the JSON schema
definition hosted on the Square CDN. For more information, including supported values and constraints, see
[Supported data types](https://developer.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
- `name` is required unless `visibility` is set to `VISIBILITY_HIDDEN`.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributeDefinitions.Get(Key) -> Square::Types::RetrieveLocationCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a location-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
To retrieve a custom attribute definition created by another application, the `visibility`
setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attribute_definitions.get({
  key:'key',
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute definition to retrieve. If the requesting application
is not the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute definition, which is used for strongly consistent
reads to guarantee that you receive the most up-to-date data. When included in the request,
Square returns the specified version or a higher version if one exists. If the specified version
is higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributeDefinitions.Update(Key, request) -> Square::Types::UpdateLocationCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a location-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
`schema` for a `Selection` data type.
Only the definition owner can update a custom attribute definition.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attribute_definitions.update({
  key:'key',
  customAttributeDefinition:{
    description:'Update the description as desired.'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to update.
    
</dd>
</dl>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition that contains the fields to update. This endpoint
supports sparse updates, so only new or changed fields need to be included in the request.
Only the following fields can be updated:
- `name`
- `description`
- `visibility`
- `schema` for a `Selection` data type. Only changes to the named options or the maximum number of allowed
selections are supported.

For more information, see
[Update a location custom attribute definition](https://developer.squareup.com/docs/location-custom-attributes-api/custom-attribute-definitions#update-custom-attribute-definition).
To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control, specify the current version of the custom attribute definition. 
If this is not important for your application, `version` can be set to -1.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributeDefinitions.Delete(Key) -> Square::Types::DeleteLocationCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a location-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
Deleting a custom attribute definition also deletes the corresponding custom attribute from
all locations.
Only the definition owner can delete a custom attribute definition.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attribute_definitions.delete({
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Locations CustomAttributes
<details><summary><code>client.Locations.CustomAttributes.BatchDelete(request) -> Square::Types::BulkDeleteLocationCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes [custom attributes](entity:CustomAttribute) for locations as a bulk operation.
To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attributes.batch_delete({
  values:{
    id1:{
      key:'bestseller'
    },
    id2:{
      key:'bestseller'
    },
    id3:{
      key:'phone-number'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BulkDeleteLocationCustomAttributesRequestLocationCustomAttributeDeleteRequest]` 

The data used to update the `CustomAttribute` objects.
The keys must be unique and are used to map to the corresponding response.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributes.BatchUpsert(request) -> Square::Types::BulkUpsertLocationCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates [custom attributes](entity:CustomAttribute) for locations as a bulk operation.
Use this endpoint to set the value of one or more custom attributes for one or more locations.
A custom attribute is based on a custom attribute definition in a Square seller account, which is
created using the [CreateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition) endpoint.
This `BulkUpsertLocationCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
requests and returns a map of individual upsert responses. Each upsert request has a unique ID
and provides a location ID and custom attribute. Each upsert response is returned with the ID
of the corresponding request.
To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attributes.batch_upsert({
  values:{
    id1:{
      location_id:'L0TBCBTB7P8RQ',
      custom_attribute:{
        key:'bestseller'
      }
    },
    id2:{
      location_id:'L9XMD04V3STJX',
      custom_attribute:{
        key:'bestseller'
      }
    },
    id3:{
      location_id:'L0TBCBTB7P8RQ',
      custom_attribute:{
        key:'phone-number'
      }
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BulkUpsertLocationCustomAttributesRequestLocationCustomAttributeUpsertRequest]` 

A map containing 1 to 25 individual upsert requests. For each request, provide an
arbitrary ID that is unique for this `BulkUpsertLocationCustomAttributes` request and the
information needed to create or update a custom attribute.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributes.List(LocationId) -> Square::Types::ListLocationCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the [custom attributes](entity:CustomAttribute) associated with a location.
You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
in the same call.
When all response pages are retrieved, the results include all custom attributes that are
visible to the requesting application, including those that are owned by other applications
and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attributes.list({
  locationId:'location_id',
  limit:1,
  cursor:'cursor',
  withDefinitions:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the target [location](entity:Location).
    
</dd>
</dl>

<dl>
<dd>

**visibilityFilter:** `Square::Types::VisibilityFilter` — Filters the `CustomAttributeDefinition` results by their `visibility` values.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request. For more
information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**withDefinitions:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each
custom attribute. Set this parameter to `true` to get the name and description of each custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributes.Get(LocationId, Key) -> Square::Types::RetrieveLocationCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a [custom attribute](entity:CustomAttribute) associated with a location.
You can use the `with_definition` query parameter to also retrieve the custom attribute definition
in the same call.
To retrieve a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attributes.get({
  locationId:'location_id',
  key:'key',
  withDefinition:true,
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the target [location](entity:Location).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to retrieve. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**withDefinition:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of
the custom attribute. Set this parameter to `true` to get the name and description of the custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute, which is used for strongly consistent reads to
guarantee that you receive the most up-to-date data. When included in the request, Square
returns the specified version or a higher version if one exists. If the specified version is
higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributes.Upsert(LocationId, Key, request) -> Square::Types::UpsertLocationCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates a [custom attribute](entity:CustomAttribute) for a location.
Use this endpoint to set the value of a custom attribute for a specified location.
A custom attribute is based on a custom attribute definition in a Square seller account, which
is created using the [CreateLocationCustomAttributeDefinition](api-endpoint:LocationCustomAttributes-CreateLocationCustomAttributeDefinition) endpoint.
To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attributes.upsert({
  locationId:'location_id',
  key:'key',
  customAttribute:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the target [location](entity:Location).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to create or update. This key must match the `key` of a
custom attribute definition in the Square seller account. If the requesting application is not
the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**customAttribute:** `Square::Types::CustomAttribute` 

The custom attribute to create or update, with the following fields:
- `value`. This value must conform to the `schema` specified by the definition.
For more information, see [Supported data types](https://developer.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
- `version`. To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control for an update operation, include the current version of the custom attribute.
If this is not important for your application, version can be set to -1.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.CustomAttributes.Delete(LocationId, Key) -> Square::Types::DeleteLocationCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a [custom attribute](entity:CustomAttribute) associated with a location.
To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.custom_attributes.delete({
  locationId:'location_id',
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the target [location](entity:Location).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to delete. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Locations Transactions
<details><summary><code>client.Locations.Transactions.List(LocationId) -> Square::Types::ListTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists transactions for a particular location.

Transactions include payment information from sales and exchanges and refund
information from returns and exchanges.

Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.transactions.list({
  locationId:'location_id',
  beginTime:'begin_time',
  endTime:'end_time',
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the location to list transactions for.
    
</dd>
</dl>

<dl>
<dd>

**beginTime:** `String` 

The beginning of the requested reporting period, in RFC 3339 format.

See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.

Default value: The current time minus one year.
    
</dd>
</dl>

<dl>
<dd>

**endTime:** `String` 

The end of the requested reporting period, in RFC 3339 format.

See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.

Default value: The current time.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

The order in which results are listed in the response (`ASC` for
oldest first, `DESC` for newest first).

Default value: `DESC`
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for your original query.

See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Transactions.Get(LocationId, TransactionId) -> Square::Types::GetTransactionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves details for a single transaction.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.transactions.get({
  locationId:'location_id',
  transactionId:'transaction_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — The ID of the transaction's associated location.
    
</dd>
</dl>

<dl>
<dd>

**transactionId:** `String` — The ID of the transaction to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Transactions.Capture(LocationId, TransactionId) -> Square::Types::CaptureTransactionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Captures a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
endpoint with a `delay_capture` value of `true`.


See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
for more information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.transactions.capture({
  locationId:'location_id',
  transactionId:'transaction_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — 
    
</dd>
</dl>

<dl>
<dd>

**transactionId:** `String` — 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Locations.Transactions.Void(LocationId, TransactionId) -> Square::Types::VoidTransactionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a transaction that was created with the [Charge](api-endpoint:Transactions-Charge)
endpoint with a `delay_capture` value of `true`.


See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture)
for more information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.locations.transactions.void({
  locationId:'location_id',
  transactionId:'transaction_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**locationId:** `String` — 
    
</dd>
</dl>

<dl>
<dd>

**transactionId:** `String` — 
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Loyalty Accounts
<details><summary><code>client.Loyalty.Accounts.Create(request) -> Square::Types::CreateLoyaltyAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a loyalty account. To create a loyalty account, you must provide the `program_id` and a `mapping` with the `phone_number` of the buyer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.accounts.create({
  loyaltyAccount:{
    program_id:'d619f755-2d17-41f3-990d-c04ecedd64dd',
    mapping:{
      phone_number:'+14155551234'
    }
  },
  idempotencyKey:'ec78c477-b1c3-4899-a209-a4e71337c996'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**loyaltyAccount:** `Square::Types::LoyaltyAccount` — The loyalty account to create.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreateLoyaltyAccount` request. 
Keys can be any valid string, but must be unique for every request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Accounts.Search(request) -> Square::Types::SearchLoyaltyAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for loyalty accounts in a loyalty program.

You can search for a loyalty account using the phone number or customer ID associated with the account. To return all loyalty accounts, specify an empty `query` object or omit it entirely.

Search results are sorted by `created_at` in ascending order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.accounts.search({
  query:{
    mappings:[{
      phone_number:'+14155551234'
    }]
  },
  limit:10
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::SearchLoyaltyAccountsRequestLoyaltyAccountQuery` — The search criteria for the request.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results to include in the response. The default value is 30.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to 
this endpoint. Provide this to retrieve the next set of 
results for the original query.

For more information, 
see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Accounts.Get(AccountId) -> Square::Types::GetLoyaltyAccountResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a loyalty account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.accounts.get({
  accountId:'account_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The ID of the [loyalty account](entity:LoyaltyAccount) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Accounts.AccumulatePoints(AccountId, request) -> Square::Types::AccumulateLoyaltyPointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds points earned from a purchase to a [loyalty account](entity:LoyaltyAccount).

- If you are using the Orders API to manage orders, provide the `order_id`. Square reads the order
to compute the points earned from both the base loyalty program and an associated
[loyalty promotion](entity:LoyaltyPromotion). For purchases that qualify for multiple accrual
rules, Square computes points based on the accrual rule that grants the most points.
For purchases that qualify for multiple promotions, Square computes points based on the most
recently created promotion. A purchase must first qualify for program points to be eligible for promotion points.

- If you are not using the Orders API to manage orders, provide `points` with the number of points to add.
You must first perform a client-side computation of the points earned from the loyalty program and
loyalty promotion. For spend-based and visit-based programs, you can call [CalculateLoyaltyPoints](api-endpoint:Loyalty-CalculateLoyaltyPoints)
to compute the points earned from the base loyalty program. For information about computing points earned from a loyalty promotion, see
[Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.accounts.accumulate_points({
  accountId:'account_id',
  accumulatePoints:{
    order_id:'RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY'
  },
  idempotencyKey:'58b90739-c3e8-4b11-85f7-e636d48d72cb',
  locationId:'P034NEENMD09F'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The ID of the target [loyalty account](entity:LoyaltyAccount).
    
</dd>
</dl>

<dl>
<dd>

**accumulatePoints:** `Square::Types::LoyaltyEventAccumulatePoints` 

The points to add to the account. 
If you are using the Orders API to manage orders, specify the order ID.
Otherwise, specify the points to add.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies the `AccumulateLoyaltyPoints` request. 
Keys can be any valid string but must be unique for every request.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The [location](entity:Location) where the purchase was made.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Accounts.Adjust(AccountId, request) -> Square::Types::AdjustLoyaltyPointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds points to or subtracts points from a buyer's account.

Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call
[AccumulateLoyaltyPoints](api-endpoint:Loyalty-AccumulateLoyaltyPoints)
to add points when a buyer pays for the purchase.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.accounts.adjust({
  accountId:'account_id',
  idempotencyKey:'bc29a517-3dc9-450e-aa76-fae39ee849d1',
  adjustPoints:{
    points:10,
    reason:'Complimentary points'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The ID of the target [loyalty account](entity:LoyaltyAccount).
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `AdjustLoyaltyPoints` request. 
Keys can be any valid string, but must be unique for every request.
    
</dd>
</dl>

<dl>
<dd>

**adjustPoints:** `Square::Types::LoyaltyEventAdjustPoints` 

The points to add or subtract and the reason for the adjustment. To add points, specify a positive integer.
To subtract points, specify a negative integer.
    
</dd>
</dl>

<dl>
<dd>

**allowNegativeBalance:** `Internal::Types::Boolean` 

Indicates whether to allow a negative adjustment to result in a negative balance. If `true`, a negative
balance is allowed when subtracting points. If `false`, Square returns a `BAD_REQUEST` error when subtracting
the specified number of points would result in a negative balance. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Loyalty Programs
<details><summary><code>client.Loyalty.Programs.List() -> Square::Types::ListLoyaltyProgramsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of loyalty programs in the seller's account.
Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).


Replaced with [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when used with the keyword `main`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.list();
```
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Programs.Get(ProgramId) -> Square::Types::GetLoyaltyProgramResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`.

Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.get({
  programId:'program_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**programId:** `String` — The ID of the loyalty program or the keyword `main`. Either value can be used to retrieve the single loyalty program that belongs to the seller.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Programs.Calculate(ProgramId, request) -> Square::Types::CalculateLoyaltyPointsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Calculates the number of points a buyer can earn from a purchase. Applications might call this endpoint
to display the points to the buyer.

- If you are using the Orders API to manage orders, provide the `order_id` and (optional) `loyalty_account_id`.
Square reads the order to compute the points earned from the base loyalty program and an associated
[loyalty promotion](entity:LoyaltyPromotion).

- If you are not using the Orders API to manage orders, provide `transaction_amount_money` with the
purchase amount. Square uses this amount to calculate the points earned from the base loyalty program,
but not points earned from a loyalty promotion. For spend-based and visit-based programs, the `tax_mode`
setting of the accrual rule indicates how taxes should be treated for loyalty points accrual.
If the purchase qualifies for program points, call
[ListLoyaltyPromotions](api-endpoint:Loyalty-ListLoyaltyPromotions) and perform a client-side computation
to calculate whether the purchase also qualifies for promotion points. For more information, see
[Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.calculate({
  programId:'program_id',
  orderId:'RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY',
  loyaltyAccountId:'79b807d2-d786-46a9-933b-918028d7a8c5'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**programId:** `String` — The ID of the [loyalty program](entity:LoyaltyProgram), which defines the rules for accruing points.
    
</dd>
</dl>

<dl>
<dd>

**orderId:** `String` 

The [order](entity:Order) ID for which to calculate the points.
Specify this field if your application uses the Orders API to process orders.
Otherwise, specify the `transaction_amount_money`.
    
</dd>
</dl>

<dl>
<dd>

**transactionAmountMoney:** `Square::Types::Money` 

The purchase amount for which to calculate the points. 
Specify this field if your application does not use the Orders API to process orders.
Otherwise, specify the `order_id`.
    
</dd>
</dl>

<dl>
<dd>

**loyaltyAccountId:** `String` 

The ID of the target [loyalty account](entity:LoyaltyAccount). Optionally specify this field
if your application uses the Orders API to process orders.

If specified, the `promotion_points` field in the response shows the number of points the buyer would
earn from the purchase. In this case, Square uses the account ID to determine whether the promotion's
`trigger_limit` (the maximum number of times that a buyer can trigger the promotion) has been reached.
If not specified, the `promotion_points` field shows the number of points the purchase qualifies
for regardless of the trigger limit.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Loyalty Rewards
<details><summary><code>client.Loyalty.Rewards.Create(request) -> Square::Types::CreateLoyaltyRewardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a loyalty reward. In the process, the endpoint does following:

- Uses the `reward_tier_id` in the request to determine the number of points
to lock for this reward.
- If the request includes `order_id`, it adds the reward and related discount to the order.

After a reward is created, the points are locked and
not available for the buyer to redeem another reward.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.rewards.create({
  reward:{
    loyalty_account_id:'5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd',
    reward_tier_id:'e1b39225-9da5-43d1-a5db-782cdd8ad94f',
    order_id:'RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY'
  },
  idempotencyKey:'18c2e5ea-a620-4b1f-ad60-7b167285e451'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**reward:** `Square::Types::LoyaltyReward` — The reward to create.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreateLoyaltyReward` request. 
Keys can be any valid string, but must be unique for every request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Rewards.Search(request) -> Square::Types::SearchLoyaltyRewardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for loyalty rewards. This endpoint accepts a request with no query filters and returns results for all loyalty accounts.
If you include a `query` object, `loyalty_account_id` is required and `status` is  optional.

If you know a reward ID, use the
[RetrieveLoyaltyReward](api-endpoint:Loyalty-RetrieveLoyaltyReward) endpoint.

Search results are sorted by `updated_at` in descending order.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.rewards.search({
  query:{
    loyalty_account_id:'5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd'
  },
  limit:10
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::SearchLoyaltyRewardsRequestLoyaltyRewardQuery` 

The search criteria for the request. 
If empty, the endpoint retrieves all loyalty rewards in the loyalty program.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — The maximum number of results to return in the response. The default value is 30.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to 
this endpoint. Provide this to retrieve the next set of 
results for the original query.
For more information, 
see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Rewards.Get(RewardId) -> Square::Types::GetLoyaltyRewardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a loyalty reward.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.rewards.get({
  rewardId:'reward_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rewardId:** `String` — The ID of the [loyalty reward](entity:LoyaltyReward) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Rewards.Delete(RewardId) -> Square::Types::DeleteLoyaltyRewardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a loyalty reward by doing the following:

- Returns the loyalty points back to the loyalty account.
- If an order ID was specified when the reward was created
(see [CreateLoyaltyReward](api-endpoint:Loyalty-CreateLoyaltyReward)),
it updates the order by removing the reward and related
discounts.

You cannot delete a reward that has reached the terminal state (REDEEMED).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.rewards.delete({
  rewardId:'reward_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rewardId:** `String` — The ID of the [loyalty reward](entity:LoyaltyReward) to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Rewards.Redeem(RewardId, request) -> Square::Types::RedeemLoyaltyRewardResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Redeems a loyalty reward.

The endpoint sets the reward to the `REDEEMED` terminal state.

If you are using your own order processing system (not using the
Orders API), you call this endpoint after the buyer paid for the
purchase.

After the reward reaches the terminal state, it cannot be deleted.
In other words, points used for the reward cannot be returned
to the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.rewards.redeem({
  rewardId:'reward_id',
  idempotencyKey:'98adc7f7-6963-473b-b29c-f3c9cdd7d994',
  locationId:'P034NEENMD09F'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**rewardId:** `String` — The ID of the [loyalty reward](entity:LoyaltyReward) to redeem.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `RedeemLoyaltyReward` request. 
Keys can be any valid string, but must be unique for every request.
    
</dd>
</dl>

<dl>
<dd>

**locationId:** `String` — The ID of the [location](entity:Location) where the reward is redeemed.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Loyalty Programs Promotions
<details><summary><code>client.Loyalty.Programs.Promotions.List(ProgramId) -> Square::Types::ListLoyaltyPromotionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the loyalty promotions associated with a [loyalty program](entity:LoyaltyProgram).
Results are sorted by the `created_at` date in descending order (newest to oldest).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.promotions.list({
  programId:'program_id',
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**programId:** `String` 

The ID of the base [loyalty program](entity:LoyaltyProgram). To get the program ID,
call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using the `main` keyword.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Square::Types::LoyaltyPromotionStatus` 

The status to filter the results by. If a status is provided, only loyalty promotions
with the specified status are returned. Otherwise, all loyalty promotions associated with
the loyalty program are returned.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response.
The minimum value is 1 and the maximum value is 30. The default value is 30.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Programs.Promotions.Create(ProgramId, request) -> Square::Types::CreateLoyaltyPromotionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a loyalty promotion for a [loyalty program](entity:LoyaltyProgram). A loyalty promotion
enables buyers to earn points in addition to those earned from the base loyalty program.

This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status, depending on the
`available_time` setting. A loyalty program can have a maximum of 10 loyalty promotions with an
`ACTIVE` or `SCHEDULED` status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.promotions.create({
  programId:'program_id',
  loyaltyPromotion:{
    name:'Tuesday Happy Hour Promo',
    incentive:{
      points_multiplier_data:{
        multiplier:'3.0'
      }
    },
    available_time:{
      time_periods:['BEGIN:VEVENT
      DTSTART:20220816T160000
      DURATION:PT2H
      RRULE:FREQ=WEEKLY;BYDAY=TU
      END:VEVENT']
    },
    trigger_limit:{
      times:1
    },
    minimum_spend_amount_money:{
      amount:2000
    },
    qualifying_category_ids:['XTQPYLR3IIU9C44VRCB3XD12']
  },
  idempotencyKey:'ec78c477-b1c3-4899-a209-a4e71337c996'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**programId:** `String` 

The ID of the [loyalty program](entity:LoyaltyProgram) to associate with the promotion.
To get the program ID, call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram)
using the `main` keyword.
    
</dd>
</dl>

<dl>
<dd>

**loyaltyPromotion:** `Square::Types::LoyaltyPromotion` — The loyalty promotion to create.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, which is used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Programs.Promotions.Get(ProgramId, PromotionId) -> Square::Types::GetLoyaltyPromotionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a loyalty promotion.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.promotions.get({
  programId:'program_id',
  promotionId:'promotion_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**programId:** `String` 

The ID of the base [loyalty program](entity:LoyaltyProgram). To get the program ID,
call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using the `main` keyword.
    
</dd>
</dl>

<dl>
<dd>

**promotionId:** `String` — The ID of the [loyalty promotion](entity:LoyaltyPromotion) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Loyalty.Programs.Promotions.Cancel(ProgramId, PromotionId) -> Square::Types::CancelLoyaltyPromotionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion earlier than the
end date, cancel an `ACTIVE` promotion when an end date is not specified, or cancel a `SCHEDULED` promotion.
Because updating a promotion is not supported, you can also use this endpoint to cancel a promotion before
you create a new one.

This endpoint sets the loyalty promotion to the `CANCELED` state
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.loyalty.programs.promotions.cancel({
  programId:'program_id',
  promotionId:'promotion_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**programId:** `String` — The ID of the base [loyalty program](entity:LoyaltyProgram).
    
</dd>
</dl>

<dl>
<dd>

**promotionId:** `String` 

The ID of the [loyalty promotion](entity:LoyaltyPromotion) to cancel. You can cancel a
promotion that has an `ACTIVE` or `SCHEDULED` status.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Merchants CustomAttributeDefinitions
<details><summary><code>client.Merchants.CustomAttributeDefinitions.List() -> Square::Types::ListMerchantCustomAttributeDefinitionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the merchant-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.
When all response pages are retrieved, the results include all custom attribute definitions
that are visible to the requesting application, including those that are created by other
applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attribute_definitions.list({
  limit:1,
  cursor:'cursor'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**visibilityFilter:** `Square::Types::VisibilityFilter` — Filters the `CustomAttributeDefinition` results by their `visibility` values.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request.
For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributeDefinitions.Create(request) -> Square::Types::CreateMerchantCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
Use this endpoint to define a custom attribute that can be associated with a merchant connecting to your application.
A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties
for a custom attribute. After the definition is created, you can call
[UpsertMerchantCustomAttribute](api-endpoint:MerchantCustomAttributes-UpsertMerchantCustomAttribute) or
[BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes)
to set the custom attribute for a merchant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attribute_definitions.create({
  customAttributeDefinition:{
    key:'alternative_seller_name',
    schema:{},
    name:'Alternative Merchant Name',
    description:'This is the other name this merchant goes by.'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition to create. Note the following:
- With the exception of the `Selection` data type, the `schema` is specified as a simple URL to the JSON schema
definition hosted on the Square CDN. For more information, including supported values and constraints, see
[Supported data types](https://developer.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
- `name` is required unless `visibility` is set to `VISIBILITY_HIDDEN`.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributeDefinitions.Get(Key) -> Square::Types::RetrieveMerchantCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
To retrieve a custom attribute definition created by another application, the `visibility`
setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attribute_definitions.get({
  key:'key',
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute definition to retrieve. If the requesting application
is not the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute definition, which is used for strongly consistent
reads to guarantee that you receive the most up-to-date data. When included in the request,
Square returns the specified version or a higher version if one exists. If the specified version
is higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributeDefinitions.Update(Key, request) -> Square::Types::UpdateMerchantCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) for a Square seller account.
Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the
`schema` for a `Selection` data type.
Only the definition owner can update a custom attribute definition.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attribute_definitions.update({
  key:'key',
  customAttributeDefinition:{
    description:'Update the description as desired.'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to update.
    
</dd>
</dl>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition that contains the fields to update. This endpoint
supports sparse updates, so only new or changed fields need to be included in the request.
Only the following fields can be updated:
- `name`
- `description`
- `visibility`
- `schema` for a `Selection` data type. Only changes to the named options or the maximum number of allowed
selections are supported.
For more information, see
[Update a merchant custom attribute definition](https://developer.squareup.com/docs/merchant-custom-attributes-api/custom-attribute-definitions#update-custom-attribute-definition).
The version field must match the current version of the custom attribute definition to enable
[optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
If this is not important for your application, version can be set to -1. For any other values, the request fails with a BAD_REQUEST error.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributeDefinitions.Delete(Key) -> Square::Types::DeleteMerchantCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a merchant-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.
Deleting a custom attribute definition also deletes the corresponding custom attribute from
the merchant.
Only the definition owner can delete a custom attribute definition.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attribute_definitions.delete({
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Merchants CustomAttributes
<details><summary><code>client.Merchants.CustomAttributes.BatchDelete(request) -> Square::Types::BulkDeleteMerchantCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes [custom attributes](entity:CustomAttribute) for a merchant as a bulk operation.
To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attributes.batch_delete({
  values:{
    id1:{
      key:'alternative_seller_name'
    },
    id2:{
      key:'has_seen_tutorial'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BulkDeleteMerchantCustomAttributesRequestMerchantCustomAttributeDeleteRequest]` 

The data used to update the `CustomAttribute` objects.
The keys must be unique and are used to map to the corresponding response.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributes.BatchUpsert(request) -> Square::Types::BulkUpsertMerchantCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates [custom attributes](entity:CustomAttribute) for a merchant as a bulk operation.
Use this endpoint to set the value of one or more custom attributes for a merchant.
A custom attribute is based on a custom attribute definition in a Square seller account, which is
created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint.
This `BulkUpsertMerchantCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
requests and returns a map of individual upsert responses. Each upsert request has a unique ID
and provides a merchant ID and custom attribute. Each upsert response is returned with the ID
of the corresponding request.
To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attributes.batch_upsert({
  values:{
    id1:{
      merchant_id:'DM7VKY8Q63GNP',
      custom_attribute:{
        key:'alternative_seller_name'
      }
    },
    id2:{
      merchant_id:'DM7VKY8Q63GNP',
      custom_attribute:{
        key:'has_seen_tutorial'
      }
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BulkUpsertMerchantCustomAttributesRequestMerchantCustomAttributeUpsertRequest]` 

A map containing 1 to 25 individual upsert requests. For each request, provide an
arbitrary ID that is unique for this `BulkUpsertMerchantCustomAttributes` request and the
information needed to create or update a custom attribute.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributes.List(MerchantId) -> Square::Types::ListMerchantCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the [custom attributes](entity:CustomAttribute) associated with a merchant.
You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
in the same call.
When all response pages are retrieved, the results include all custom attributes that are
visible to the requesting application, including those that are owned by other applications
and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attributes.list({
  merchantId:'merchant_id',
  limit:1,
  cursor:'cursor',
  withDefinitions:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchantId:** `String` — The ID of the target [merchant](entity:Merchant).
    
</dd>
</dl>

<dl>
<dd>

**visibilityFilter:** `Square::Types::VisibilityFilter` — Filters the `CustomAttributeDefinition` results by their `visibility` values.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory.
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.
The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint.
Provide this cursor to retrieve the next page of results for your original request. For more
information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**withDefinitions:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each
custom attribute. Set this parameter to `true` to get the name and description of each custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributes.Get(MerchantId, Key) -> Square::Types::RetrieveMerchantCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a [custom attribute](entity:CustomAttribute) associated with a merchant.
You can use the `with_definition` query parameter to also retrieve the custom attribute definition
in the same call.
To retrieve a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attributes.get({
  merchantId:'merchant_id',
  key:'key',
  withDefinition:true,
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchantId:** `String` — The ID of the target [merchant](entity:Merchant).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to retrieve. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**withDefinition:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of
the custom attribute. Set this parameter to `true` to get the name and description of the custom
attribute, information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

The current version of the custom attribute, which is used for strongly consistent reads to
guarantee that you receive the most up-to-date data. When included in the request, Square
returns the specified version or a higher version if one exists. If the specified version is
higher than the current version, Square returns a `BAD_REQUEST` error.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributes.Upsert(MerchantId, Key, request) -> Square::Types::UpsertMerchantCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates a [custom attribute](entity:CustomAttribute) for a merchant.
Use this endpoint to set the value of a custom attribute for a specified merchant.
A custom attribute is based on a custom attribute definition in a Square seller account, which
is created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint.
To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attributes.upsert({
  merchantId:'merchant_id',
  key:'key',
  customAttribute:{}
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchantId:** `String` — The ID of the target [merchant](entity:Merchant).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to create or update. This key must match the `key` of a
custom attribute definition in the Square seller account. If the requesting application is not
the definition owner, you must use the qualified key.
    
</dd>
</dl>

<dl>
<dd>

**customAttribute:** `Square::Types::CustomAttribute` 

The custom attribute to create or update, with the following fields:
- `value`. This value must conform to the `schema` specified by the definition.
For more information, see [Supported data types](https://developer.squareup.com/docs/devtools/customattributes/overview#supported-data-types).
- The version field must match the current version of the custom attribute definition to enable
[optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
If this is not important for your application, version can be set to -1. For any other values, the request fails with a BAD_REQUEST error.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. For more information,
see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Merchants.CustomAttributes.Delete(MerchantId, Key) -> Square::Types::DeleteMerchantCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a [custom attribute](entity:CustomAttribute) associated with a merchant.
To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.merchants.custom_attributes.delete({
  merchantId:'merchant_id',
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**merchantId:** `String` — The ID of the target [merchant](entity:Merchant).
    
</dd>
</dl>

<dl>
<dd>

**key:** `String` 

The key of the custom attribute to delete. This key must match the `key` of a custom
attribute definition in the Square seller account. If the requesting application is not the
definition owner, you must use the qualified key.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Orders CustomAttributeDefinitions
<details><summary><code>client.Orders.CustomAttributeDefinitions.List() -> Square::Types::ListOrderCustomAttributeDefinitionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the order-related [custom attribute definitions](entity:CustomAttributeDefinition) that belong to a Square seller account.

When all response pages are retrieved, the results include all custom attribute definitions
that are visible to the requesting application, including those that are created by other
applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that
seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attribute_definitions.list({
  cursor:'cursor',
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**visibilityFilter:** `Square::Types::VisibilityFilter` — Requests that all of the custom attributes be returned, or only those that are read-only or read-write.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint. 
Provide this cursor to retrieve the next page of results for your original request. 
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory. 
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100. 
The default value is 20.
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributeDefinitions.Create(request) -> Square::Types::CreateOrderCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an order-related custom attribute definition.  Use this endpoint to
define a custom attribute that can be associated with orders.

After creating a custom attribute definition, you can set the custom attribute for orders
in the Square seller account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attribute_definitions.create({
  customAttributeDefinition:{
    key:'cover-count',
    schema:{},
    name:'Cover count',
    description:'The number of people seated at a table'
  },
  idempotencyKey:'IDEMPOTENCY_KEY'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition to create. Note the following:
- With the exception of the `Selection` data type, the `schema` is specified as a simple URL to the JSON schema
definition hosted on the Square CDN. For more information, including supported values and constraints, see
[Specifying the schema](https://developer.squareup.com/docs/customer-custom-attributes-api/custom-attribute-definitions#specify-schema).
- If provided, `name` must be unique (case-sensitive) across all visible customer-related custom attribute definitions for the seller.
- All custom attributes are visible in exported customer data, including those set to `VISIBILITY_HIDDEN`.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. 
For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributeDefinitions.Get(Key) -> Square::Types::RetrieveOrderCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an order-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.

To retrieve a custom attribute definition created by another application, the `visibility`
setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attribute_definitions.get({
  key:'key',
  version:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control, include this optional field and specify the current version of the custom attribute.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributeDefinitions.Update(Key, request) -> Square::Types::UpdateOrderCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an order-related custom attribute definition for a Square seller account.

Only the definition owner can update a custom attribute definition. Note that sellers can view all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attribute_definitions.update({
  key:'key',
  customAttributeDefinition:{
    key:'cover-count',
    version:1
  },
  idempotencyKey:'IDEMPOTENCY_KEY'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to update.
    
</dd>
</dl>

<dl>
<dd>

**customAttributeDefinition:** `Square::Types::CustomAttributeDefinition` 

The custom attribute definition that contains the fields to update. This endpoint supports sparse updates, 
so only new or changed fields need to be included in the request.  For more information, see 
[Updatable definition fields](https://developer.squareup.com/docs/orders-custom-attributes-api/custom-attribute-definitions#updatable-definition-fields).

To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) control, include the optional `version` field and specify the current version of the custom attribute definition.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. 
For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributeDefinitions.Delete(Key) -> Square::Types::DeleteOrderCustomAttributeDefinitionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an order-related [custom attribute definition](entity:CustomAttributeDefinition) from a Square seller account.

Only the definition owner can delete a custom attribute definition.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attribute_definitions.delete({
  key:'key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**key:** `String` — The key of the custom attribute definition to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Orders CustomAttributes
<details><summary><code>client.Orders.CustomAttributes.BatchDelete(request) -> Square::Types::BulkDeleteOrderCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes order [custom attributes](entity:CustomAttribute) as a bulk operation.

Use this endpoint to delete one or more custom attributes from one or more orders.
A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
custom attribute definition, use the [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition) endpoint.)

This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual delete
requests and returns a map of individual delete responses. Each delete request has a unique ID
and provides an order ID and custom attribute. Each delete response is returned with the ID
of the corresponding request.

To delete a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attributes.batch_delete({
  values:{
    'cover-count':{
      key:'cover-count',
      order_id:'7BbXGEIWNldxAzrtGf9GPVZTwZ4F'
    },
    'table-number':{
      key:'table-number',
      order_id:'7BbXGEIWNldxAzrtGf9GPVZTwZ4F'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BulkDeleteOrderCustomAttributesRequestDeleteCustomAttribute]` — A map of requests that correspond to individual delete operations for custom attributes.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributes.BatchUpsert(request) -> Square::Types::BulkUpsertOrderCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates order [custom attributes](entity:CustomAttribute) as a bulk operation.

Use this endpoint to delete one or more custom attributes from one or more orders.
A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a
custom attribute definition, use the [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition) endpoint.)

This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert
requests and returns a map of individual upsert responses. Each upsert request has a unique ID
and provides an order ID and custom attribute. Each upsert response is returned with the ID
of the corresponding request.

To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attributes.batch_upsert({
  values:{
    'cover-count':{
      custom_attribute:{
        key:'cover-count',
        version:2
      },
      order_id:'7BbXGEIWNldxAzrtGf9GPVZTwZ4F'
    },
    'table-number':{
      custom_attribute:{
        key:'table-number',
        version:4
      },
      order_id:'7BbXGEIWNldxAzrtGf9GPVZTwZ4F'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**values:** `Internal::Types::Hash[String, Square::Types::BulkUpsertOrderCustomAttributesRequestUpsertCustomAttribute]` — A map of requests that correspond to individual upsert operations for custom attributes.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributes.List(OrderId) -> Square::Types::ListOrderCustomAttributesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the [custom attributes](entity:CustomAttribute) associated with an order.

You can use the `with_definitions` query parameter to also retrieve custom attribute definitions
in the same call.

When all response pages are retrieved, the results include all custom attributes that are
visible to the requesting application, including those that are owned by other applications
and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attributes.list({
  orderId:'order_id',
  cursor:'cursor',
  limit:1,
  withDefinitions:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the target [order](entity:Order).
    
</dd>
</dl>

<dl>
<dd>

**visibilityFilter:** `Square::Types::VisibilityFilter` — Requests that all of the custom attributes be returned, or only those that are read-only or read-write.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

The cursor returned in the paged response from the previous call to this endpoint. 
Provide this cursor to retrieve the next page of results for your original request. 
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to return in a single paged response. This limit is advisory. 
The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100. 
The default value is 20.
For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    
</dd>
</dl>

<dl>
<dd>

**withDefinitions:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each
custom attribute. Set this parameter to `true` to get the name and description of each custom attribute, 
information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributes.Get(OrderId, CustomAttributeKey) -> Square::Types::RetrieveOrderCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a [custom attribute](entity:CustomAttribute) associated with an order.

You can use the `with_definition` query parameter to also retrieve the custom attribute definition
in the same call.

To retrieve a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attributes.get({
  orderId:'order_id',
  customAttributeKey:'custom_attribute_key',
  version:1,
  withDefinition:true
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the target [order](entity:Order).
    
</dd>
</dl>

<dl>
<dd>

**customAttributeKey:** `String` 

The key of the custom attribute to retrieve.  This key must match the key of an
existing custom attribute definition.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Integer` 

To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control, include this optional field and specify the current version of the custom attribute.
    
</dd>
</dl>

<dl>
<dd>

**withDefinition:** `Internal::Types::Boolean` 

Indicates whether to return the [custom attribute definition](entity:CustomAttributeDefinition) in the `definition` field of each 
custom attribute. Set this parameter to `true` to get the name and description of each custom attribute, 
information about the data type, or other definition details. The default value is `false`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributes.Upsert(OrderId, CustomAttributeKey, request) -> Square::Types::UpsertOrderCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates a [custom attribute](entity:CustomAttribute) for an order.

Use this endpoint to set the value of a custom attribute for a specific order.
A custom attribute is based on a custom attribute definition in a Square seller account. (To create a
custom attribute definition, use the [CreateOrderCustomAttributeDefinition](api-endpoint:OrderCustomAttributes-CreateOrderCustomAttributeDefinition) endpoint.)

To create or update a custom attribute owned by another application, the `visibility` setting
must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attributes.upsert({
  orderId:'order_id',
  customAttributeKey:'custom_attribute_key',
  customAttribute:{
    key:'table-number',
    version:1
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the target [order](entity:Order).
    
</dd>
</dl>

<dl>
<dd>

**customAttributeKey:** `String` 

The key of the custom attribute to create or update.  This key must match the key 
of an existing custom attribute definition.
    
</dd>
</dl>

<dl>
<dd>

**customAttribute:** `Square::Types::CustomAttribute` 

The custom attribute to create or update, with the following fields:

- `value`. This value must conform to the `schema` specified by the definition. 
For more information, see [Value data types](https://developer.squareup.com/docs/customer-custom-attributes-api/custom-attributes#value-data-types).

- `version`. To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
control, include this optional field and specify the current version of the custom attribute.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique identifier for this request, used to ensure idempotency. 
For more information, see [Idempotency](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Orders.CustomAttributes.Delete(OrderId, CustomAttributeKey) -> Square::Types::DeleteOrderCustomAttributeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a [custom attribute](entity:CustomAttribute) associated with a customer profile.

To delete a custom attribute owned by another application, the `visibility` setting must be
`VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes
(also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.orders.custom_attributes.delete({
  orderId:'order_id',
  customAttributeKey:'custom_attribute_key'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**orderId:** `String` — The ID of the target [order](entity:Order).
    
</dd>
</dl>

<dl>
<dd>

**customAttributeKey:** `String` 

The key of the custom attribute to delete.  This key must match the key of an
existing custom attribute definition.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## TeamMembers WageSetting
<details><summary><code>client.TeamMembers.WageSetting.Get(TeamMemberId) -> Square::Types::GetWageSettingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a `WageSetting` object for a team member specified
by `TeamMember.id`. For more information, see
[Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).

Square recommends using [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
to get this information directly from the `TeamMember.wage_setting` field.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.wage_setting.get({
  teamMemberId:'team_member_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberId:** `String` — The ID of the team member for which to retrieve the wage setting.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.TeamMembers.WageSetting.Update(TeamMemberId, request) -> Square::Types::UpdateWageSettingResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates a `WageSetting` object. The object is created if a
`WageSetting` with the specified `team_member_id` doesn't exist. Otherwise,
it fully replaces the `WageSetting` object for the team member.
The `WageSetting` is returned on a successful update. For more information, see
[Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).

Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember) or [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember)
to manage the `TeamMember.wage_setting` field directly.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.team_members.wage_setting.update({
  teamMemberId:'team_member_id',
  wageSetting:{
    job_assignments:[{
      job_title:'Manager',
      annual_rate:{
        amount:3000000
      },
      weekly_hours:40
    }, {
      job_title:'Cashier',
      hourly_rate:{
        amount:2000
      }
    }],
    is_overtime_exempt:true
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**teamMemberId:** `String` — The ID of the team member for which to update the `WageSetting` object.
    
</dd>
</dl>

<dl>
<dd>

**wageSetting:** `Square::Types::WageSetting` 

The complete `WageSetting` object. For all job assignments, specify one of the following:
- `job_id` (recommended) - If needed, call [ListJobs](api-endpoint:Team-ListJobs) to get a list of all jobs.
Requires Square API version 2024-12-18 or later.
- `job_title` - Use the exact, case-sensitive spelling of an existing title unless you want to create a new job.
This value is ignored if `job_id` is also provided.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Terminal Actions
<details><summary><code>client.Terminal.Actions.Create(request) -> Square::Types::CreateTerminalActionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a Terminal action request and sends it to the specified device.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.actions.create({
  idempotencyKey:'thahn-70e75c10-47f7-4ab6-88cc-aaa4076d065e',
  action:{
    device_id:'{{DEVICE_ID}}',
    deadline_duration:'PT5M',
    save_card_options:{
      customer_id:'{{CUSTOMER_ID}}',
      reference_id:'user-id-1'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreateAction` request. Keys can be any valid string
but must be unique for every `CreateAction` request.

See [Idempotency keys](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more
information.
    
</dd>
</dl>

<dl>
<dd>

**action:** `Square::Types::TerminalAction` — The Action to create.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Actions.Search(request) -> Square::Types::SearchTerminalActionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a filtered list of Terminal action requests created by the account making the request. Terminal action requests are available for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.actions.search({
  query:{
    filter:{
      created_at:{
        start_at:'2022-04-01T00:00:00.000Z'
      }
    },
    sort:{}
  },
  limit:2
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::TerminalActionQuery` 

Queries terminal actions based on given conditions and sort order.
Leaving this unset will return all actions with the default sort order.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for the original query.
See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more
information.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limit the number of results returned for a single request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Actions.Get(ActionId) -> Square::Types::GetTerminalActionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a Terminal action request by `action_id`. Terminal action requests are available for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.actions.get({
  actionId:'action_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**actionId:** `String` — Unique ID for the desired `TerminalAction`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Actions.Cancel(ActionId) -> Square::Types::CancelTerminalActionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a Terminal action request if the status of the request permits it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.actions.cancel({
  actionId:'action_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**actionId:** `String` — Unique ID for the desired `TerminalAction`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Terminal Checkouts
<details><summary><code>client.Terminal.Checkouts.Create(request) -> Square::Types::CreateTerminalCheckoutResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a Terminal checkout request and sends it to the specified device to take a payment
for the requested amount.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.checkouts.create({
  idempotencyKey:'28a0c3bc-7839-11ea-bc55-0242ac130003',
  checkout:{
    amount_money:{
      amount:2610
    },
    reference_id:'id11572',
    note:'A brief note',
    device_options:{
      device_id:'dbb5d83a-7838-11ea-bc55-0242ac130003'
    }
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreateCheckout` request. Keys can be any valid string but
must be unique for every `CreateCheckout` request.

See [Idempotency keys](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more information.
    
</dd>
</dl>

<dl>
<dd>

**checkout:** `Square::Types::TerminalCheckout` — The checkout to create.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Checkouts.Search(request) -> Square::Types::SearchTerminalCheckoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a filtered list of Terminal checkout requests created by the application making the request. Only Terminal checkout requests created for the merchant scoped to the OAuth token are returned. Terminal checkout requests are available for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.checkouts.search({
  query:{
    filter:{
      status:'COMPLETED'
    }
  },
  limit:2
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::TerminalCheckoutQuery` 

Queries Terminal checkouts based on given conditions and the sort order.
Leaving these unset returns all checkouts with the default sort order.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limits the number of results returned for a single request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Checkouts.Get(CheckoutId) -> Square::Types::GetTerminalCheckoutResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout requests are available for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.checkouts.get({
  checkoutId:'checkout_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**checkoutId:** `String` — The unique ID for the desired `TerminalCheckout`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Checkouts.Cancel(CheckoutId) -> Square::Types::CancelTerminalCheckoutResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a Terminal checkout request if the status of the request permits it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.checkouts.cancel({
  checkoutId:'checkout_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**checkoutId:** `String` — The unique ID for the desired `TerminalCheckout`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Terminal Refunds
<details><summary><code>client.Terminal.Refunds.Create(request) -> Square::Types::CreateTerminalRefundResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a request to refund an Interac payment completed on a Square Terminal. Refunds for Interac payments on a Square Terminal are supported only for Interac debit cards in Canada. Other refunds for Terminal payments should use the Refunds API. For more information, see [Refunds API](api:Refunds).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.refunds.create({
  idempotencyKey:'402a640b-b26f-401f-b406-46f839590c04',
  refund:{
    payment_id:'5O5OvgkcNUhl7JBuINflcjKqUzXZY',
    amount_money:{
      amount:111
    },
    reason:'Returning items',
    device_id:'f72dfb8e-4d65-4e56-aade-ec3fb8d33291'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` 

A unique string that identifies this `CreateRefund` request. Keys can be any valid string but
must be unique for every `CreateRefund` request.

See [Idempotency keys](https://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency) for more information.
    
</dd>
</dl>

<dl>
<dd>

**refund:** `Square::Types::TerminalRefund` — The refund to create.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Refunds.Search(request) -> Square::Types::SearchTerminalRefundsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a filtered list of Interac Terminal refund requests created by the seller making the request. Terminal refund requests are available for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.refunds.search({
  query:{
    filter:{
      status:'COMPLETED'
    }
  },
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `Square::Types::TerminalRefundQuery` 

Queries the Terminal refunds based on given conditions and the sort order. Calling
`SearchTerminalRefunds` without an explicit query parameter returns all available
refunds with the default sort order.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this cursor to retrieve the next set of results for the original query.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` — Limits the number of results returned for a single request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Refunds.Get(TerminalRefundId) -> Square::Types::GetTerminalRefundResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an Interac Terminal refund object by ID. Terminal refund objects are available for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.refunds.get({
  terminalRefundId:'terminal_refund_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**terminalRefundId:** `String` — The unique ID for the desired `TerminalRefund`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Terminal.Refunds.Cancel(TerminalRefundId) -> Square::Types::CancelTerminalRefundResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels an Interac Terminal refund request by refund request ID if the status of the request permits it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.terminal.refunds.cancel({
  terminalRefundId:'terminal_refund_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**terminalRefundId:** `String` — The unique ID for the desired `TerminalRefund`.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhooks EventTypes
<details><summary><code>client.Webhooks.EventTypes.List() -> Square::Types::ListWebhookEventTypesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all webhook event types that can be subscribed to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.event_types.list({
  apiVersion:'api_version'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiVersion:** `String` — The API version for which to list event types. Setting this field overrides the default version used by the application.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhooks Subscriptions
<details><summary><code>client.Webhooks.Subscriptions.List() -> Square::Types::ListWebhookSubscriptionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists all webhook subscriptions owned by your application.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.list({
  cursor:'cursor',
  includeDisabled:true,
  limit:1
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**cursor:** `String` 

A pagination cursor returned by a previous call to this endpoint.
Provide this to retrieve the next set of results for your original query.

For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    
</dd>
</dl>

<dl>
<dd>

**includeDisabled:** `Internal::Types::Boolean` 

Includes disabled [Subscription](entity:WebhookSubscription)s.
By default, all enabled [Subscription](entity:WebhookSubscription)s are returned.
    
</dd>
</dl>

<dl>
<dd>

**sortOrder:** `Square::Types::SortOrder` 

Sorts the returned list by when the [Subscription](entity:WebhookSubscription) was created with the specified order.
This field defaults to ASC.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Integer` 

The maximum number of results to be returned in a single page.
It is possible to receive fewer results than the specified limit on a given page.
The default value of 100 is also the maximum allowed value.

Default: 100
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Subscriptions.Create(request) -> Square::Types::CreateWebhookSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a webhook subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.create({
  idempotencyKey:'63f84c6c-2200-4c99-846c-2670a1311fbf',
  subscription:{
    name:'Example Webhook Subscription',
    event_types:['payment.created', 'payment.updated'],
    notification_url:'https://example-webhook-url.com',
    api_version:'2021-12-15'
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string that identifies the [CreateWebhookSubscription](api-endpoint:WebhookSubscriptions-CreateWebhookSubscription) request.
    
</dd>
</dl>

<dl>
<dd>

**subscription:** `Square::Types::WebhookSubscription` — The [Subscription](entity:WebhookSubscription) to create.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Subscriptions.Get(SubscriptionId) -> Square::Types::GetWebhookSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a webhook subscription identified by its ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.get({
  subscriptionId:'subscription_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to retrieve.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Subscriptions.Update(SubscriptionId, request) -> Square::Types::UpdateWebhookSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a webhook subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.update({
  subscriptionId:'subscription_id',
  subscription:{
    name:'Updated Example Webhook Subscription',
    enabled:false
  }
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to update.
    
</dd>
</dl>

<dl>
<dd>

**subscription:** `Square::Types::WebhookSubscription` — The [Subscription](entity:WebhookSubscription) to update.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Subscriptions.Delete(SubscriptionId) -> Square::Types::DeleteWebhookSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a webhook subscription.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.delete({
  subscriptionId:'subscription_id'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to delete.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Subscriptions.UpdateSignatureKey(SubscriptionId, request) -> Square::Types::UpdateWebhookSubscriptionSignatureKeyResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a webhook subscription by replacing the existing signature key with a new one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.update_signature_key({
  subscriptionId:'subscription_id',
  idempotencyKey:'ed80ae6b-0654-473b-bbab-a39aee89a60d'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to update.
    
</dd>
</dl>

<dl>
<dd>

**idempotencyKey:** `String` — A unique string that identifies the [UpdateWebhookSubscriptionSignatureKey](api-endpoint:WebhookSubscriptions-UpdateWebhookSubscriptionSignatureKey) request.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.Webhooks.Subscriptions.Test(SubscriptionId, request) -> Square::Types::TestWebhookSubscriptionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Tests a webhook subscription by sending a test event to the notification URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```ruby
client.webhooks.subscriptions.test({
  subscriptionId:'subscription_id',
  eventType:'payment.created'
});
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subscriptionId:** `String` — [REQUIRED] The ID of the [Subscription](entity:WebhookSubscription) to test.
    
</dd>
</dl>

<dl>
<dd>

**eventType:** `String` 

The event type that will be used to test the [Subscription](entity:WebhookSubscription). The event type must be
contained in the list of event types in the [Subscription](entity:WebhookSubscription).
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>
