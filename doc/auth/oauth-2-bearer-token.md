# OAuth 2 Bearer token

Documentation for accessing and setting credentials for global.

## Auth Credentials

| Name        | Type     | Description                                         | Getter         |
| ----------- | -------- | --------------------------------------------------- | -------------- |
| AccessToken | `String` | The OAuth 2.0 Access Token to use for API requests. | `access_token` |

**Note:** Auth credentials can be set using named parameter for any of the above credentials (e.g. `access_token`) in the client initialization.

## Usage Example

### Client Initialization

You must provide credentials in the client as shown in the following code snippet.

```ruby
client = SquareLegacy::Client.new(
  bearer_auth_credentials: BearerAuthCredentials.new(
    access_token: 'AccessToken'
  )
)
```
