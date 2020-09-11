# O Auth

```ruby
o_auth_api = client.o_auth
```

## Class Name

`OAuthApi`

## Methods

* [Renew Token](/doc/o-auth.md#renew-token)
* [Revoke Token](/doc/o-auth.md#revoke-token)
* [Obtain Token](/doc/o-auth.md#obtain-token)

## Renew Token

`RenewToken` is deprecated. For information about refreshing OAuth access tokens, see
[Renew OAuth Token](https://developer.squareup.com/docs/oauth-api/cookbook/renew-oauth-tokens).


Renews an OAuth access token before it expires.

OAuth access tokens besides your application's personal access token expire after __30 days__.
You can also renew expired tokens within __15 days__ of their expiration.
You cannot renew an access token that has been expired for more than 15 days.
Instead, the associated user must re-complete the OAuth flow from the beginning.

__Important:__ The `Authorization` header for this endpoint must have the
following format:

```
Authorization: Client APPLICATION_SECRET
```

Replace `APPLICATION_SECRET` with the application secret on the Credentials
page in the [application dashboard](https://connect.squareup.com/apps).

:information_source: **Note** This endpoint does not require authentication.

```ruby
def renew_token(client_id:,
                body:,
                authorization:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `client_id` | `String` | Template, Required | Your application ID, available from the [application dashboard](https://connect.squareup.com/apps). |
| `body` | [`Renew Token Request Hash`](/doc/models/renew-token-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |
| `authorization` | `String` | Header, Required | Client APPLICATION_SECRET |

### Response Type

[`Renew Token Response Hash`](/doc/models/renew-token-response.md)

### Example Usage

```ruby
client_id = 'client_id8'
body = {}
body[:access_token] = 'ACCESS_TOKEN'
authorization = 'Client CLIENT_SECRET'

result = o_auth_api.renew_token(client_id: client_id, body: body, authorization: authorization)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Revoke Token

Revokes an access token generated with the OAuth flow.

If an account has more than one OAuth access token for your application, this
endpoint revokes all of them, regardless of which token you specify. When an
OAuth access token is revoked, all of the active subscriptions associated
with that OAuth token are canceled immediately.

__Important:__ The `Authorization` header for this endpoint must have the
following format:

```
Authorization: Client APPLICATION_SECRET
```

Replace `APPLICATION_SECRET` with the application secret on the Credentials
page in the [application dashboard](https://connect.squareup.com/apps).

:information_source: **Note** This endpoint does not require authentication.

```ruby
def revoke_token(body:,
                 authorization:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Revoke Token Request Hash`](/doc/models/revoke-token-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |
| `authorization` | `String` | Header, Required | Client APPLICATION_SECRET |

### Response Type

[`Revoke Token Response Hash`](/doc/models/revoke-token-response.md)

### Example Usage

```ruby
body = {}
body[:client_id] = 'CLIENT_ID'
body[:access_token] = 'ACCESS_TOKEN'
body[:merchant_id] = 'merchant_id6'
body[:revoke_only_access_token] = false
authorization = 'Client CLIENT_SECRET'

result = o_auth_api.revoke_token(body: body, authorization: authorization)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Obtain Token

Returns an OAuth access token.

The endpoint supports distinct methods of obtaining OAuth access tokens.
Applications specify a method by adding the `grant_type` parameter
in the request and also provide relevant information.
For more information, see [OAuth access token management](https://developer.squareup.com/docs/authz/oauth/how-it-works#oauth-access-token-management).

__Note:__ Regardless of the method application specified,
the endpoint always returns two items; an OAuth access token and
a refresh token in the response.

__OAuth tokens should only live on secure servers. Application clients
should never interact directly with OAuth tokens__.

:information_source: **Note** This endpoint does not require authentication.

```ruby
def obtain_token(body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Obtain Token Request Hash`](/doc/models/obtain-token-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Obtain Token Response Hash`](/doc/models/obtain-token-response.md)

### Example Usage

```ruby
body = {}
body[:client_id] = 'APPLICATION_ID'
body[:client_secret] = 'APPLICATION_SECRET'
body[:code] = 'CODE_FROM_AUTHORIZE'
body[:redirect_uri] = 'redirect_uri4'
body[:grant_type] = 'authorization_code'
body[:refresh_token] = 'refresh_token6'
body[:migration_token] = 'migration_token4'

result = o_auth_api.obtain_token(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

