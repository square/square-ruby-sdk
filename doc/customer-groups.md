# Customer Groups

```ruby
customer_groups_api = client.customer_groups
```

## Class Name

`CustomerGroupsApi`

## Methods

* [List Customer Groups](/doc/customer-groups.md#list-customer-groups)
* [Create Customer Group](/doc/customer-groups.md#create-customer-group)
* [Delete Customer Group](/doc/customer-groups.md#delete-customer-group)
* [Retrieve Customer Group](/doc/customer-groups.md#retrieve-customer-group)
* [Update Customer Group](/doc/customer-groups.md#update-customer-group)

## List Customer Groups

Retrieves the list of customer groups of a business.

```ruby
def list_customer_groups(cursor: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. |

### Response Type

[`List Customer Groups Response Hash`](/doc/models/list-customer-groups-response.md)

### Example Usage

```ruby
cursor = 'cursor6'

result = customer_groups_api.list_customer_groups(cursor: cursor)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Create Customer Group

Creates a new customer group for a business. 

The request must include the `name` value of the group.

```ruby
def create_customer_group(body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Customer Group Request Hash`](/doc/models/create-customer-group-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Create Customer Group Response Hash`](/doc/models/create-customer-group-response.md)

### Example Usage

```ruby
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:group] = {}
body[:group][:id] = 'id4'
body[:group][:name] = 'Loyal Customers'
body[:group][:created_at] = 'created_at2'
body[:group][:updated_at] = 'updated_at0'

result = customer_groups_api.create_customer_group(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Delete Customer Group

Deletes a customer group as identified by the `group_id` value.

```ruby
def delete_customer_group(group_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `group_id` | `String` | Template, Required | The ID of the customer group to delete. |

### Response Type

[`Delete Customer Group Response Hash`](/doc/models/delete-customer-group-response.md)

### Example Usage

```ruby
group_id = 'group_id0'

result = customer_groups_api.delete_customer_group(group_id: group_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Retrieve Customer Group

Retrieves a specific customer group as identified by the `group_id` value.

```ruby
def retrieve_customer_group(group_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `group_id` | `String` | Template, Required | The ID of the customer group to retrieve. |

### Response Type

[`Retrieve Customer Group Response Hash`](/doc/models/retrieve-customer-group-response.md)

### Example Usage

```ruby
group_id = 'group_id0'

result = customer_groups_api.retrieve_customer_group(group_id: group_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Update Customer Group

Updates a customer group as identified by the `group_id` value.

```ruby
def update_customer_group(group_id:,
                          body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `group_id` | `String` | Template, Required | The ID of the customer group to update. |
| `body` | [`Update Customer Group Request Hash`](/doc/models/update-customer-group-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Update Customer Group Response Hash`](/doc/models/update-customer-group-response.md)

### Example Usage

```ruby
group_id = 'group_id0'
body = {}
body[:group] = {}
body[:group][:id] = 'id4'
body[:group][:name] = 'Loyal Customers'
body[:group][:created_at] = 'created_at2'
body[:group][:updated_at] = 'updated_at0'

result = customer_groups_api.update_customer_group(group_id: group_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

