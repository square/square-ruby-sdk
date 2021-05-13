# Snippets

```ruby
snippets_api = client.snippets
```

## Class Name

`SnippetsApi`

## Methods

* [Delete Snippet](/doc/api/snippets.md#delete-snippet)
* [Retrieve Snippet](/doc/api/snippets.md#retrieve-snippet)
* [Upsert Snippet](/doc/api/snippets.md#upsert-snippet)


# Delete Snippet

Removes your snippet from a Square Online site.

You can call [ListSites](/doc/api/sites.md#list-sites) to get the IDs of the sites that belong to a seller.

__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).

```ruby
def delete_snippet(site_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `site_id` | `String` | Template, Required | The ID of the site that contains the snippet. |

## Response Type

[`Delete Snippet Response Hash`](/doc/models/delete-snippet-response.md)

## Example Usage

```ruby
site_id = 'site_id6'

result = snippets_api.delete_snippet(site_id: site_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Snippet

Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet applications, but you can retrieve only the snippet that was added by your application.

You can call [ListSites](/doc/api/sites.md#list-sites) to get the IDs of the sites that belong to a seller.

__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).

```ruby
def retrieve_snippet(site_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `site_id` | `String` | Template, Required | The ID of the site that contains the snippet. |

## Response Type

[`Retrieve Snippet Response Hash`](/doc/models/retrieve-snippet-response.md)

## Example Usage

```ruby
site_id = 'site_id6'

result = snippets_api.retrieve_snippet(site_id: site_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Upsert Snippet

Adds a snippet to a Square Online site or updates the existing snippet on the site.
The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages. A snippet application can add one snippet to a given site.

You can call [ListSites](/doc/api/sites.md#list-sites) to get the IDs of the sites that belong to a seller.

__Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).

```ruby
def upsert_snippet(site_id:,
                   body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `site_id` | `String` | Template, Required | The ID of the site where you want to add or update the snippet. |
| `body` | [`Upsert Snippet Request Hash`](/doc/models/upsert-snippet-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Upsert Snippet Response Hash`](/doc/models/upsert-snippet-response.md)

## Example Usage

```ruby
site_id = 'site_id6'
body = {}
body[:snippet] = {}
body[:snippet][:id] = 'id4'
body[:snippet][:site_id] = 'site_id0'
body[:snippet][:content] = '<script>var js = 1;</script>'
body[:snippet][:created_at] = 'created_at8'
body[:snippet][:updated_at] = 'updated_at0'

result = snippets_api.upsert_snippet(site_id: site_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

