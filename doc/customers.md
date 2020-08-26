# Customers

```ruby
customers_api = client.customers
```

## Class Name

`CustomersApi`

## Methods

* [List Customers](/doc/customers.md#list-customers)
* [Create Customer](/doc/customers.md#create-customer)
* [Search Customers](/doc/customers.md#search-customers)
* [Delete Customer](/doc/customers.md#delete-customer)
* [Retrieve Customer](/doc/customers.md#retrieve-customer)
* [Update Customer](/doc/customers.md#update-customer)
* [Create Customer Card](/doc/customers.md#create-customer-card)
* [Delete Customer Card](/doc/customers.md#delete-customer-card)
* [Remove Group From Customer](/doc/customers.md#remove-group-from-customer)
* [Add Group to Customer](/doc/customers.md#add-group-to-customer)

## List Customers

Lists customer profiles associated with a Square account.

Under normal operating conditions, newly created or updated customer profiles become available 
for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated 
profiles can take closer to one minute or longer, espeically during network incidents and outages.

```ruby
def list_customers(cursor: nil,
                   sort_field: nil,
                   sort_order: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information. |
| `sort_field` | [`String (Customer Sort Field)`](/doc/models/customer-sort-field.md) | Query, Optional | Indicates how Customers should be sorted.<br><br>Default: `DEFAULT`. |
| `sort_order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | Indicates whether Customers should be sorted in ascending (`ASC`) or<br>descending (`DESC`) order.<br><br>Default: `ASC`. |

### Response Type

[`List Customers Response Hash`](/doc/models/list-customers-response.md)

### Example Usage

```ruby
cursor = 'cursor6'
sort_field = 'DEFAULT'
sort_order = 'DESC'

result = customers_api.list_customers(cursor: cursor, sort_field: sort_field, sort_order: sort_order)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Create Customer

Creates a new customer for a business, which can have associated cards on file.

You must provide __at least one__ of the following values in your request to this
endpoint:

- `given_name`
- `family_name`
- `company_name`
- `email_address`
- `phone_number`

```ruby
def create_customer(body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Customer Request Hash`](/doc/models/create-customer-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Create Customer Response Hash`](/doc/models/create-customer-response.md)

### Example Usage

```ruby
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:given_name] = 'Amelia'
body[:family_name] = 'Earhart'
body[:company_name] = 'company_name2'
body[:nickname] = 'nickname2'
body[:email_address] = 'Amelia.Earhart@example.com'
body[:address] = {}
body[:address][:address_line_1] = '500 Electric Ave'
body[:address][:address_line_2] = 'Suite 600'
body[:address][:address_line_3] = 'address_line_38'
body[:address][:locality] = 'New York'
body[:address][:sublocality] = 'sublocality2'
body[:address][:administrative_district_level_1] = 'NY'
body[:address][:postal_code] = '10003'
body[:address][:country] = 'US'
body[:phone_number] = '1-212-555-4240'
body[:reference_id] = 'YOUR_REFERENCE_ID'
body[:note] = 'a customer'

result = customers_api.create_customer(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Search Customers

Searches the customer profiles associated with a Square account using 
one or more supported query filters. 

Calling `SearchCustomers` without any explicit query filter returns all
customer profiles ordered alphabetically based on `given_name` and
`family_name`.

Under normal operating conditions, newly created or updated customer profiles become available 
for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated 
profiles can take closer to one minute or longer, espeically during network incidents and outages.

```ruby
def search_customers(body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Customers Request Hash`](/doc/models/search-customers-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Search Customers Response Hash`](/doc/models/search-customers-response.md)

### Example Usage

```ruby
body = {}
body[:cursor] = 'cursor0'
body[:limit] = 2
body[:query] = {}
body[:query][:filter] = {}
body[:query][:filter][:creation_source] = {}
body[:query][:filter][:creation_source][:values] = ['THIRD_PARTY']
body[:query][:filter][:creation_source][:rule] = 'INCLUDE'
body[:query][:filter][:created_at] = {}
body[:query][:filter][:created_at][:start_at] = '2018-01-01T00:00:00-00:00'
body[:query][:filter][:created_at][:end_at] = '2018-02-01T00:00:00-00:00'
body[:query][:filter][:updated_at] = {}
body[:query][:filter][:updated_at][:start_at] = 'start_at4'
body[:query][:filter][:updated_at][:end_at] = 'end_at8'
body[:query][:filter][:email_address] = {}
body[:query][:filter][:email_address][:exact] = 'exact0'
body[:query][:filter][:email_address][:fuzzy] = 'example.com'
body[:query][:filter][:phone_number] = {}
body[:query][:filter][:phone_number][:exact] = 'exact0'
body[:query][:filter][:phone_number][:fuzzy] = 'fuzzy6'
body[:query][:filter][:group_ids] = {}
body[:query][:filter][:group_ids][:all] = ['545AXB44B4XXWMVQ4W8SBT3HHF']
body[:query][:filter][:group_ids][:any] = ['any0', 'any1', 'any2']
body[:query][:filter][:group_ids][:none] = ['none5', 'none6']
body[:query][:sort] = {}
body[:query][:sort][:field] = 'CREATED_AT'
body[:query][:sort][:order] = 'ASC'

result = customers_api.search_customers(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Delete Customer

Deletes a customer from a business, along with any linked cards on file. When two profiles
are merged into a single profile, that profile is assigned a new `customer_id`. You must use the
new `customer_id` to delete merged profiles.

```ruby
def delete_customer(customer_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to delete. |

### Response Type

[`Delete Customer Response Hash`](/doc/models/delete-customer-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'

result = customers_api.delete_customer(customer_id: customer_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Retrieve Customer

Returns details for a single customer.

```ruby
def retrieve_customer(customer_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to retrieve. |

### Response Type

[`Retrieve Customer Response Hash`](/doc/models/retrieve-customer-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'

result = customers_api.retrieve_customer(customer_id: customer_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Update Customer

Updates the details of an existing customer. When two profiles are merged
into a single profile, that profile is assigned a new `customer_id`. You must use
the new `customer_id` to update merged profiles.

You cannot edit a customer's cards on file with this endpoint. To make changes
to a card on file, you must delete the existing card on file with the
[DeleteCustomerCard](#endpoint-deletecustomercard) endpoint, then create a new one with the
[CreateCustomerCard](#endpoint-createcustomercard) endpoint.

```ruby
def update_customer(customer_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to update. |
| `body` | [`Update Customer Request Hash`](/doc/models/update-customer-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Update Customer Response Hash`](/doc/models/update-customer-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'
body = {}
body[:given_name] = 'given_name8'
body[:family_name] = 'family_name0'
body[:company_name] = 'company_name2'
body[:nickname] = 'nickname2'
body[:email_address] = 'New.Amelia.Earhart@example.com'
body[:phone_number] = ''
body[:note] = 'updated customer note'

result = customers_api.update_customer(customer_id: customer_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Create Customer Card

Adds a card on file to an existing customer.

As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
calls with the same card nonce return the same card record that was created
with the provided nonce during the _first_ call.

```ruby
def create_customer_card(customer_id:,
                         body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The Square ID of the customer profile the card is linked to. |
| `body` | [`Create Customer Card Request Hash`](/doc/models/create-customer-card-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`Create Customer Card Response Hash`](/doc/models/create-customer-card-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'
body = {}
body[:card_nonce] = 'YOUR_CARD_NONCE'
body[:billing_address] = {}
body[:billing_address][:address_line_1] = '500 Electric Ave'
body[:billing_address][:address_line_2] = 'Suite 600'
body[:billing_address][:address_line_3] = 'address_line_38'
body[:billing_address][:locality] = 'New York'
body[:billing_address][:sublocality] = 'sublocality2'
body[:billing_address][:administrative_district_level_1] = 'NY'
body[:billing_address][:postal_code] = '10003'
body[:billing_address][:country] = 'US'
body[:cardholder_name] = 'Amelia Earhart'
body[:verification_token] = 'verification_token0'

result = customers_api.create_customer_card(customer_id: customer_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Delete Customer Card

Removes a card on file from a customer.

```ruby
def delete_customer_card(customer_id:,
                         card_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer that the card on file belongs to. |
| `card_id` | `String` | Template, Required | The ID of the card on file to delete. |

### Response Type

[`Delete Customer Card Response Hash`](/doc/models/delete-customer-card-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'
card_id = 'card_id4'

result = customers_api.delete_customer_card(customer_id: customer_id, card_id: card_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Remove Group From Customer

Removes a group membership from a customer. 

The customer is identified by the `customer_id` value 
and the customer group is identified by the `group_id` value.

```ruby
def remove_group_from_customer(customer_id:,
                               group_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to remove from the group. |
| `group_id` | `String` | Template, Required | The ID of the customer group to remove the customer from. |

### Response Type

[`Remove Group From Customer Response Hash`](/doc/models/remove-group-from-customer-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'
group_id = 'group_id0'

result = customers_api.remove_group_from_customer(customer_id: customer_id, group_id: group_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Add Group to Customer

Adds a group membership to a customer. 

The customer is identified by the `customer_id` value 
and the customer group is identified by the `group_id` value.

```ruby
def add_group_to_customer(customer_id:,
                          group_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to add to a group. |
| `group_id` | `String` | Template, Required | The ID of the customer group to add the customer to. |

### Response Type

[`Add Group to Customer Response Hash`](/doc/models/add-group-to-customer-response.md)

### Example Usage

```ruby
customer_id = 'customer_id8'
group_id = 'group_id0'

result = customers_api.add_group_to_customer(customer_id: customer_id, group_id: group_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

