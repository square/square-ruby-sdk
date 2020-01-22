# Mobile Authorization

```ruby
mobile_authorization_api = client.mobile_authorization
```

## Class Name

`MobileAuthorizationApi`

## Create Mobile Authorization Code

Generates code to authorize a mobile application to connect to a Square card reader

Authorization codes are one-time-use and expire __60 minutes__ after being issued.

__Important:__ The `Authorization` header you provide to this endpoint must have the following format:

```
Authorization: Bearer ACCESS_TOKEN
```

Replace `ACCESS_TOKEN` with a
[valid production authorization credential](https://developer.squareup.com/docs/docs/build-basics/access-tokens).

```ruby
def create_mobile_authorization_code(body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Mobile Authorization Code Request Hash`](/doc/models/create-mobile-authorization-code-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Create Mobile Authorization Code Response Hash`](/doc/models/create-mobile-authorization-code-response.md)

### Example Usage

```ruby
body = {}
body[:location_id] = 'YOUR_LOCATION_ID'

result = mobile_authorization_api.create_mobile_authorization_code(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

