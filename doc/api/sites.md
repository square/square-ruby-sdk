# Sites

```ruby
sites_api = client.sites
```

## Class Name

`SitesApi`


# List Sites

Lists the Square Online sites that belong to a seller.

__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).

```ruby
def list_sites
```

## Response Type

[`List Sites Response Hash`](/doc/models/list-sites-response.md)

## Example Usage

```ruby
result = sites_api.list_sites()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

