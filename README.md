# Getting Started with Square Connect API

Use Square APIs to manage and run business including payment, customer, product, inventory, and employee management.

## Install the Package

Install the gem from the command line:

```ruby
gem install square.rb
```

Or add the gem to your Gemfile and run `bundle`:

```ruby
gem 'square.rb'
```

For additional gem details, see the [RubyGems page for the square.rb gem](https://rubygems.org/gems/square.rb).



## Initialize the API Client

To initialize and authenticate the API client, the following parameters need to be passed.

| Parameter | Type | Description |
|  --- | --- | --- |
| `access_token` | `String` | OAuth 2.0 Access Token |
| `timeout` | `Float` | The value to use for connection timeout <br> **Default: 60.0** |
| `max_retries` | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| `retry_interval` | `Float` | Pause in seconds between retries. <br> **Default: 1.0** |
| `backoff_factor` | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff <br> **Default: 1.0** |

The API client can be initialized using a Configuration object as following.

```ruby
client = Square::Client.new(
  access_token: 'AccessToken',
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

### Make Calls with the API Client

```ruby
require 'square'

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


## Authorization

This API uses `OAuth 2 Bearer token`.

## Test the SDK

To run the tests, navigate to the root directory of the SDK in your terminal and execute the following command:

```
rake SQUARE_SANDBOX_TOKEN="YOUR_SANDBOX_TOKEN_HERE"
```

## Get help

The Square Ruby SDK is considered GA-stable but offered early as a beta. If you
have questions or comments contact
[Developer Support](https://squareup.com/help/us/en/contact?panel=BF53A9C8EF68).

## API Reference

### List of APIs

* [Mobile Authorization](#mobile-authorization)
* [O Auth](#o-auth)
* [V1 Locations](#v1-locations)
* [V1 Employees](#v1-employees)
* [V1 Transactions](#v1-transactions)
* [V1 Items](#v1-items)
* [Apple Pay](#apple-pay)
* [Catalog](#catalog)
* [Customers](#customers)
* [Employees](#employees)
* [Inventory](#inventory)
* [Labor](#labor)
* [Locations](#locations)
* [Reporting](#reporting)
* [Checkout](#checkout)
* [Orders](#orders)
* [Transactions](#transactions)

### Mobile Authorization

#### Overview

##### Get instance

An instance of the `MobileAuthorizationApi` class can be accessed from the API Client.

```
mobile_authorization_api = client.mobile_authorization
```

#### Create Mobile Authorization Code

Generates code to authorize a mobile application to connect to a Square card reader

Authorization codes are one-time-use and expire __60 minutes__ after being issued.

__Important:__ The `Authorization` header you provide to this endpoint must have the following format:

```
Authorization: Bearer ACCESS_TOKEN
```

Replace `ACCESS_TOKEN` with a [valid production authorization credential](https://docs.connect.squareup.com/get-started#step-4-understand-the-different-application-credentials).

```ruby
def create_mobile_authorization_code(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Mobile Authorization Code Request Hash`](#create-mobile-authorization-code-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Mobile Authorization Code Response Hash`](#create-mobile-authorization-code-response)

##### Example Usage

```ruby
body = {}

result = mobile_authorization_api.create_mobile_authorization_code(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### O Auth

#### Overview

##### Get instance

An instance of the `OAuthApi` class can be accessed from the API Client.

```
o_auth_api = client.o_auth
```

#### Renew Token

`RenewToken` is deprecated. For information about refreshing OAuth access tokens, see 
[Renew OAuth Token](/authz/oauth/cookbook/oauth-renew).


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

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `client_id` | `String` | Template, Required | Your application's ID, available from the [application dashboard](https://connect.squareup.com/apps). |
| `body` | [`Renew Token Request Hash`](#renew-token-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |
| `authorization` | `String` | Header, Required | Client APPLICATION_SECRET |

##### Response Type

[`Renew Token Response Hash`](#renew-token-response)

##### Example Usage

```ruby
client_id = 'client_id8'
body = {}
authorization = 'Authorization8'

result = o_auth_api.renew_token(client_id: client_id, body: body, authorization: authorization)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Revoke Token

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

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Revoke Token Request Hash`](#revoke-token-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |
| `authorization` | `String` | Header, Required | Client APPLICATION_SECRET |

##### Response Type

[`Revoke Token Response Hash`](#revoke-token-response)

##### Example Usage

```ruby
body = {}
authorization = 'Authorization8'

result = o_auth_api.revoke_token(body: body, authorization: authorization)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Obtain Token

Returns an OAuth access token. 

The endpoint supports distinct methods of obtaining OAuth access tokens. 
Applications specify a method by adding the `grant_type` parameter 
in the request and also provide relevant information. 
For more information, see [OAuth access token management](/authz/oauth/how-it-works#oauth-access-token-management). 

__Note:__ Regardless of the method application specified,
the endpoint always returns two items; an OAuth access token and 
a refresh token in the response. 

__OAuth tokens should only live on secure servers. Application clients
should never interact directly with OAuth tokens__.

:information_source: **Note** This endpoint does not require authentication.

```ruby
def obtain_token(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Obtain Token Request Hash`](#obtain-token-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Obtain Token Response Hash`](#obtain-token-response)

##### Example Usage

```ruby
body = {}
body[:client_id] = 'client_id8'
body[:client_secret] = 'client_secret4'
body[:grant_type] = 'grant_type8'

result = o_auth_api.obtain_token(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### V1 Locations

#### Overview

##### Get instance

An instance of the `V1LocationsApi` class can be accessed from the API Client.

```
v1_locations_api = client.v1_locations
```

#### Retrieve Business

Get a business's information.

```ruby
def retrieve_business
```

##### Response Type

[`V1 Merchant Hash`](#v1-merchant)

##### Example Usage

```ruby
result = v1_locations_api.retrieve_business()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Locations

Provides details for a business's locations, including their IDs.

```ruby
def list_locations
```

##### Response Type

[`Array<V1 Merchant Hash>`](#v1-merchant)

##### Example Usage

```ruby
result = v1_locations_api.list_locations()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### V1 Employees

#### Overview

##### Get instance

An instance of the `V1EmployeesApi` class can be accessed from the API Client.

```
v1_employees_api = client.v1_employees
```

#### List Employees

Provides summary information for all of a business's employees.

```ruby
def list_employees(order: nil,
                   begin_updated_at: nil,
                   end_updated_at: nil,
                   begin_created_at: nil,
                   end_created_at: nil,
                   status: nil,
                   external_id: nil,
                   limit: nil,
                   batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which employees are listed in the response, based on their created_at field.      Default value: ASC |
| `begin_updated_at` | `String` | Query, Optional | If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format |
| `end_updated_at` | `String` | Query, Optional | If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_created_at` | `String` | Query, Optional | If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_created_at` | `String` | Query, Optional | If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format. |
| `status` | [`String (V1 Employee Status)`](#v1-employee-status) | Query, Optional | If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE). |
| `external_id` | `String` | Query, Optional | If provided, the endpoint returns only employee entities with the specified external_id. |
| `limit` | `Integer` | Query, Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Employee Hash>`](#v1-employee)

##### Example Usage

```ruby

result = v1_employees_api.list_employees()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Employee

Use the CreateEmployee endpoint to add an employee to a Square
account. Employees created with the Connect API have an initial status
of `INACTIVE`. Inactive employees cannot sign in to Square Point of Sale
until they are activated from the Square Dashboard. Employee status
cannot be changed with the Connect API.

<aside class="important">
Employee entities cannot be deleted. To disable employee profiles,
set the employee's status to <code>INACTIVE</code>
</aside>

```ruby
def create_employee(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Employee Hash`](#v1-employee) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Employee Hash`](#v1-employee)

##### Example Usage

```ruby
body = {}
body[:first_name] = 'first_name6'
body[:last_name] = 'last_name4'

result = v1_employees_api.create_employee(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Employee

Provides the details for a single employee.

```ruby
def retrieve_employee(employee_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Template, Required | The employee's ID. |

##### Response Type

[`V1 Employee Hash`](#v1-employee)

##### Example Usage

```ruby
employee_id = 'employee_id0'

result = v1_employees_api.retrieve_employee(employee_id: employee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Employee

UpdateEmployee

```ruby
def update_employee(employee_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Template, Required | The ID of the role to modify. |
| `body` | [`V1 Employee Hash`](#v1-employee) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Employee Hash`](#v1-employee)

##### Example Usage

```ruby
employee_id = 'employee_id0'
body = {}
body[:first_name] = 'first_name6'
body[:last_name] = 'last_name4'

result = v1_employees_api.update_employee(employee_id: employee_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Employee Roles

Provides summary information for all of a business's employee roles.

```ruby
def list_employee_roles(order: nil,
                        limit: nil,
                        batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which employees are listed in the response, based on their created_at field.Default value: ASC |
| `limit` | `Integer` | Query, Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Employee Role Hash>`](#v1-employee-role)

##### Example Usage

```ruby

result = v1_employees_api.list_employee_roles()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Employee Role

Creates an employee role you can then assign to employees.

Square accounts can include any number of roles that can be assigned to
employees. These roles define the actions and permissions granted to an
employee with that role. For example, an employee with a "Shift Manager"
role might be able to issue refunds in Square Point of Sale, whereas an
employee with a "Clerk" role might not.

Roles are assigned with the [V1UpdateEmployee](#endpoint-v1updateemployee)
endpoint. An employee can have only one role at a time.

If an employee has no role, they have none of the permissions associated
with roles. All employees can accept payments with Square Point of Sale.

```ruby
def create_employee_role(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Employee Role Hash`](#v1-employee-role) | Body, Required | An EmployeeRole object with a name and permissions, and an optional owner flag. |

##### Response Type

[`V1 Employee Role Hash`](#v1-employee-role)

##### Example Usage

```ruby
body = {}
body[:name] = 'name6'
body[:permissions] = ['REGISTER_APPLY_RESTRICTED_DISCOUNTS', 'REGISTER_CHANGE_SETTINGS', 'REGISTER_EDIT_ITEM']

result = v1_employees_api.create_employee_role(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Employee Role

Provides the details for a single employee role.

```ruby
def retrieve_employee_role(role_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `role_id` | `String` | Template, Required | The role's ID. |

##### Response Type

[`V1 Employee Role Hash`](#v1-employee-role)

##### Example Usage

```ruby
role_id = 'role_id6'

result = v1_employees_api.retrieve_employee_role(role_id: role_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Employee Role

Modifies the details of an employee role.

```ruby
def update_employee_role(role_id:,
                         body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `role_id` | `String` | Template, Required | The ID of the role to modify. |
| `body` | [`V1 Employee Role Hash`](#v1-employee-role) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Employee Role Hash`](#v1-employee-role)

##### Example Usage

```ruby
role_id = 'role_id6'
body = {}
body[:name] = 'name6'
body[:permissions] = ['REGISTER_APPLY_RESTRICTED_DISCOUNTS', 'REGISTER_CHANGE_SETTINGS', 'REGISTER_EDIT_ITEM']

result = v1_employees_api.update_employee_role(role_id: role_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Timecards

Provides summary information for all of a business's employee timecards.

```ruby
def list_timecards(order: nil,
                   employee_id: nil,
                   begin_clockin_time: nil,
                   end_clockin_time: nil,
                   begin_clockout_time: nil,
                   end_clockout_time: nil,
                   begin_updated_at: nil,
                   end_updated_at: nil,
                   deleted: nil,
                   limit: nil,
                   batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which timecards are listed in the response, based on their created_at field. |
| `employee_id` | `String` | Query, Optional | If provided, the endpoint returns only timecards for the employee with the specified ID. |
| `begin_clockin_time` | `String` | Query, Optional | If filtering results by their clockin_time field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_clockin_time` | `String` | Query, Optional | If filtering results by their clockin_time field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_clockout_time` | `String` | Query, Optional | If filtering results by their clockout_time field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_clockout_time` | `String` | Query, Optional | If filtering results by their clockout_time field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_updated_at` | `String` | Query, Optional | If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_updated_at` | `String` | Query, Optional | If filtering results by their updated_at field, the end of the requested reporting period, in ISO 8601 format. |
| `deleted` | `Boolean` | Query, Optional | If true, only deleted timecards are returned. If false, only valid timecards are returned.If you don't provide this parameter, both valid and deleted timecards are returned. |
| `limit` | `Integer` | Query, Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Timecard Hash>`](#v1-timecard)

##### Example Usage

```ruby

result = v1_employees_api.list_timecards()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Timecard

Creates a timecard for an employee and clocks them in with an
`API_CREATE` event and a `clockin_time` set to the current time unless
the request provides a different value. To import timecards from another
system (rather than clocking someone in). Specify the `clockin_time`
and* `clockout_time` in the request.

Timecards correspond to exactly one shift for a given employee, bounded
by the `clockin_time` and `clockout_time` fields. An employee is
considered clocked in if they have a timecard that doesn't have a
`clockout_time` set. An employee that is currently clocked in cannot
be clocked in a second time.

```ruby
def create_timecard(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Timecard Hash`](#v1-timecard) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Timecard Hash`](#v1-timecard)

##### Example Usage

```ruby
body = {}
body[:employee_id] = 'employee_id4'

result = v1_employees_api.create_timecard(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Timecard

Deletes a timecard. Timecards can also be deleted through the
Square Dashboard. Deleted timecards are still accessible through
Connect API endpoints, but cannot be modified. The `deleted` field of
the `Timecard` object indicates whether the timecard has been deleted.

*Note**: By default, deleted timecards appear alongside valid timecards in
results returned by the [ListTimecards](#endpoint-v1employees-listtimecards)
endpoint. To filter deleted timecards, include the `deleted` query
parameter in the list request.

<aside>
Only approved accounts can manage their employees with Square.
Unapproved accounts cannot use employee management features with the
API.
</aside>

```ruby
def delete_timecard(timecard_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | The ID of the timecard to delete. |

##### Response Type

`Object`

##### Example Usage

```ruby
timecard_id = 'timecard_id0'

result = v1_employees_api.delete_timecard(timecard_id: timecard_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Timecard

Provides the details for a single timecard.
<aside>
Only approved accounts can manage their employees with Square.
Unapproved accounts cannot use employee management features with the
API.
</aside>

```ruby
def retrieve_timecard(timecard_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | The timecard's ID. |

##### Response Type

[`V1 Timecard Hash`](#v1-timecard)

##### Example Usage

```ruby
timecard_id = 'timecard_id0'

result = v1_employees_api.retrieve_timecard(timecard_id: timecard_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Timecard

Modifies the details of a timecard with an `API_EDIT` event for
the timecard. Updating an active timecard with a `clockout_time`
clocks the employee out.

```ruby
def update_timecard(timecard_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | TThe ID of the timecard to modify. |
| `body` | [`V1 Timecard Hash`](#v1-timecard) | Body, Required | An object containing the fields to POST for the request.<br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Timecard Hash`](#v1-timecard)

##### Example Usage

```ruby
timecard_id = 'timecard_id0'
body = {}
body[:employee_id] = 'employee_id4'

result = v1_employees_api.update_timecard(timecard_id: timecard_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Timecard Events

Provides summary information for all events associated with a
particular timecard.

<aside>
Only approved accounts can manage their employees with Square.
Unapproved accounts cannot use employee management features with the
API.
</aside>

```ruby
def list_timecard_events(timecard_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | The ID of the timecard to list events for. |

##### Response Type

[`Array<V1 Timecard Event Hash>`](#v1-timecard-event)

##### Example Usage

```ruby
timecard_id = 'timecard_id0'

result = v1_employees_api.list_timecard_events(timecard_id: timecard_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Cash Drawer Shifts

Provides the details for all of a location's cash drawer shifts during a date range. The date range you specify cannot exceed 90 days.

```ruby
def list_cash_drawer_shifts(location_id:,
                            order: nil,
                            begin_time: nil,
                            end_time: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list cash drawer shifts for. |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which cash drawer shifts are listed in the response, based on their created_at field. Default value: ASC |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time minus 90 days. |
| `end_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time. |

##### Response Type

[`Array<V1 Cash Drawer Shift Hash>`](#v1-cash-drawer-shift)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_employees_api.list_cash_drawer_shifts(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Cash Drawer Shift

Provides the details for a single cash drawer shift, including all events that occurred during the shift.

```ruby
def retrieve_cash_drawer_shift(location_id:,
                               shift_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list cash drawer shifts for. |
| `shift_id` | `String` | Template, Required | The shift's ID. |

##### Response Type

[`V1 Cash Drawer Shift Hash`](#v1-cash-drawer-shift)

##### Example Usage

```ruby
location_id = 'location_id4'
shift_id = 'shift_id0'

result = v1_employees_api.retrieve_cash_drawer_shift(location_id: location_id, shift_id: shift_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### V1 Transactions

#### Overview

##### Get instance

An instance of the `V1TransactionsApi` class can be accessed from the API Client.

```
v1_transactions_api = client.v1_transactions
```

#### List Bank Accounts

Provides non-confidential details for all of a location's associated bank accounts. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.

```ruby
def list_bank_accounts(location_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list bank accounts for. |

##### Response Type

[`Array<V1 Bank Account Hash>`](#v1-bank-account)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_transactions_api.list_bank_accounts(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Bank Account

Provides non-confidential details for a merchant's associated bank account. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.

```ruby
def retrieve_bank_account(location_id:,
                          bank_account_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the bank account's associated location. |
| `bank_account_id` | `String` | Template, Required | The bank account's Square-issued ID. You obtain this value from Settlement objects returned. |

##### Response Type

[`V1 Bank Account Hash`](#v1-bank-account)

##### Example Usage

```ruby
location_id = 'location_id4'
bank_account_id = 'bank_account_id0'

result = v1_transactions_api.retrieve_bank_account(location_id: location_id, bank_account_id: bank_account_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Orders

Provides summary information for a merchant's online store orders.

```ruby
def list_orders(location_id:,
                order: nil,
                limit: nil,
                batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list online store orders for. |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | TThe order in which payments are listed in the response. |
| `limit` | `Integer` | Query, Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Order Hash>`](#v1-order)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_transactions_api.list_orders(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Order

Provides comprehensive information for a single online store order, including the order's history.

```ruby
def retrieve_order(location_id:,
                   order_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the order's associated location. |
| `order_id` | `String` | Template, Required | The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint |

##### Response Type

[`V1 Order Hash`](#v1-order)

##### Example Usage

```ruby
location_id = 'location_id4'
order_id = 'order_id6'

result = v1_transactions_api.retrieve_order(location_id: location_id, order_id: order_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Order

Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:

```ruby
def update_order(location_id:,
                 order_id:,
                 body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the order's associated location. |
| `order_id` | `String` | Template, Required | The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint |
| `body` | [`V1 Update Order Request Hash`](#v1-update-order-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Order Hash`](#v1-order)

##### Example Usage

```ruby
location_id = 'location_id4'
order_id = 'order_id6'
body = {}
body[:action] = 'REFUND'

result = v1_transactions_api.update_order(location_id: location_id, order_id: order_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Payments

Provides summary information for all payments taken for a given
Square account during a date range. Date ranges cannot exceed 1 year in
length. See Date ranges for details of inclusive and exclusive dates.

*Note**: Details for payments processed with Square Point of Sale while
in offline mode may not be transmitted to Square for up to 72 hours.
Offline payments have a `created_at` value that reflects the time the
payment was originally processed, not the time it was subsequently
transmitted to Square. Consequently, the ListPayments endpoint might
list an offline payment chronologically between online payments that
were seen in a previous request.

```ruby
def list_payments(location_id:,
                  order: nil,
                  begin_time: nil,
                  end_time: nil,
                  limit: nil,
                  batch_token: nil,
                  include_partial: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list payments for. If you specify me, this endpoint returns payments aggregated from all of the business's locations. |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which payments are listed in the response. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Query, Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |
| `include_partial` | `Boolean` | Query, Optional | Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed. |

##### Response Type

[`Array<V1 Payment Hash>`](#v1-payment)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_transactions_api.list_payments(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Payment

Provides comprehensive information for a single payment.

```ruby
def retrieve_payment(location_id:,
                     payment_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the payment's associated location. |
| `payment_id` | `String` | Template, Required | The Square-issued payment ID. payment_id comes from Payment objects returned by the List Payments endpoint, Settlement objects returned by the List Settlements endpoint, or Refund objects returned by the List Refunds endpoint. |

##### Response Type

[`V1 Payment Hash`](#v1-payment)

##### Example Usage

```ruby
location_id = 'location_id4'
payment_id = 'payment_id0'

result = v1_transactions_api.retrieve_payment(location_id: location_id, payment_id: payment_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Refunds

Provides the details for all refunds initiated by a merchant or any of the merchant's mobile staff during a date range. Date ranges cannot exceed one year in length.

```ruby
def list_refunds(location_id:,
                 order: nil,
                 begin_time: nil,
                 end_time: nil,
                 limit: nil,
                 batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list refunds for. |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | TThe order in which payments are listed in the response. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Query, Optional | The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Refund Hash>`](#v1-refund)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_transactions_api.list_refunds(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Refund

Issues a refund for a previously processed payment. You must issue
a refund within 60 days of the associated payment.

You cannot issue a partial refund for a split tender payment. You must
instead issue a full or partial refund for a particular tender, by
providing the applicable tender id to the V1CreateRefund endpoint.
Issuing a full refund for a split tender payment refunds all tenders
associated with the payment.

Issuing a refund for a card payment is not reversible. For development
purposes, you can create fake cash payments in Square Point of Sale and
refund them.

```ruby
def create_refund(location_id:,
                  body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the original payment's associated location. |
| `body` | [`V1 Create Refund Request Hash`](#v1-create-refund-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Refund Hash`](#v1-refund)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}
body[:payment_id] = 'payment_id6'
body[:type] = 'FULL'
body[:reason] = 'reason8'

result = v1_transactions_api.create_refund(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Settlements

Provides summary information for all deposits and withdrawals
initiated by Square to a linked bank account during a date range. Date
ranges cannot exceed one year in length.

*Note**: the ListSettlements endpoint does not provide entry
information.

```ruby
def list_settlements(location_id:,
                     order: nil,
                     begin_time: nil,
                     end_time: nil,
                     limit: nil,
                     status: nil,
                     batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list settlements for. If you specify me, this endpoint returns payments aggregated from all of the business's locations. |
| `order` | [`String (Sort Order)`](#sort-order) | Query, Optional | TThe order in which payments are listed in the response. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Query, Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `status` | [`String (V1 List Settlements Request Status)`](#v1-list-settlements-request-status) | Query, Optional | Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED). |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Settlement Hash>`](#v1-settlement)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_transactions_api.list_settlements(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Settlement

Provides comprehensive information for a single settlement.

The returned `Settlement` objects include an `entries` field that lists
the transactions that contribute to the settlement total. Most
settlement entries correspond to a payment payout, but settlement
entries are also generated for less common events, like refunds, manual
adjustments, or chargeback holds.

Square initiates its regular deposits as indicated in the
[Deposit Options with Square](https://squareup.com/help/us/en/article/3807)
help article. Details for a regular deposit are usually not available
from Connect API endpoints before 10 p.m. PST the same day.

Square does not know when an initiated settlement **completes**, only
whether it has failed. A completed settlement is typically reflected in
a bank account within 3 business days, but in exceptional cases it may
take longer.

```ruby
def retrieve_settlement(location_id:,
                        settlement_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the settlements's associated location. |
| `settlement_id` | `String` | Template, Required | The settlement's Square-issued ID. You obtain this value from Settlement objects returned by the List Settlements endpoint. |

##### Response Type

[`V1 Settlement Hash`](#v1-settlement)

##### Example Usage

```ruby
location_id = 'location_id4'
settlement_id = 'settlement_id0'

result = v1_transactions_api.retrieve_settlement(location_id: location_id, settlement_id: settlement_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### V1 Items

#### Overview

##### Get instance

An instance of the `V1ItemsApi` class can be accessed from the API Client.

```
v1_items_api = client.v1_items
```

#### List Categories

Lists all of a location's item categories.

```ruby
def list_categories(location_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list categories for. |

##### Response Type

[`Array<V1 Category Hash>`](#v1-category)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_categories(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Category

Creates an item category.

```ruby
def create_category(location_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Category Hash`](#v1-category) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Category Hash`](#v1-category)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_category(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Category

Deletes an existing item category.
*Note**: DeleteCategory returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteCategoryRequest` object
as documented below.

```ruby
def delete_category(location_id:,
                    category_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `category_id` | `String` | Template, Required | The ID of the category to delete. |

##### Response Type

[`V1 Category Hash`](#v1-category)

##### Example Usage

```ruby
location_id = 'location_id4'
category_id = 'category_id8'

result = v1_items_api.delete_category(location_id: location_id, category_id: category_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Category

Modifies the details of an existing item category.

```ruby
def update_category(location_id:,
                    category_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the category's associated location. |
| `category_id` | `String` | Template, Required | The ID of the category to edit. |
| `body` | [`V1 Category Hash`](#v1-category) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Category Hash`](#v1-category)

##### Example Usage

```ruby
location_id = 'location_id4'
category_id = 'category_id8'
body = {}

result = v1_items_api.update_category(location_id: location_id, category_id: category_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Discounts

Lists all of a location's discounts.

```ruby
def list_discounts(location_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list categories for. |

##### Response Type

[`Array<V1 Discount Hash>`](#v1-discount)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_discounts(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Discount

Creates a discount.

```ruby
def create_discount(location_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Discount Hash`](#v1-discount) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Discount Hash`](#v1-discount)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_discount(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Discount

Deletes an existing discount.
*Note**: DeleteDiscount returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteDiscountRequest` object
as documented below.

```ruby
def delete_discount(location_id:,
                    discount_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `discount_id` | `String` | Template, Required | The ID of the discount to delete. |

##### Response Type

[`V1 Discount Hash`](#v1-discount)

##### Example Usage

```ruby
location_id = 'location_id4'
discount_id = 'discount_id8'

result = v1_items_api.delete_discount(location_id: location_id, discount_id: discount_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Discount

Modifies the details of an existing discount.

```ruby
def update_discount(location_id:,
                    discount_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the category's associated location. |
| `discount_id` | `String` | Template, Required | The ID of the discount to edit. |
| `body` | [`V1 Discount Hash`](#v1-discount) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Discount Hash`](#v1-discount)

##### Example Usage

```ruby
location_id = 'location_id4'
discount_id = 'discount_id8'
body = {}

result = v1_items_api.update_discount(location_id: location_id, discount_id: discount_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Fees

Lists all of a location's fees (taxes).

```ruby
def list_fees(location_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list fees for. |

##### Response Type

[`Array<V1 Fee Hash>`](#v1-fee)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_fees(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Fee

Creates a fee (tax).

```ruby
def create_fee(location_id:,
               body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create a fee for. |
| `body` | [`V1 Fee Hash`](#v1-fee) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Fee Hash`](#v1-fee)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_fee(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Fee

Deletes an existing fee (tax).
*Note**: DeleteFee returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteFeeRequest` object
as documented below.

```ruby
def delete_fee(location_id:,
               fee_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `fee_id` | `String` | Template, Required | The ID of the fee to delete. |

##### Response Type

[`V1 Fee Hash`](#v1-fee)

##### Example Usage

```ruby
location_id = 'location_id4'
fee_id = 'fee_id8'

result = v1_items_api.delete_fee(location_id: location_id, fee_id: fee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Fee

Modifies the details of an existing fee (tax).

```ruby
def update_fee(location_id:,
               fee_id:,
               body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `fee_id` | `String` | Template, Required | The ID of the fee to edit. |
| `body` | [`V1 Fee Hash`](#v1-fee) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Fee Hash`](#v1-fee)

##### Example Usage

```ruby
location_id = 'location_id4'
fee_id = 'fee_id8'
body = {}

result = v1_items_api.update_fee(location_id: location_id, fee_id: fee_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Inventory

Provides inventory information for all of a merchant's inventory-enabled item variations.

```ruby
def list_inventory(location_id:,
                   limit: nil,
                   batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `limit` | `Integer` | Query, Optional | The maximum number of inventory entries to return in a single response. This value cannot exceed 1000. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Inventory Entry Hash>`](#v1-inventory-entry)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_inventory(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Adjust Inventory

Adjusts an item variation's current available inventory.

```ruby
def adjust_inventory(location_id:,
                     variation_id:,
                     body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `variation_id` | `String` | Template, Required | The ID of the variation to adjust inventory information for. |
| `body` | [`V1 Adjust Inventory Request Hash`](#v1-adjust-inventory-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Inventory Entry Hash`](#v1-inventory-entry)

##### Example Usage

```ruby
location_id = 'location_id4'
variation_id = 'variation_id2'
body = {}

result = v1_items_api.adjust_inventory(location_id: location_id, variation_id: variation_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Items

Provides summary information for all of a location's items.

```ruby
def list_items(location_id:,
               batch_token: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list items for. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Response Type

[`Array<V1 Item Hash>`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_items(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Item

Creates an item and at least one variation for it. Item-related
entities include fields you can use to associate them with entities in a
non-Square system.

When you create an item-related entity, you can optionally specify its
`id`. This value must be unique among all IDs ever specified for the
account, including those specified by other applications. You can never
reuse an entity ID. If you do not specify an ID, Square generates one
for the entity.

Item variations have a `user_data` string that lets you associate
arbitrary metadata with the variation. The string cannot exceed 255
characters.

```ruby
def create_item(location_id:,
                body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Item Hash`](#v1-item) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_item(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Item

Deletes an existing item and all item variations associated with it.
*Note**: DeleteItem returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteItemRequest` object
as documented below.

```ruby
def delete_item(location_id:,
                item_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to modify. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'

result = v1_items_api.delete_item(location_id: location_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Item

Provides the details for a single item, including associated modifier lists and fees.

```ruby
def retrieve_item(location_id:,
                  item_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The item's ID. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'

result = v1_items_api.retrieve_item(location_id: location_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Item

Modifies the core details of an existing item.

```ruby
def update_item(location_id:,
                item_id:,
                body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to modify. |
| `body` | [`V1 Item Hash`](#v1-item) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
body = {}

result = v1_items_api.update_item(location_id: location_id, item_id: item_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Remove Fee

Removes a fee assocation from an item, meaning the fee is no longer automatically applied to the item in Square Register.

```ruby
def remove_fee(location_id:,
               item_id:,
               fee_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to add the fee to. |
| `fee_id` | `String` | Template, Required | The ID of the fee to apply. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
fee_id = 'fee_id8'

result = v1_items_api.remove_fee(location_id: location_id, item_id: item_id, fee_id: fee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Apply Fee

Associates a fee with an item, meaning the fee is automatically applied to the item in Square Register.

```ruby
def apply_fee(location_id:,
              item_id:,
              fee_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the fee's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to add the fee to. |
| `fee_id` | `String` | Template, Required | The ID of the fee to apply. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
fee_id = 'fee_id8'

result = v1_items_api.apply_fee(location_id: location_id, item_id: item_id, fee_id: fee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Remove Modifier List

Removes a modifier list association from an item, meaning modifier options from the list can no longer be applied to the item.

```ruby
def remove_modifier_list(location_id:,
                         modifier_list_id:,
                         item_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to remove. |
| `item_id` | `String` | Template, Required | The ID of the item to remove the modifier list from. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
item_id = 'item_id0'

result = v1_items_api.remove_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Apply Modifier List

Associates a modifier list with an item, meaning modifier options from the list can be applied to the item.

```ruby
def apply_modifier_list(location_id:,
                        modifier_list_id:,
                        item_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to apply. |
| `item_id` | `String` | Template, Required | The ID of the item to add the modifier list to. |

##### Response Type

[`V1 Item Hash`](#v1-item)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
item_id = 'item_id0'

result = v1_items_api.apply_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id, item_id: item_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Variation

Creates an item variation for an existing item.

```ruby
def create_variation(location_id:,
                     item_id:,
                     body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The item's ID. |
| `body` | [`V1 Variation Hash`](#v1-variation) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Variation Hash`](#v1-variation)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
body = {}

result = v1_items_api.create_variation(location_id: location_id, item_id: item_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Variation

Deletes an existing item variation from an item.
*Note**: DeleteVariation returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteVariationRequest` object
as documented below.

```ruby
def delete_variation(location_id:,
                     item_id:,
                     variation_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to delete. |
| `variation_id` | `String` | Template, Required | The ID of the variation to delete. |

##### Response Type

[`V1 Variation Hash`](#v1-variation)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
variation_id = 'variation_id2'

result = v1_items_api.delete_variation(location_id: location_id, item_id: item_id, variation_id: variation_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Variation

Modifies the details of an existing item variation.

```ruby
def update_variation(location_id:,
                     item_id:,
                     variation_id:,
                     body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `item_id` | `String` | Template, Required | The ID of the item to modify. |
| `variation_id` | `String` | Template, Required | The ID of the variation to modify. |
| `body` | [`V1 Variation Hash`](#v1-variation) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Variation Hash`](#v1-variation)

##### Example Usage

```ruby
location_id = 'location_id4'
item_id = 'item_id0'
variation_id = 'variation_id2'
body = {}

result = v1_items_api.update_variation(location_id: location_id, item_id: item_id, variation_id: variation_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Modifier Lists

Lists all of a location's modifier lists.

```ruby
def list_modifier_lists(location_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list modifier lists for. |

##### Response Type

[`Array<V1 Modifier List Hash>`](#v1-modifier-list)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_modifier_lists(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Modifier List

Creates an item modifier list and at least one modifier option for it.

```ruby
def create_modifier_list(location_id:,
                         body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create a modifier list for. |
| `body` | [`V1 Modifier List Hash`](#v1-modifier-list) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Modifier List Hash`](#v1-modifier-list)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_modifier_list(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Modifier List

Deletes an existing item modifier list and all modifier options
associated with it.
*Note**: DeleteModifierList returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteModifierListRequest` object
as documented below.

```ruby
def delete_modifier_list(location_id:,
                         modifier_list_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to delete. |

##### Response Type

[`V1 Modifier List Hash`](#v1-modifier-list)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'

result = v1_items_api.delete_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Modifier List

Provides the details for a single modifier list.

```ruby
def retrieve_modifier_list(location_id:,
                           modifier_list_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The modifier list's ID. |

##### Response Type

[`V1 Modifier List Hash`](#v1-modifier-list)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'

result = v1_items_api.retrieve_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Modifier List

Modifies the details of an existing item modifier list.

```ruby
def update_modifier_list(location_id:,
                         modifier_list_id:,
                         body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `body` | [`V1 Update Modifier List Request Hash`](#v1-update-modifier-list-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Modifier List Hash`](#v1-modifier-list)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
body = {}

result = v1_items_api.update_modifier_list(location_id: location_id, modifier_list_id: modifier_list_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Modifier Option

Creates an item modifier option and adds it to a modifier list.

```ruby
def create_modifier_option(location_id:,
                           modifier_list_id:,
                           body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `body` | [`V1 Modifier Option Hash`](#v1-modifier-option) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Modifier Option Hash`](#v1-modifier-option)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
body = {}

result = v1_items_api.create_modifier_option(location_id: location_id, modifier_list_id: modifier_list_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Modifier Option

Deletes an existing item modifier option from a modifier list.
*Note**: DeleteModifierOption returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeleteModifierOptionRequest` object
as documented below.

```ruby
def delete_modifier_option(location_id:,
                           modifier_list_id:,
                           modifier_option_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to delete. |
| `modifier_option_id` | `String` | Template, Required | The ID of the modifier list to edit. |

##### Response Type

[`V1 Modifier Option Hash`](#v1-modifier-option)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
modifier_option_id = 'modifier_option_id6'

result = v1_items_api.delete_modifier_option(location_id: location_id, modifier_list_id: modifier_list_id, modifier_option_id: modifier_option_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Modifier Option

Modifies the details of an existing item modifier option.

```ruby
def update_modifier_option(location_id:,
                           modifier_list_id:,
                           modifier_option_id:,
                           body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the item's associated location. |
| `modifier_list_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `modifier_option_id` | `String` | Template, Required | The ID of the modifier list to edit. |
| `body` | [`V1 Modifier Option Hash`](#v1-modifier-option) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Modifier Option Hash`](#v1-modifier-option)

##### Example Usage

```ruby
location_id = 'location_id4'
modifier_list_id = 'modifier_list_id6'
modifier_option_id = 'modifier_option_id6'
body = {}

result = v1_items_api.update_modifier_option(location_id: location_id, modifier_list_id: modifier_list_id, modifier_option_id: modifier_option_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Pages

Lists all of a location's Favorites pages in Square Register.

```ruby
def list_pages(location_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list Favorites pages for. |

##### Response Type

[`Array<V1 Page Hash>`](#v1-page)

##### Example Usage

```ruby
location_id = 'location_id4'

result = v1_items_api.list_pages(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Page

Creates a Favorites page in Square Register.

```ruby
def create_page(location_id:,
                body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to create an item for. |
| `body` | [`V1 Page Hash`](#v1-page) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Page Hash`](#v1-page)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = v1_items_api.create_page(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Page

Deletes an existing Favorites page and all of its cells.
*Note**: DeletePage returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeletePageRequest` object
as documented below.

```ruby
def delete_page(location_id:,
                page_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location. |
| `page_id` | `String` | Template, Required | The ID of the page to delete. |

##### Response Type

[`V1 Page Hash`](#v1-page)

##### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'

result = v1_items_api.delete_page(location_id: location_id, page_id: page_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Page

Modifies the details of a Favorites page in Square Register.

```ruby
def update_page(location_id:,
                page_id:,
                body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location |
| `page_id` | `String` | Template, Required | The ID of the page to modify. |
| `body` | [`V1 Page Hash`](#v1-page) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Page Hash`](#v1-page)

##### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'
body = {}

result = v1_items_api.update_page(location_id: location_id, page_id: page_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Page Cell

Deletes a cell from a Favorites page in Square Register.
*Note**: DeletePageCell returns nothing on success but Connect SDKs
map the empty response to an empty `V1DeletePageCellRequest` object
as documented below.

```ruby
def delete_page_cell(location_id:,
                     page_id:,
                     row: nil,
                     column: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location. |
| `page_id` | `String` | Template, Required | The ID of the page to delete. |
| `row` | `String` | Query, Optional | The row of the cell to clear. Always an integer between 0 and 4, inclusive. Row 0 is the top row. |
| `column` | `String` | Query, Optional | The column of the cell to clear. Always an integer between 0 and 4, inclusive. Column 0 is the leftmost column. |

##### Response Type

[`V1 Page Hash`](#v1-page)

##### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'

result = v1_items_api.delete_page_cell(location_id: location_id, page_id: page_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Page Cell

Modifies a cell of a Favorites page in Square Register.

```ruby
def update_page_cell(location_id:,
                     page_id:,
                     body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the Favorites page's associated location. |
| `page_id` | `String` | Template, Required | The ID of the page the cell belongs to. |
| `body` | [`V1 Page Cell Hash`](#v1-page-cell) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`V1 Page Hash`](#v1-page)

##### Example Usage

```ruby
location_id = 'location_id4'
page_id = 'page_id0'
body = {}

result = v1_items_api.update_page_cell(location_id: location_id, page_id: page_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Apple Pay

#### Overview

##### Get instance

An instance of the `ApplePayApi` class can be accessed from the API Client.

```
apple_pay_api = client.apple_pay
```

#### Register Domain

Activates a domain for use with Web Apple Pay and Square. A validation
will be performed on this domain by Apple to ensure is it properly set up as
an Apple Pay enabled domain.

This endpoint provides an easy way for platform developers to bulk activate
Web Apple Pay with Square for merchants using their platform.

To learn more about Apple Pay on Web see the Apple Pay section in the
[Embedding the Square Payment Form](/payment-form/add-digital-wallets/apple-pay) guide.

```ruby
def register_domain(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Register Domain Request Hash`](#register-domain-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Register Domain Response Hash`](#register-domain-response)

##### Example Usage

```ruby
body = {}
body[:domain_name] = 'domain_name0'

result = apple_pay_api.register_domain(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Catalog

#### Overview

##### Get instance

An instance of the `CatalogApi` class can be accessed from the API Client.

```
catalog_api = client.catalog
```

#### Batch Delete Catalog Objects

Deletes a set of [CatalogItem](#type-catalogitem)s based on the
provided list of target IDs and returns a set of successfully deleted IDs in
the response. Deletion is a cascading event such that all children of the
targeted object are also deleted. For example, deleting a CatalogItem will
also delete all of its [CatalogItemVariation](#type-catalogitemvariation)
children.

`BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted
IDs can be deleted. The response will only include IDs that were
actually deleted.

```ruby
def batch_delete_catalog_objects(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Delete Catalog Objects Request Hash`](#batch-delete-catalog-objects-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Delete Catalog Objects Response Hash`](#batch-delete-catalog-objects-response)

##### Example Usage

```ruby
body = {}

result = catalog_api.batch_delete_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Batch Retrieve Catalog Objects

Returns a set of objects based on the provided ID.
Each [CatalogItem](#type-catalogitem) returned in the set includes all of its
child information including: all of its
[CatalogItemVariation](#type-catalogitemvariation) objects, references to
its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of
any [CatalogTax](#type-catalogtax) objects that apply to it.

```ruby
def batch_retrieve_catalog_objects(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Retrieve Catalog Objects Request Hash`](#batch-retrieve-catalog-objects-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Retrieve Catalog Objects Response Hash`](#batch-retrieve-catalog-objects-response)

##### Example Usage

```ruby
body = {}
body[:object_ids] = ['object_ids0', 'object_ids1', 'object_ids2']

result = catalog_api.batch_retrieve_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Batch Upsert Catalog Objects

Creates or updates up to 10,000 target objects based on the provided
list of objects. The target objects are grouped into batches and each batch is
inserted/updated in an all-or-nothing manner. If an object within a batch is
malformed in some way, or violates a database constraint, the entire batch
containing that item will be disregarded. However, other batches in the same
request may still succeed. Each batch may contain up to 1,000 objects, and
batches will be processed in order as long as the total object count for the
request (items, variations, modifier lists, discounts, and taxes) is no more
than 10,000.

```ruby
def batch_upsert_catalog_objects(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Upsert Catalog Objects Request Hash`](#batch-upsert-catalog-objects-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Upsert Catalog Objects Response Hash`](#batch-upsert-catalog-objects-response)

##### Example Usage

```ruby
body = {}
body[:idempotency_key] = 'idempotency_key2'

result = catalog_api.batch_upsert_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Catalog Info

Returns information about the Square Catalog API, such as batch size
limits for `BatchUpsertCatalogObjects`.

```ruby
def catalog_info
```

##### Response Type

[`Catalog Info Response Hash`](#catalog-info-response)

##### Example Usage

```ruby
result = catalog_api.catalog_info()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Catalog

Returns a list of [CatalogObject](#type-catalogobject)s that includes
all objects of a set of desired types (for example, all [CatalogItem](#type-catalogitem)
and [CatalogTax](#type-catalogtax) objects) in the catalog. The `types` parameter
is specified as a comma-separated list of valid [CatalogObject](#type-catalogobject) types:
`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`.

__Important:__ ListCatalog does not return deleted catalog items. To retrieve
deleted catalog items, use SearchCatalogObjects and set `include_deleted_objects`
to `true`.

```ruby
def list_catalog(cursor: nil,
                 types: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | The pagination cursor returned in the previous response. Leave unset for an initial request.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `types` | `String` | Query, Optional | An optional case-insensitive, comma-separated list of object types to retrieve, for example<br>`ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.<br><br>The legal values are taken from the [CatalogObjectType](#type-catalogobjecttype)<br>enumeration, namely `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,<br>`MODIFIER`, `MODIFIER_LIST`, or `IMAGE`. |

##### Response Type

[`List Catalog Response Hash`](#list-catalog-response)

##### Example Usage

```ruby

result = catalog_api.list_catalog()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Upsert Catalog Object

Creates or updates the target [CatalogObject](#type-catalogobject).

```ruby
def upsert_catalog_object(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Upsert Catalog Object Request Hash`](#upsert-catalog-object-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Upsert Catalog Object Response Hash`](#upsert-catalog-object-response)

##### Example Usage

```ruby
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:object] = {}
body[:object][:type] = 'PRODUCT_SET'
body[:object][:id] = 'id6'

result = catalog_api.upsert_catalog_object(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Catalog Object

Deletes a single [CatalogObject](#type-catalogobject) based on the
provided ID and returns the set of successfully deleted IDs in the response.
Deletion is a cascading event such that all children of the targeted object
are also deleted. For example, deleting a [CatalogItem](#type-catalogitem)
will also delete all of its
[CatalogItemVariation](#type-catalogitemvariation) children.

```ruby
def delete_catalog_object(object_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `object_id` | `String` | Template, Required | The ID of the [CatalogObject](#type-catalogobject) to be deleted. When an object is deleted, other<br>objects in the graph that depend on that object will be deleted as well (for example, deleting a<br>[CatalogItem](#type-catalogitem) will delete its [CatalogItemVariation](#type-catalogitemvariation)s). |

##### Response Type

[`Delete Catalog Object Response Hash`](#delete-catalog-object-response)

##### Example Usage

```ruby
object_id = 'object_id8'

result = catalog_api.delete_catalog_object(object_id: object_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Catalog Object

Returns a single [CatalogItem](#type-catalogitem) as a
[CatalogObject](#type-catalogobject) based on the provided ID. The returned
object includes all of the relevant [CatalogItem](#type-catalogitem)
information including: [CatalogItemVariation](#type-catalogitemvariation)
children, references to its
[CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of
any [CatalogTax](#type-catalogtax) objects that apply to it.

```ruby
def retrieve_catalog_object(object_id:,
                            include_related_objects: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `object_id` | `String` | Template, Required | The object ID of any type of [CatalogObject](#type-catalogobject)s to be retrieved. |
| `include_related_objects` | `Boolean` | Query, Optional | If `true`, the response will include additional objects that are related to the<br>requested object, as follows:<br><br>If the `object` field of the response contains a [CatalogItem](#type-catalogitem),<br>its associated [CatalogCategory](#type-catalogcategory), [CatalogTax](#type-catalogtax)es,<br>[CatalogImage](#type-catalogimage)s and [CatalogModifierList](#type-catalogmodifierlist)s<br>will be returned in the `related_objects` field of the response. If the `object`<br>field of the response contains a [CatalogItemVariation](#type-catalogitemvariation),<br>its parent [CatalogItem](#type-catalogitem) will be returned in the `related_objects` field of <br>the response.<br><br>Default value: `false` |

##### Response Type

[`Retrieve Catalog Object Response Hash`](#retrieve-catalog-object-response)

##### Example Usage

```ruby
object_id = 'object_id8'

result = catalog_api.retrieve_catalog_object(object_id: object_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Search Catalog Objects

Queries the targeted catalog using a variety of query types:
[CatalogQuerySortedAttribute](#type-catalogquerysortedattribute),
[CatalogQueryExact](#type-catalogqueryexact),
[CatalogQueryRange](#type-catalogqueryrange),
[CatalogQueryText](#type-catalogquerytext),
[CatalogQueryItemsForTax](#type-catalogqueryitemsfortax), and
[CatalogQueryItemsForModifierList](#type-catalogqueryitemsformodifierlist).

```ruby
def search_catalog_objects(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Catalog Objects Request Hash`](#search-catalog-objects-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Search Catalog Objects Response Hash`](#search-catalog-objects-response)

##### Example Usage

```ruby
body = {}

result = catalog_api.search_catalog_objects(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Item Modifier Lists

Updates the [CatalogModifierList](#type-catalogmodifierlist) objects
that apply to the targeted [CatalogItem](#type-catalogitem) without having
to perform an upsert on the entire item.

```ruby
def update_item_modifier_lists(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Update Item Modifier Lists Request Hash`](#update-item-modifier-lists-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Update Item Modifier Lists Response Hash`](#update-item-modifier-lists-response)

##### Example Usage

```ruby
body = {}
body[:item_ids] = ['item_ids2', 'item_ids1', 'item_ids0']

result = catalog_api.update_item_modifier_lists(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Item Taxes

Updates the [CatalogTax](#type-catalogtax) objects that apply to the
targeted [CatalogItem](#type-catalogitem) without having to perform an
upsert on the entire item.

```ruby
def update_item_taxes(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Update Item Taxes Request Hash`](#update-item-taxes-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Update Item Taxes Response Hash`](#update-item-taxes-response)

##### Example Usage

```ruby
body = {}
body[:item_ids] = ['item_ids2', 'item_ids1', 'item_ids0']

result = catalog_api.update_item_taxes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Customers

#### Overview

##### Get instance

An instance of the `CustomersApi` class can be accessed from the API Client.

```
customers_api = client.customers
```

#### List Customers

Lists a business's customers.

```ruby
def list_customers(cursor: nil,
                   sort_field: nil,
                   sort_order: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |
| `sort_field` | [`String (Customer Sort Field)`](#customer-sort-field) | Query, Optional | Indicates how Customers should be sorted. Default: `DEFAULT`. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Query, Optional | Indicates whether Customers should be sorted in ascending (`ASC`) or<br>descending (`DESC`) order. Default: `ASC`. |

##### Response Type

[`List Customers Response Hash`](#list-customers-response)

##### Example Usage

```ruby

result = customers_api.list_customers()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Customer

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

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Customer Request Hash`](#create-customer-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Customer Response Hash`](#create-customer-response)

##### Example Usage

```ruby
body = {}

result = customers_api.create_customer(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Search Customers

Searches the customer profiles associated with a Square account.
Calling SearchCustomers without an explicit query parameter returns all
customer profiles ordered alphabetically based on `given_name` and
`family_name`.

```ruby
def search_customers(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Customers Request Hash`](#search-customers-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Search Customers Response Hash`](#search-customers-response)

##### Example Usage

```ruby
body = {}

result = customers_api.search_customers(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Customer

Deletes a customer from a business, along with any linked cards on file. When two profiles
are merged into a single profile, that profile is assigned a new `customer_id`. You must use the
new `customer_id` to delete merged profiles.

```ruby
def delete_customer(customer_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to delete. |

##### Response Type

[`Delete Customer Response Hash`](#delete-customer-response)

##### Example Usage

```ruby
customer_id = 'customer_id8'

result = customers_api.delete_customer(customer_id: customer_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Customer

Returns details for a single customer.

```ruby
def retrieve_customer(customer_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to retrieve. |

##### Response Type

[`Retrieve Customer Response Hash`](#retrieve-customer-response)

##### Example Usage

```ruby
customer_id = 'customer_id8'

result = customers_api.retrieve_customer(customer_id: customer_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Customer

Updates the details of an existing customer. When two profiles are merged
into a single profile, that profile is assigned a new `customer_id`. You must use
the new `customer_id` to update merged profiles.

You cannot edit a customer's cards on file with this endpoint. To make changes
to a card on file, you must delete the existing card on file with the
[DeleteCustomerCard](#endpoint-customers-deletecustomercard) endpoint, then
create a new one with the
[CreateCustomerCard](#endpoint-customers-createcustomercard) endpoint.

```ruby
def update_customer(customer_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to update. |
| `body` | [`Update Customer Request Hash`](#update-customer-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Update Customer Response Hash`](#update-customer-response)

##### Example Usage

```ruby
customer_id = 'customer_id8'
body = {}

result = customers_api.update_customer(customer_id: customer_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Customer Card

Adds a card on file to an existing customer.

As with charges, calls to `CreateCustomerCard` are idempotent. Multiple
calls with the same card nonce return the same card record that was created
with the provided nonce during the _first_ call.

Cards on file are automatically updated on a monthly basis to confirm they
are still valid and can be charged.

```ruby
def create_customer_card(customer_id:,
                         body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer to link the card on file to. |
| `body` | [`Create Customer Card Request Hash`](#create-customer-card-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Customer Card Response Hash`](#create-customer-card-response)

##### Example Usage

```ruby
customer_id = 'customer_id8'
body = {}
body[:card_nonce] = 'card_nonce6'

result = customers_api.create_customer_card(customer_id: customer_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Customer Card

Removes a card on file from a customer.

```ruby
def delete_customer_card(customer_id:,
                         card_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Template, Required | The ID of the customer that the card on file belongs to. |
| `card_id` | `String` | Template, Required | The ID of the card on file to delete. |

##### Response Type

[`Delete Customer Card Response Hash`](#delete-customer-card-response)

##### Example Usage

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

### Employees

#### Overview

##### Get instance

An instance of the `EmployeesApi` class can be accessed from the API Client.

```
employees_api = client.employees
```

#### List Employees

Gets a list of `Employee` objects for a business.

```ruby
def list_employees(location_id: nil,
                   status: nil,
                   limit: nil,
                   cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Query, Optional | Filter employees returned to only those that are associated with the<br>specified location. |
| `status` | [`String (Employee Status)`](#employee-status) | Query, Optional | Specifies the EmployeeStatus to filter the employee by. |
| `limit` | `Integer` | Query, Optional | The number of employees to be returned on each page. |
| `cursor` | `String` | Query, Optional | The token required to retrieve the specified page of results. |

##### Response Type

[`List Employees Response Hash`](#list-employees-response)

##### Example Usage

```ruby

result = employees_api.list_employees()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Employee

Gets an `Employee` by Square-assigned employee `ID` (UUID)

```ruby
def retrieve_employee(id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the employee that was requested. |

##### Response Type

[`Retrieve Employee Response Hash`](#retrieve-employee-response)

##### Example Usage

```ruby
id = 'id0'

result = employees_api.retrieve_employee(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Inventory

#### Overview

##### Get instance

An instance of the `InventoryApi` class can be accessed from the API Client.

```
inventory_api = client.inventory
```

#### Retrieve Inventory Adjustment

Returns the [InventoryAdjustment](#type-inventoryadjustment) object
with the provided `adjustment_id`.

```ruby
def retrieve_inventory_adjustment(adjustment_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `adjustment_id` | `String` | Template, Required | ID of the [InventoryAdjustment](#type-inventoryadjustment) to retrieve. |

##### Response Type

[`Retrieve Inventory Adjustment Response Hash`](#retrieve-inventory-adjustment-response)

##### Example Usage

```ruby
adjustment_id = 'adjustment_id0'

result = inventory_api.retrieve_inventory_adjustment(adjustment_id: adjustment_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Batch Change Inventory

Applies adjustments and counts to the provided item quantities.

On success: returns the current calculated counts for all objects
referenced in the request.
On failure: returns a list of related errors.

```ruby
def batch_change_inventory(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Change Inventory Request Hash`](#batch-change-inventory-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Change Inventory Response Hash`](#batch-change-inventory-response)

##### Example Usage

```ruby
body = {}

result = inventory_api.batch_change_inventory(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Batch Retrieve Inventory Changes

Returns historical physical counts and adjustments based on the
provided filter criteria.

Results are paginated and sorted in ascending order according their
`occurred_at` timestamp (oldest first).

BatchRetrieveInventoryChanges is a catch-all query endpoint for queries
that cannot be handled by other, simpler endpoints.

```ruby
def batch_retrieve_inventory_changes(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Retrieve Inventory Changes Request Hash`](#batch-retrieve-inventory-changes-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Retrieve Inventory Changes Response Hash`](#batch-retrieve-inventory-changes-response)

##### Example Usage

```ruby
body = {}

result = inventory_api.batch_retrieve_inventory_changes(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Batch Retrieve Inventory Counts

Returns current counts for the provided
[CatalogObject](#type-catalogobject)s at the requested
[Location](#type-location)s.

Results are paginated and sorted in descending order according to their
`calculated_at` timestamp (newest first).

When `updated_after` is specified, only counts that have changed since that
time (based on the server timestamp for the most recent change) are
returned. This allows clients to perform a "sync" operation, for example
in response to receiving a Webhook notification.

```ruby
def batch_retrieve_inventory_counts(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Batch Retrieve Inventory Counts Request Hash`](#batch-retrieve-inventory-counts-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Retrieve Inventory Counts Response Hash`](#batch-retrieve-inventory-counts-response)

##### Example Usage

```ruby
body = {}

result = inventory_api.batch_retrieve_inventory_counts(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Inventory Physical Count

Returns the [InventoryPhysicalCount](#type-inventoryphysicalcount)
object with the provided `physical_count_id`.

```ruby
def retrieve_inventory_physical_count(physical_count_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `physical_count_id` | `String` | Template, Required | ID of the<br>[InventoryPhysicalCount](#type-inventoryphysicalcount) to retrieve. |

##### Response Type

[`Retrieve Inventory Physical Count Response Hash`](#retrieve-inventory-physical-count-response)

##### Example Usage

```ruby
physical_count_id = 'physical_count_id2'

result = inventory_api.retrieve_inventory_physical_count(physical_count_id: physical_count_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Inventory Count

Retrieves the current calculated stock count for a given
[CatalogObject](#type-catalogobject) at a given set of
[Location](#type-location)s. Responses are paginated and unsorted.
For more sophisticated queries, use a batch endpoint.

```ruby
def retrieve_inventory_count(catalog_object_id:,
                             location_ids: nil,
                             cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_id` | `String` | Template, Required | ID of the [CatalogObject](#type-catalogobject) to retrieve. |
| `location_ids` | `String` | Query, Optional | The [Location](#type-location) IDs to look up as a comma-separated<br>list. An empty list queries all locations. |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Response Type

[`Retrieve Inventory Count Response Hash`](#retrieve-inventory-count-response)

##### Example Usage

```ruby
catalog_object_id = 'catalog_object_id6'

result = inventory_api.retrieve_inventory_count(catalog_object_id: catalog_object_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Inventory Changes

Returns a set of physical counts and inventory adjustments for the
provided [CatalogObject](#type-catalogobject) at the requested
[Location](#type-location)s.

Results are paginated and sorted in descending order according to their
`occurred_at` timestamp (newest first).

There are no limits on how far back the caller can page. This endpoint is
useful when displaying recent changes for a specific item. For more
sophisticated queries, use a batch endpoint.

```ruby
def retrieve_inventory_changes(catalog_object_id:,
                               location_ids: nil,
                               cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_id` | `String` | Template, Required | ID of the [CatalogObject](#type-catalogobject) to retrieve. |
| `location_ids` | `String` | Query, Optional | The [Location](#type-location) IDs to look up as a comma-separated<br>list. An empty list queries all locations. |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Response Type

[`Retrieve Inventory Changes Response Hash`](#retrieve-inventory-changes-response)

##### Example Usage

```ruby
catalog_object_id = 'catalog_object_id6'

result = inventory_api.retrieve_inventory_changes(catalog_object_id: catalog_object_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Labor

#### Overview

##### Get instance

An instance of the `LaborApi` class can be accessed from the API Client.

```
labor_api = client.labor
```

#### List Break Types

Returns a paginated list of `BreakType` instances for a business.

```ruby
def list_break_types(location_id: nil,
                     limit: nil,
                     cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Query, Optional | Filter Break Types returned to only those that are associated with the<br>specified location. |
| `limit` | `Integer` | Query, Optional | Maximum number of Break Types to return per page. Can range between 1<br>and 200. The default is the maximum at 200. |
| `cursor` | `String` | Query, Optional | Pointer to the next page of Break Type results to fetch. |

##### Response Type

[`List Break Types Response Hash`](#list-break-types-response)

##### Example Usage

```ruby

result = labor_api.list_break_types()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Break Type

Creates a new `BreakType`. 

A `BreakType` is a template for creating `Break` objects. 
You must provide the following values in your request to this
endpoint:

- `location_id`
- `break_name`
- `expected_duration`
- `is_paid`

You can only have 3 `BreakType` instances per location. If you attempt to add a 4th
`BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3 breaks per location."
is returned.

```ruby
def create_break_type(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Break Type Request Hash`](#create-break-type-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Break Type Response Hash`](#create-break-type-response)

##### Example Usage

```ruby
body = {}
body[:break_type] = {}
body[:break_type][:location_id] = 'location_id6'
body[:break_type][:break_name] = 'break_name6'
body[:break_type][:expected_duration] = 'expected_duration2'
body[:break_type][:is_paid] = false

result = labor_api.create_break_type(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Break Type

Deletes an existing `BreakType`. 

A `BreakType` can be deleted even if it is referenced from a `Shift`.

```ruby
def delete_break_type(id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `BreakType` being deleted. |

##### Response Type

[`Delete Break Type Response Hash`](#delete-break-type-response)

##### Example Usage

```ruby
id = 'id0'

result = labor_api.delete_break_type(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Get Break Type

Returns a single `BreakType` specified by id.

```ruby
def get_break_type(id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `BreakType` being retrieved. |

##### Response Type

[`Get Break Type Response Hash`](#get-break-type-response)

##### Example Usage

```ruby
id = 'id0'

result = labor_api.get_break_type(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Break Type

Updates an existing `BreakType`.

```ruby
def update_break_type(id:,
                      body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `BreakType` being updated. |
| `body` | [`Update Break Type Request Hash`](#update-break-type-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Update Break Type Response Hash`](#update-break-type-response)

##### Example Usage

```ruby
id = 'id0'
body = {}

result = labor_api.update_break_type(id: id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Employee Wages

Returns a paginated list of `EmployeeWage` instances for a business.

```ruby
def list_employee_wages(employee_id: nil,
                        limit: nil,
                        cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Query, Optional | Filter wages returned to only those that are associated with the<br>specified employee. |
| `limit` | `Integer` | Query, Optional | Maximum number of Employee Wages to return per page. Can range between<br>1 and 200. The default is the maximum at 200. |
| `cursor` | `String` | Query, Optional | Pointer to the next page of Employee Wage results to fetch. |

##### Response Type

[`List Employee Wages Response Hash`](#list-employee-wages-response)

##### Example Usage

```ruby

result = labor_api.list_employee_wages()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Get Employee Wage

Returns a single `EmployeeWage` specified by id.

```ruby
def get_employee_wage(id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `EmployeeWage` being retrieved. |

##### Response Type

[`Get Employee Wage Response Hash`](#get-employee-wage-response)

##### Example Usage

```ruby
id = 'id0'

result = labor_api.get_employee_wage(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Shift

Creates a new `Shift`. 

A `Shift` represents a complete work day for a single employee. 
You must provide the following values in your request to this
endpoint:

- `location_id`
- `employee_id`
- `start_at`

An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when:
- The `status` of the new `Shift` is `OPEN` and the employee has another 
shift with an `OPEN` status. 
- The `start_at` date is in the future
- the `start_at` or `end_at` overlaps another shift for the same employee
- If `Break`s are set in the request, a break `start_at`
must not be before the `Shift.start_at`. A break `end_at` must not be after
the `Shift.end_at`

```ruby
def create_shift(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Shift Request Hash`](#create-shift-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Shift Response Hash`](#create-shift-response)

##### Example Usage

```ruby
body = {}
body[:shift] = {}
body[:shift][:employee_id] = 'employee_id2'
body[:shift][:start_at] = 'start_at0'

result = labor_api.create_shift(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Search Shifts

Returns a paginated list of `Shift` records for a business. 
The list to be returned can be filtered by:
- Location IDs **and**
- employee IDs **and**
- shift status (`OPEN`, `CLOSED`) **and**
- shift start **and**
- shift end **and**
- work day details

The list can be sorted by:
- `start_at`
- `end_at`
- `created_at`
- `updated_at`

```ruby
def search_shifts(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Shifts Request Hash`](#search-shifts-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Search Shifts Response Hash`](#search-shifts-response)

##### Example Usage

```ruby
body = {}

result = labor_api.search_shifts(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Delete Shift

Deletes a `Shift`.

```ruby
def delete_shift(id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `Shift` being deleted. |

##### Response Type

[`Delete Shift Response Hash`](#delete-shift-response)

##### Example Usage

```ruby
id = 'id0'

result = labor_api.delete_shift(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Get Shift

Returns a single `Shift` specified by id.

```ruby
def get_shift(id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `Shift` being retrieved. |

##### Response Type

[`Get Shift Response Hash`](#get-shift-response)

##### Example Usage

```ruby
id = 'id0'

result = labor_api.get_shift(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Shift

Updates an existing `Shift`. 

When adding a `Break` to a `Shift`, any earlier `Breaks` in the `Shift` have 
the `end_at` property set to a valid RFC-3339 datetime string. 

When closing a `Shift`, all `Break` instances in the shift must be complete with `end_at`
set on each `Break`.

```ruby
def update_shift(id:,
                 body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | ID of the object being updated. |
| `body` | [`Update Shift Request Hash`](#update-shift-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Update Shift Response Hash`](#update-shift-response)

##### Example Usage

```ruby
id = 'id0'
body = {}
body[:shift] = {}
body[:shift][:employee_id] = 'employee_id2'
body[:shift][:start_at] = 'start_at0'

result = labor_api.update_shift(id: id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Workweek Configs

Returns a list of `WorkweekConfig` instances for a business.

```ruby
def list_workweek_configs(limit: nil,
                          cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `limit` | `Integer` | Query, Optional | Maximum number of Workweek Configs to return per page. |
| `cursor` | `String` | Query, Optional | Pointer to the next page of Workweek Config results to fetch. |

##### Response Type

[`List Workweek Configs Response Hash`](#list-workweek-configs-response)

##### Example Usage

```ruby

result = labor_api.list_workweek_configs()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Update Workweek Config

Updates a `WorkweekConfig`.

```ruby
def update_workweek_config(id:,
                           body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the `WorkweekConfig` object being updated. |
| `body` | [`Update Workweek Config Request Hash`](#update-workweek-config-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Update Workweek Config Response Hash`](#update-workweek-config-response)

##### Example Usage

```ruby
id = 'id0'
body = {}

result = labor_api.update_workweek_config(id: id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Locations

#### Overview

##### Get instance

An instance of the `LocationsApi` class can be accessed from the API Client.

```
locations_api = client.locations
```

#### List Locations

Provides the details for all of a business's locations.

Most other Connect API endpoints have a required `location_id` path parameter.
The `id` field of the [`Location`](#type-location) objects returned by this
endpoint correspond to that `location_id` parameter.

```ruby
def list_locations
```

##### Response Type

[`List Locations Response Hash`](#list-locations-response)

##### Example Usage

```ruby
result = locations_api.list_locations()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Reporting

#### Overview

##### Get instance

An instance of the `ReportingApi` class can be accessed from the API Client.

```
reporting_api = client.reporting
```

#### List Additional Recipient Receivable Refunds

Returns a list of refunded transactions (across all possible originating locations) relating to monies
credited to the provided location ID by another Square account using the `additional_recipients` field in a transaction.

Max results per [page](#paginatingresults): 50

```ruby
def list_additional_recipient_receivable_refunds(location_id:,
                                                 begin_time: nil,
                                                 end_time: nil,
                                                 sort_order: nil,
                                                 cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list AdditionalRecipientReceivableRefunds for. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which results are listed in the response (`ASC` for<br>oldest first, `DESC` for newest first).<br><br>Default value: `DESC` |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Response Type

[`List Additional Recipient Receivable Refunds Response Hash`](#list-additional-recipient-receivable-refunds-response)

##### Example Usage

```ruby
location_id = 'location_id4'

result = reporting_api.list_additional_recipient_receivable_refunds(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Additional Recipient Receivables

Returns a list of receivables (across all possible sending locations) representing monies credited
to the provided location ID by another Square account using the `additional_recipients` field in a transaction.

Max results per [page](#paginatingresults): 50

```ruby
def list_additional_recipient_receivables(location_id:,
                                          begin_time: nil,
                                          end_time: nil,
                                          sort_order: nil,
                                          cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list AdditionalRecipientReceivables for. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which results are listed in the response (`ASC` for<br>oldest first, `DESC` for newest first).<br><br>Default value: `DESC` |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Response Type

[`List Additional Recipient Receivables Response Hash`](#list-additional-recipient-receivables-response)

##### Example Usage

```ruby
location_id = 'location_id4'

result = reporting_api.list_additional_recipient_receivables(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Checkout

#### Overview

##### Get instance

An instance of the `CheckoutApi` class can be accessed from the API Client.

```
checkout_api = client.checkout
```

#### Create Checkout

Links a `checkoutId` to a `checkout_page_url` that customers will
be directed to in order to provide their payment information using a
payment processing workflow hosted on connect.squareup.com.

```ruby
def create_checkout(location_id:,
                    body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the business location to associate the checkout with. |
| `body` | [`Create Checkout Request Hash`](#create-checkout-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Checkout Response Hash`](#create-checkout-response)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:order] = {}

result = checkout_api.create_checkout(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Orders

#### Overview

##### Get instance

An instance of the `OrdersApi` class can be accessed from the API Client.

```
orders_api = client.orders
```

#### Create Order

Creates an [Order](#type-order) that can then be referenced as `order_id` in a
request to the [Charge](#endpoint-charge) endpoint. Orders specify products for
purchase, along with discounts, taxes, and other settings to apply to the purchase.

To associate a created order with a request to the Charge endpoint, provide the
order's `id` in the `order_id` field of your request.

You cannot modify an order after you create it. If you need to modify an order,
instead create a new order with modified details.

To learn more about the Orders API, see the
[Orders API Overview](/products/orders/overview).

```ruby
def create_order(location_id:,
                 body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the business location to associate the order with. |
| `body` | [`Create Order Request Hash`](#create-order-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Order Response Hash`](#create-order-response)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}

result = orders_api.create_order(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Batch Retrieve Orders

Retrieves a set of [Order](#type-order)s by their IDs.

If a given Order ID does not exist, the ID is ignored instead of generating an error.

```ruby
def batch_retrieve_orders(location_id:,
                          body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the orders' associated location. |
| `body` | [`Batch Retrieve Orders Request Hash`](#batch-retrieve-orders-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Batch Retrieve Orders Response Hash`](#batch-retrieve-orders-response)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}
body[:order_ids] = ['order_ids1']

result = orders_api.batch_retrieve_orders(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Search Orders

Search all Orders for a merchant and return either [Orders](#type-order) or
[OrderEntries](#type-orderentry).

Note that details for orders processed with Square Point of Sale while in offline mode may not be
transmitted to Square for up to 72 hours. Offline orders have a `created_at` value that reflects
the time the order was originally processed, not the time it was subsequently transmitted to
Square. Consequently, the SearchOrder endpoint might list an offline Order chronologically
between online Orders that were seen in a previous request.

When fetching additional pages using a `cursor`, the `query` must be equal
to the `query` used to fetch the first page of results.

```ruby
def search_orders(body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Orders Request Hash`](#search-orders-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Search Orders Response Hash`](#search-orders-response)

##### Example Usage

```ruby
body = {}

result = orders_api.search_orders(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

### Transactions

#### Overview

##### Get instance

An instance of the `TransactionsApi` class can be accessed from the API Client.

```
transactions_api = client.transactions
```

#### List Refunds

Lists refunds for one of a business's locations.

In addition to full or partial tender refunds processed through Square APIs,
refunds may result from itemized returns or exchanges through Square's
Point of Sale applications.

Refunds with a `status` of `PENDING` are not currently included in this
endpoint's response.

Max results per [page](#paginatingresults): 50

```ruby
def list_refunds(location_id:,
                 begin_time: nil,
                 end_time: nil,
                 sort_order: nil,
                 cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list refunds for. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which results are listed in the response (`ASC` for<br>oldest first, `DESC` for newest first).<br><br>Default value: `DESC` |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Response Type

[`List Refunds Response Hash`](#list-refunds-response)

##### Example Usage

```ruby
location_id = 'location_id4'

result = transactions_api.list_refunds(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### List Transactions

Lists transactions for a particular location.

Transactions include payment information from sales and exchanges and refund
information from returns and exchanges.

Max results per [page](#paginatingresults): 50

```ruby
def list_transactions(location_id:,
                      begin_time: nil,
                      end_time: nil,
                      sort_order: nil,
                      cursor: nil)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list transactions for. |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Query, Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Query, Optional | The order in which results are listed in the response (`ASC` for<br>oldest first, `DESC` for newest first).<br><br>Default value: `DESC` |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Response Type

[`List Transactions Response Hash`](#list-transactions-response)

##### Example Usage

```ruby
location_id = 'location_id4'

result = transactions_api.list_transactions(location_id: location_id, )

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Charge

Charges a card represented by a card nonce or a customer's card on file.

Your request to this endpoint must include _either_:

- A value for the `card_nonce` parameter (to charge a card nonce generated
with the `SqPaymentForm`)
- Values for the `customer_card_id` and `customer_id` parameters (to charge
a customer's card on file)

When this response is returned, the amount of Square's processing fee might not yet be
calculated. To obtain the processing fee, wait about ten seconds and call
[RetrieveTransaction](#endpoint-transactions-retrievetransaction). See the `processing_fee_money`
field of each [Tender included](#type-tender) in the transaction.

```ruby
def charge(location_id:,
           body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to associate the created transaction with. |
| `body` | [`Charge Request Hash`](#charge-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Charge Response Hash`](#charge-response)

##### Example Usage

```ruby
location_id = 'location_id4'
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:amount_money] = {}

result = transactions_api.charge(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Retrieve Transaction

Retrieves details for a single transaction.

```ruby
def retrieve_transaction(location_id:,
                         transaction_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the transaction's associated location. |
| `transaction_id` | `String` | Template, Required | The ID of the transaction to retrieve. |

##### Response Type

[`Retrieve Transaction Response Hash`](#retrieve-transaction-response)

##### Example Usage

```ruby
location_id = 'location_id4'
transaction_id = 'transaction_id8'

result = transactions_api.retrieve_transaction(location_id: location_id, transaction_id: transaction_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Capture Transaction

Captures a transaction that was created with the [Charge](#endpoint-transactions-charge)
endpoint with a `delay_capture` value of `true`.

See [Delayed capture transactions](/payments/transactions/overview#delayed-capture)
for more information.

```ruby
def capture_transaction(location_id:,
                        transaction_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | - |
| `transaction_id` | `String` | Template, Required | - |

##### Response Type

[`Capture Transaction Response Hash`](#capture-transaction-response)

##### Example Usage

```ruby
location_id = 'location_id4'
transaction_id = 'transaction_id8'

result = transactions_api.capture_transaction(location_id: location_id, transaction_id: transaction_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Create Refund

Initiates a refund for a previously charged tender.

You must issue a refund within 120 days of the associated payment. See
[this article](https://squareup.com/help/us/en/article/5060) for more information
on refund behavior.

NOTE: Card-present transactions with Interac credit cards **cannot be
refunded using the Connect API**. Interac transactions must refunded
in-person (e.g., dipping the card using POS app).

```ruby
def create_refund(location_id:,
                  transaction_id:,
                  body:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the original transaction's associated location. |
| `transaction_id` | `String` | Template, Required | The ID of the original transaction that includes the tender to refund. |
| `body` | [`Create Refund Request Hash`](#create-refund-request) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

##### Response Type

[`Create Refund Response Hash`](#create-refund-response)

##### Example Usage

```ruby
location_id = 'location_id4'
transaction_id = 'transaction_id8'
body = {}
body[:idempotency_key] = 'idempotency_key2'
body[:tender_id] = 'tender_id4'
body[:amount_money] = {}

result = transactions_api.create_refund(location_id: location_id, transaction_id: transaction_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

#### Void Transaction

Cancels a transaction that was created with the [Charge](#endpoint-transactions-charge)
endpoint with a `delay_capture` value of `true`.

See [Delayed capture transactions](/payments/transactions/overview#delayed-capture)
for more information.

```ruby
def void_transaction(location_id:,
                     transaction_id:)
```

##### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | - |
| `transaction_id` | `String` | Template, Required | - |

##### Response Type

[`Void Transaction Response Hash`](#void-transaction-response)

##### Example Usage

```ruby
location_id = 'location_id4'
transaction_id = 'transaction_id8'

result = transactions_api.void_transaction(location_id: location_id, transaction_id: transaction_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Model Reference

### Enumerations

* [Aggregation Strategy](#aggregation-strategy)
* [Card Brand](#card-brand)
* [Catalog Discount Type](#catalog-discount-type)
* [Catalog Item Product Type](#catalog-item-product-type)
* [Catalog Modifier List Selection Type](#catalog-modifier-list-selection-type)
* [Catalog Object Type](#catalog-object-type)
* [Catalog Pricing Type](#catalog-pricing-type)
* [Country](#country)
* [Currency](#currency)
* [Customer Creation Source](#customer-creation-source)
* [Customer Inclusion Exclusion](#customer-inclusion-exclusion)
* [Customer Sort Field](#customer-sort-field)
* [Day of Week](#day-of-week)
* [Employee Status](#employee-status)
* [Error Category](#error-category)
* [Error Code](#error-code)
* [Inventory Alert Type](#inventory-alert-type)
* [Inventory Change Type](#inventory-change-type)
* [Inventory State](#inventory-state)
* [Location Capability](#location-capability)
* [Location Status](#location-status)
* [Location Type](#location-type)
* [Measurement Unit Area](#measurement-unit-area)
* [Measurement Unit Generic](#measurement-unit-generic)
* [Measurement Unit Length](#measurement-unit-length)
* [Measurement Unit Volume](#measurement-unit-volume)
* [Measurement Unit Weight](#measurement-unit-weight)
* [Order Fulfillment Pickup Details Schedule Type](#order-fulfillment-pickup-details-schedule-type)
* [Order Fulfillment State](#order-fulfillment-state)
* [Order Fulfillment Type](#order-fulfillment-type)
* [Order Line Item Discount Scope](#order-line-item-discount-scope)
* [Order Line Item Discount Type](#order-line-item-discount-type)
* [Order Line Item Tax Scope](#order-line-item-tax-scope)
* [Order Line Item Tax Type](#order-line-item-tax-type)
* [Order Service Charge Calculation Phase](#order-service-charge-calculation-phase)
* [Order State](#order-state)
* [Product](#product)
* [Refund Status](#refund-status)
* [Register Domain Response Status](#register-domain-response-status)
* [Search Orders Sort Field](#search-orders-sort-field)
* [Shift Filter Status](#shift-filter-status)
* [Shift Sort Field](#shift-sort-field)
* [Shift Status](#shift-status)
* [Shift Workday Matcher](#shift-workday-matcher)
* [Sort Order](#sort-order)
* [Tax Calculation Phase](#tax-calculation-phase)
* [Tax Inclusion Type](#tax-inclusion-type)
* [Tender Card Details Entry Method](#tender-card-details-entry-method)
* [Tender Card Details Status](#tender-card-details-status)
* [Tender Type](#tender-type)
* [Transaction Product](#transaction-product)
* [V1 Adjust Inventory Request Adjustment Type](#v1-adjust-inventory-request-adjustment-type)
* [V1 Bank Account Type](#v1-bank-account-type)
* [V1 Cash Drawer Event Event Type](#v1-cash-drawer-event-event-type)
* [V1 Cash Drawer Shift Event Type](#v1-cash-drawer-shift-event-type)
* [V1 Create Refund Request Type](#v1-create-refund-request-type)
* [V1 Discount Color](#v1-discount-color)
* [V1 Discount Discount Type](#v1-discount-discount-type)
* [V1 Employee Role Permissions](#v1-employee-role-permissions)
* [V1 Employee Status](#v1-employee-status)
* [V1 Fee Adjustment Type](#v1-fee-adjustment-type)
* [V1 Fee Calculation Phase](#v1-fee-calculation-phase)
* [V1 Fee Inclusion Type](#v1-fee-inclusion-type)
* [V1 Fee Type](#v1-fee-type)
* [V1 Item Type](#v1-item-type)
* [V1 Item Visibility](#v1-item-visibility)
* [V1 List Settlements Request Status](#v1-list-settlements-request-status)
* [V1 Merchant Account Type](#v1-merchant-account-type)
* [V1 Merchant Business Type](#v1-merchant-business-type)
* [V1 Modifier List Selection Type](#v1-modifier-list-selection-type)
* [V1 Order History Entry Action](#v1-order-history-entry-action)
* [V1 Order State](#v1-order-state)
* [V1 Page Cell Object Type](#v1-page-cell-object-type)
* [V1 Page Cell Placeholder Type](#v1-page-cell-placeholder-type)
* [V1 Payment Itemization Itemization Type](#v1-payment-itemization-itemization-type)
* [V1 Payment Surcharge Type](#v1-payment-surcharge-type)
* [V1 Settlement Entry Type](#v1-settlement-entry-type)
* [V1 Tender Card Brand](#v1-tender-card-brand)
* [V1 Tender Entry Method](#v1-tender-entry-method)
* [V1 Tender Type](#v1-tender-type)
* [V1 Timecard Event Event Type](#v1-timecard-event-event-type)
* [V1 Update Order Request Action](#v1-update-order-request-action)
* [V1 Variation Inventory Alert Type](#v1-variation-inventory-alert-type)
* [V1 Variation Pricing Type](#v1-variation-pricing-type)
* [Webhook Events](#webhook-events)
* [Weekday](#weekday)

#### Aggregation Strategy

Indicates how a [CatalogPricingRule](#type-catalogpricingrule) can be
combined with other rules.

##### Fields

| Name | Description |
|  --- | --- |
| `UNKNOWN` | The pricing rule has an aggregation strategy that can not be represented with the current version of the API. |
| `BASE` | Can be stacked by any discount-based prices, including those with an<br>AggregationStrategy of `EXCLUSIVE`. Only valid for pricing rules that set<br>`total_price` or `item_price`. |
| `STACKABLE` | Can be combined with other pricing rules. Allow multiple discounts on<br>the same product. |
| `EXCLUSIVE` | Can only be combined with pricing rules with an AggregationStrategy of `BASE`. |

#### Card Brand

Indicates a card's brand, such as `VISA` or `MASTERCARD`.

##### Fields

| Name | Description |
|  --- | --- |
| `OTHER_BRAND` | - |
| `VISA` | - |
| `MASTERCARD` | - |
| `AMERICAN_EXPRESS` | - |
| `DISCOVER` | - |
| `DISCOVER_DINERS` | - |
| `JCB` | - |
| `CHINA_UNIONPAY` | - |
| `SQUARE_GIFT_CARD` | - |

#### Catalog Discount Type

How to apply a [CatalogDiscount](#type-catalogdiscount) to a [CatalogItem](#type-catalogitem).

##### Fields

| Name | Description |
|  --- | --- |
| `FIXED_PERCENTAGE` | Apply the discount as a fixed percentage (e.g., 5%) off the item price. |
| `FIXED_AMOUNT` | Apply the discount as a fixed amount (e.g., $1.00) off the item price. |
| `VARIABLE_PERCENTAGE` | Apply the discount as a variable percentage off the item price. The percentage will be specified at the time of sale. |
| `VARIABLE_AMOUNT` | Apply the discount as a variable amount off the item price. The amount will be specified at the time of sale. |

#### Catalog Item Product Type

The type of a [CatalogItem](#type-catalogitem). Connect V2 only allows the creation of `REGULAR` items.

##### Fields

| Name | Description |
|  --- | --- |
| `REGULAR` | An ordinary item. |
| `GIFT_CARD` | A Square gift card. |
| `APPOINTMENTS_SERVICE` | A service that can be booked using the Square Appointments app. |
| `RETAIL_ITEM` | An item associated with the Retail vertical. |
| `RESTAURANT_ITEM` | An item associated with the Restaurants vertical. |

#### Catalog Modifier List Selection Type

Indicates whether a [CatalogModifierList](#type-catalogmodifierlist) supports multiple selections.

##### Fields

| Name | Description |
|  --- | --- |
| `SINGLE` | Indicates that a [CatalogModifierList](#type-catalogmodifierlist) allows only a<br>single [CatalogModifier](#type-catalogmodifier) to be selected. |
| `MULTIPLE` | Indicates that a [CatalogModifierList](#type-catalogmodifierlist) allows multiple<br>[CatalogModifier](#type-catalogmodifier) to be selected. |

#### Catalog Object Type

Possible kinds of [CatalogObject](#type-catalogobject)s returned from the Catalog, each
containing type-specific properties in the `*_data` field corresponding to the object type.

##### Fields

| Name | Description |
|  --- | --- |
| `ITEM` | An item, corresponding to [CatalogItem](#type-catalogitem). The item-specific data<br>will be stored in the `item_data` field. |
| `IMAGE` | An image, corresponding to [CatalogImage](#type-catalogimage). The image-specific data<br>will be stored in the `image_data` field. |
| `CATEGORY` | A category, corresponding to [CatalogCategory](#type-catalogcategory). The category-specific data<br>will be stored in the `category_data` field. |
| `ITEM_VARIATION` | An item variation, corresponding to [CatalogItemVariation](#type-catalogitemvariation). The<br>item variation-specific data will be stored in the `item_variation_data` field. |
| `TAX` | A tax, corresponding to [CatalogTax](#type-catalogtax). The tax-specific data<br>will be stored in the `tax_data` field. |
| `DISCOUNT` | A discount, corresponding to [CatalogDiscount](#type-catalogdiscount). The discount-specific data<br>will be stored in the `discount_data` field. |
| `MODIFIER_LIST` | A modifier list, corresponding to [CatalogModifierList](#type-catalogmodifierlist).<br>The modifier list-specific data will be stored in the `modifier_list_data` field. |
| `MODIFIER` | A modifier, corresponding to [CatalogModifier](#type-catalogmodifier). The modifier-specific data<br>will be stored in the `modifier_data` field. |
| `PRICING_RULE` | A pricing rule, corresponding to [CatalogPricingRule](#type-catalogpricingrule). The pricing-rule-specific data<br>will be stored in the `pricing_rule_data` field. |
| `PRODUCT_SET` | A product set, corresponding to [CatalogProductSet](#type-catalogproductset).<br>The product-set-specific data will be stored in the `product_set_data` field. |
| `TIME_PERIOD` | A time period, corresponding to [CatalogTimePeriod](#type-catalogtimeperiod).<br>The time-period-specific data will be stored in the `time_period_data` field. |

#### Catalog Pricing Type

Indicates whether the price of a [CatalogItemVariation](#type-catalogitemvariation) should be entered manually at the time of sale.

##### Fields

| Name | Description |
|  --- | --- |
| `FIXED_PRICING` | The [CatalogItemVariation](#type-catalogitemvariation)'s price is fixed. |
| `VARIABLE_PRICING` | The [CatalogItemVariation](#type-catalogitemvariation)'s price is entered at the time of sale. |

#### Country

Indicates the country associated with another entity, such as a business.
Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm).

##### Fields

| Name | Description |
|  --- | --- |
| `ZZ` | - |
| `AD` | - |
| `AE` | - |
| `AF` | - |
| `AG` | - |
| `AI` | - |
| `AL` | - |
| `AM` | - |
| `AO` | - |
| `AQ` | - |
| `AR` | - |
| `AS` | - |
| `AT` | - |
| `AU` | - |
| `AW` | - |
| `AX` | - |
| `AZ` | - |
| `BA` | - |
| `BB` | - |
| `BD` | - |
| `BE` | - |
| `BF` | - |
| `BG` | - |
| `BH` | - |
| `BI` | - |
| `BJ` | - |
| `BL` | - |
| `BM` | - |
| `BN` | - |
| `BO` | - |
| `BQ` | - |
| `BR` | - |
| `BS` | - |
| `BT` | - |
| `BV` | - |
| `BW` | - |
| `BY` | - |
| `BZ` | - |
| `CA` | - |
| `CC` | - |
| `CD` | - |
| `CF` | - |
| `CG` | - |
| `CH` | - |
| `CI` | - |
| `CK` | - |
| `CL` | - |
| `CM` | - |
| `CN` | - |
| `CO` | - |
| `CR` | - |
| `CU` | - |
| `CV` | - |
| `CW` | - |
| `CX` | - |
| `CY` | - |
| `CZ` | - |
| `DE` | - |
| `DJ` | - |
| `DK` | - |
| `DM` | - |
| `DO` | - |
| `DZ` | - |
| `EC` | - |
| `EE` | - |
| `EG` | - |
| `EH` | - |
| `ER` | - |
| `ES` | - |
| `ET` | - |
| `FI` | - |
| `FJ` | - |
| `FK` | - |
| `FM` | - |
| `FO` | - |
| `FR` | - |
| `GA` | - |
| `GB` | - |
| `GD` | - |
| `GE` | - |
| `GF` | - |
| `GG` | - |
| `GH` | - |
| `GI` | - |
| `GL` | - |
| `GM` | - |
| `GN` | - |
| `GP` | - |
| `GQ` | - |
| `GR` | - |
| `GS` | - |
| `GT` | - |
| `GU` | - |
| `GW` | - |
| `GY` | - |
| `HK` | - |
| `HM` | - |
| `HN` | - |
| `HR` | - |
| `HT` | - |
| `HU` | - |
| `ID` | - |
| `IE` | - |
| `IL` | - |
| `IM` | - |
| `IN` | - |
| `IO` | - |
| `IQ` | - |
| `IR` | - |
| `IS` | - |
| `IT` | - |
| `JE` | - |
| `JM` | - |
| `JO` | - |
| `JP` | - |
| `KE` | - |
| `KG` | - |
| `KH` | - |
| `KI` | - |
| `KM` | - |
| `KN` | - |
| `KP` | - |
| `KR` | - |
| `KW` | - |
| `KY` | - |
| `KZ` | - |
| `LA` | - |
| `LB` | - |
| `LC` | - |
| `LI` | - |
| `LK` | - |
| `LR` | - |
| `LS` | - |
| `LT` | - |
| `LU` | - |
| `LV` | - |
| `LY` | - |
| `MA` | - |
| `MC` | - |
| `MD` | - |
| `ME` | - |
| `MF` | - |
| `MG` | - |
| `MH` | - |
| `MK` | - |
| `ML` | - |
| `MM` | - |
| `MN` | - |
| `MO` | - |
| `MP` | - |
| `MQ` | - |
| `MR` | - |
| `MS` | - |
| `MT` | - |
| `MU` | - |
| `MV` | - |
| `MW` | - |
| `MX` | - |
| `MY` | - |
| `MZ` | - |
| `NA` | - |
| `NC` | - |
| `NE` | - |
| `NF` | - |
| `NG` | - |
| `NI` | - |
| `NL` | - |
| `NO` | - |
| `NP` | - |
| `NR` | - |
| `NU` | - |
| `NZ` | - |
| `OM` | - |
| `PA` | - |
| `PE` | - |
| `PF` | - |
| `PG` | - |
| `PH` | - |
| `PK` | - |
| `PL` | - |
| `PM` | - |
| `PN` | - |
| `PR` | - |
| `PS` | - |
| `PT` | - |
| `PW` | - |
| `PY` | - |
| `QA` | - |
| `RE` | - |
| `RO` | - |
| `RS` | - |
| `RU` | - |
| `RW` | - |
| `SA` | - |
| `SB` | - |
| `SC` | - |
| `SD` | - |
| `SE` | - |
| `SG` | - |
| `SH` | - |
| `SI` | - |
| `SJ` | - |
| `SK` | - |
| `SL` | - |
| `SM` | - |
| `SN` | - |
| `SO` | - |
| `SR` | - |
| `SS` | - |
| `ST` | - |
| `SV` | - |
| `SX` | - |
| `SY` | - |
| `SZ` | - |
| `TC` | - |
| `TD` | - |
| `TF` | - |
| `TG` | - |
| `TH` | - |
| `TJ` | - |
| `TK` | - |
| `TL` | - |
| `TM` | - |
| `TN` | - |
| `TO` | - |
| `TR` | - |
| `TT` | - |
| `TV` | - |
| `TW` | - |
| `TZ` | - |
| `UA` | - |
| `UG` | - |
| `UM` | - |
| `US` | - |
| `UY` | - |
| `UZ` | - |
| `VA` | - |
| `VC` | - |
| `VE` | - |
| `VG` | - |
| `VI` | - |
| `VN` | - |
| `VU` | - |
| `WF` | - |
| `WS` | - |
| `YE` | - |
| `YT` | - |
| `ZA` | - |
| `ZM` | - |
| `ZW` | - |

#### Currency

Indicates the associated currency for an amount of money. Values correspond
to [ISO 4217](https://wikipedia.org/wiki/ISO_4217).

##### Fields

| Name | Description |
|  --- | --- |
| `UNKNOWN_CURRENCY` | - |
| `AED` | - |
| `AFN` | - |
| `ALL` | - |
| `AMD` | - |
| `ANG` | - |
| `AOA` | - |
| `ARS` | - |
| `AUD` | - |
| `AWG` | - |
| `AZN` | - |
| `BAM` | - |
| `BBD` | - |
| `BDT` | - |
| `BGN` | - |
| `BHD` | - |
| `BIF` | - |
| `BMD` | - |
| `BND` | - |
| `BOB` | - |
| `BOV` | - |
| `BRL` | - |
| `BSD` | - |
| `BTN` | - |
| `BWP` | - |
| `BYR` | - |
| `BZD` | - |
| `CAD` | - |
| `CDF` | - |
| `CHE` | - |
| `CHF` | - |
| `CHW` | - |
| `CLF` | - |
| `CLP` | - |
| `CNY` | - |
| `COP` | - |
| `COU` | - |
| `CRC` | - |
| `CUC` | - |
| `CUP` | - |
| `CVE` | - |
| `CZK` | - |
| `DJF` | - |
| `DKK` | - |
| `DOP` | - |
| `DZD` | - |
| `EGP` | - |
| `ERN` | - |
| `ETB` | - |
| `EUR` | - |
| `FJD` | - |
| `FKP` | - |
| `GBP` | - |
| `GEL` | - |
| `GHS` | - |
| `GIP` | - |
| `GMD` | - |
| `GNF` | - |
| `GTQ` | - |
| `GYD` | - |
| `HKD` | - |
| `HNL` | - |
| `HRK` | - |
| `HTG` | - |
| `HUF` | - |
| `IDR` | - |
| `ILS` | - |
| `INR` | - |
| `IQD` | - |
| `IRR` | - |
| `ISK` | - |
| `JMD` | - |
| `JOD` | - |
| `JPY` | - |
| `KES` | - |
| `KGS` | - |
| `KHR` | - |
| `KMF` | - |
| `KPW` | - |
| `KRW` | - |
| `KWD` | - |
| `KYD` | - |
| `KZT` | - |
| `LAK` | - |
| `LBP` | - |
| `LKR` | - |
| `LRD` | - |
| `LSL` | - |
| `LTL` | - |
| `LVL` | - |
| `LYD` | - |
| `MAD` | - |
| `MDL` | - |
| `MGA` | - |
| `MKD` | - |
| `MMK` | - |
| `MNT` | - |
| `MOP` | - |
| `MRO` | - |
| `MUR` | - |
| `MVR` | - |
| `MWK` | - |
| `MXN` | - |
| `MXV` | - |
| `MYR` | - |
| `MZN` | - |
| `NAD` | - |
| `NGN` | - |
| `NIO` | - |
| `NOK` | - |
| `NPR` | - |
| `NZD` | - |
| `OMR` | - |
| `PAB` | - |
| `PEN` | - |
| `PGK` | - |
| `PHP` | - |
| `PKR` | - |
| `PLN` | - |
| `PYG` | - |
| `QAR` | - |
| `RON` | - |
| `RSD` | - |
| `RUB` | - |
| `RWF` | - |
| `SAR` | - |
| `SBD` | - |
| `SCR` | - |
| `SDG` | - |
| `SEK` | - |
| `SGD` | - |
| `SHP` | - |
| `SLL` | - |
| `SOS` | - |
| `SRD` | - |
| `SSP` | - |
| `STD` | - |
| `SVC` | - |
| `SYP` | - |
| `SZL` | - |
| `THB` | - |
| `TJS` | - |
| `TMT` | - |
| `TND` | - |
| `TOP` | - |
| `TRY` | - |
| `TTD` | - |
| `TWD` | - |
| `TZS` | - |
| `UAH` | - |
| `UGX` | - |
| `USD` | - |
| `USN` | - |
| `USS` | - |
| `UYI` | - |
| `UYU` | - |
| `UZS` | - |
| `VEF` | - |
| `VND` | - |
| `VUV` | - |
| `WST` | - |
| `XAF` | - |
| `XAG` | - |
| `XAU` | - |
| `XBA` | - |
| `XBB` | - |
| `XBC` | - |
| `XBD` | - |
| `XCD` | - |
| `XDR` | - |
| `XOF` | - |
| `XPD` | - |
| `XPF` | - |
| `XPT` | - |
| `XTS` | - |
| `XXX` | - |
| `YER` | - |
| `ZAR` | - |
| `ZMK` | - |
| `ZMW` | - |
| `BTC` | - |

#### Customer Creation Source

Indicates the method used to create the customer profile.

##### Fields

| Name | Description |
|  --- | --- |
| `OTHER` | Default creation source. Typically used for backward/future<br>compatibility when the original source of a customer profile is<br>unrecognized. For example, when older clients do not support newer<br>source types. |
| `APPOINTMENTS` | Customer profile created automatically when an appointment<br>was scheduled. |
| `COUPON` | Customer profile created automatically when a coupon was issued<br>using Square Point of Sale. |
| `DELETION_RECOVERY` | Customer profile restored through Square's deletion recovery<br>process. |
| `DIRECTORY` | Customer profile created manually through Square Dashboard or<br>Point of Sale application. |
| `EGIFTING` | Customer profile created automatically when a gift card was<br>issued using Square Point of Sale. Customer profiles are created for<br>both the purchaser and the recipient of the gift card. |
| `EMAIL_COLLECTION` | Customer profile created through Square Point of Sale when<br>signing up for marketing emails during checkout. |
| `FEEDBACK` | Customer profile created automatically when providing feedback<br>through a digital receipt. |
| `IMPORT` | Customer profile created automatically when importing customer<br>data through Square Dashboard. |
| `INVOICES` | Customer profile created automatically during an invoice payment. |
| `LOYALTY` | Customer profile created automatically when customers provide a<br>phone number for loyalty reward programs during checkout. |
| `MARKETING` | Customer profile created as the result of a campaign managed<br>through Square’s Facebook integration. |
| `MERGE` | Customer profile created as the result of explicitly merging<br>multiple customer profiles through the Square Dashboard or Point of<br>Sale application. |
| `ONLINE_STORE` | Customer profile created through Square's Online Store solution<br>(legacy service). |
| `INSTANT_PROFILE` | Customer profile created automatically as the result of a successful<br>transaction that did not explicitly link to an existing customer profile. |
| `TERMINAL` | Customer profile created through Square's Virtual Terminal. |
| `THIRD_PARTY` | Customer profile created through a Square API call. |
| `THIRD_PARTY_IMPORT` | Customer profile created by a third-party product and imported<br>through an official integration. |
| `UNMERGE_RECOVERY` | Customer profile restored through Square's unmerge recovery<br>process. |

#### Customer Inclusion Exclusion

Indicates whether customers should be included in, or excluded from,
the result set when they match the filtering criteria.

##### Fields

| Name | Description |
|  --- | --- |
| `INCLUDE` | Customers should be included in the result set when they match the<br>filtering criteria. |
| `EXCLUDE` | Customers should be excluded from the result set when they match<br>the filtering criteria. |

#### Customer Sort Field

Indicates the sort criteria for a list of Customers.

##### Fields

| Name | Description |
|  --- | --- |
| `DEFAULT` | Use the default sort. By default, Customers are sorted<br>alphanumerically by concatenating `given_name` and `family_name`. If<br>neither name field is set, string comparison is performed using one of the<br>remaining fields in the following order: `company_name`, `email`,<br>`phone_number`. |
| `CREATED_AT` | Sort Customers by their creation date (`created_at`). |

#### Day of Week

Indicates the specific day  of the week.

##### Fields

| Name | Description |
|  --- | --- |
| `SUN` | Sunday |
| `MON` | Monday |
| `TUE` | Tuesday |
| `WED` | Wednesday |
| `THU` | Thursday |
| `FRI` | Friday |
| `SAT` | Saturday |

#### Employee Status

The status of the Employee being retrieved.

##### Fields

| Name | Description |
|  --- | --- |
| `ACTIVE` | Specifies that the employee is in the Active state. |
| `INACTIVE` | Specifies that the employee is in the Inactive state. |

#### Error Category

Indicates which high-level category of error has occurred during a
request to the Connect API.

##### Fields

| Name | Description |
|  --- | --- |
| `API_ERROR` | An error occurred with the Connect API itself. |
| `AUTHENTICATION_ERROR` | An authentication error occurred. Most commonly, the request had<br>a missing, malformed, or otherwise invalid `Authorization` header. |
| `INVALID_REQUEST_ERROR` | The request was invalid. Most commonly, a required parameter was<br>missing, or a provided parameter had an invalid value. |
| `RATE_LIMIT_ERROR` | Your application reached the Connect API rate limit. Retry your request<br>after a while. |
| `PAYMENT_METHOD_ERROR` | An error occurred while processing a payment method. Most commonly,<br>the details of the payment method were invalid (such as a card's CVV<br>or expiration date). |
| `REFUND_ERROR` | An error occurred while attempting to process a refund. |

#### Error Code

Indicates specific errors that can occur during a request to the
Connect API.

##### Fields

| Name | Description |
|  --- | --- |
| `INTERNAL_SERVER_ERROR` | - |
| `UNAUTHORIZED` | - |
| `ACCESS_TOKEN_EXPIRED` | - |
| `ACCESS_TOKEN_REVOKED` | - |
| `FORBIDDEN` | - |
| `INSUFFICIENT_SCOPES` | - |
| `APPLICATION_DISABLED` | - |
| `V1_APPLICATION` | - |
| `V1_ACCESS_TOKEN` | - |
| `CARD_PROCESSING_NOT_ENABLED` | - |
| `BAD_REQUEST` | - |
| `MISSING_REQUIRED_PARAMETER` | - |
| `INCORRECT_TYPE` | - |
| `INVALID_TIME` | - |
| `INVALID_TIME_RANGE` | - |
| `INVALID_VALUE` | - |
| `INVALID_CURSOR` | - |
| `UNKNOWN_QUERY_PARAMETER` | - |
| `CONFLICTING_PARAMETERS` | - |
| `EXPECTED_JSON_BODY` | - |
| `INVALID_SORT_ORDER` | - |
| `VALUE_REGEX_MISMATCH` | - |
| `VALUE_TOO_SHORT` | - |
| `VALUE_TOO_LONG` | - |
| `VALUE_TOO_LOW` | - |
| `VALUE_TOO_HIGH` | - |
| `VALUE_EMPTY` | - |
| `ARRAY_LENGTH_TOO_LONG` | - |
| `ARRAY_LENGTH_TOO_SHORT` | - |
| `ARRAY_EMPTY` | - |
| `EXPECTED_BOOLEAN` | - |
| `EXPECTED_INTEGER` | - |
| `EXPECTED_FLOAT` | - |
| `EXPECTED_STRING` | - |
| `EXPECTED_OBJECT` | - |
| `EXPECTED_ARRAY` | - |
| `EXPECTED_MAP` | - |
| `EXPECTED_BASE64_ENCODED_BYTE_ARRAY` | - |
| `INVALID_ARRAY_VALUE` | - |
| `INVALID_ENUM_VALUE` | - |
| `INVALID_CONTENT_TYPE` | - |
| `INVALID_FORM_VALUE` | - |
| `ONE_INSTRUMENT_EXPECTED` | - |
| `NO_FIELDS_SET` | - |
| `DEPRECATED_FIELD_SET` | - |
| `RETIRED_FIELD_SET` | - |
| `CARD_EXPIRED` | - |
| `INVALID_EXPIRATION` | - |
| `INVALID_EXPIRATION_YEAR` | - |
| `INVALID_EXPIRATION_DATE` | - |
| `UNSUPPORTED_CARD_BRAND` | - |
| `UNSUPPORTED_ENTRY_METHOD` | - |
| `INVALID_ENCRYPTED_CARD` | - |
| `INVALID_CARD` | - |
| `DELAYED_TRANSACTION_EXPIRED` | - |
| `DELAYED_TRANSACTION_CANCELED` | - |
| `DELAYED_TRANSACTION_CAPTURED` | - |
| `DELAYED_TRANSACTION_FAILED` | - |
| `CARD_TOKEN_EXPIRED` | - |
| `CARD_TOKEN_USED` | - |
| `AMOUNT_TOO_HIGH` | - |
| `UNSUPPORTED_INSTRUMENT_TYPE` | - |
| `REFUND_AMOUNT_INVALID` | - |
| `REFUND_ALREADY_PENDING` | - |
| `PAYMENT_NOT_REFUNDABLE` | - |
| `INVALID_CARD_DATA` | - |
| `LOCATION_MISMATCH` | - |
| `IDEMPOTENCY_KEY_REUSED` | - |
| `UNEXPECTED_VALUE` | - |
| `SANDBOX_NOT_SUPPORTED` | - |
| `INVALID_EMAIL_ADDRESS` | - |
| `INVALID_PHONE_NUMBER` | - |
| `CHECKOUT_EXPIRED` | - |
| `BAD_CERTIFICATE` | - |
| `INVALID_SQUARE_VERSION_FORMAT` | - |
| `API_VERSION_INCOMPATIBLE` | - |
| `CARD_DECLINED` | - |
| `VERIFY_CVV_FAILURE` | - |
| `VERIFY_AVS_FAILURE` | - |
| `CARD_DECLINED_CALL_ISSUER` | - |
| `NOT_FOUND` | - |
| `APPLE_PAYMENT_PROCESSING_CERTIFICATE_HASH_NOT_FOUND` | - |
| `METHOD_NOT_ALLOWED` | - |
| `NOT_ACCEPTABLE` | - |
| `REQUEST_TIMEOUT` | - |
| `CONFLICT` | - |
| `REQUEST_ENTITY_TOO_LARGE` | - |
| `UNSUPPORTED_MEDIA_TYPE` | - |
| `RATE_LIMITED` | - |
| `NOT_IMPLEMENTED` | - |
| `SERVICE_UNAVAILABLE` | - |
| `GATEWAY_TIMEOUT` | - |

#### Inventory Alert Type

Indicates whether Square should alert the merchant when the inventory quantity of a [CatalogItemVariation](#type-catalogitemvariation) is low.

##### Fields

| Name | Description |
|  --- | --- |
| `NONE` | The variation does not display an alert. |
| `LOW_QUANTITY` | The variation generates an alert when its quantity is low. |

#### Inventory Change Type

Indicates how the inventory change was applied to a tracked quantity of items.

##### Fields

| Name | Description |
|  --- | --- |
| `PHYSICAL_COUNT` | The change occurred as part of a physical count update. |
| `ADJUSTMENT` | The change occurred as part of the normal lifecycle of goods<br>(e.g., as an inventory adjustment). |
| `TRANSFER` | The change occurred as part of an inventory transfer. |

#### Inventory State

Indicates the state of a tracked item quantity in the lifecycle of goods.

##### Fields

| Name | Description |
|  --- | --- |
| `CUSTOM` | The related quantity of items are in a custom state. **READ-ONLY**:<br>the Inventory API cannot move quantities to or from this state. |
| `IN_STOCK` | The related quantity of items are on hand and available for sale. |
| `SOLD` | The related quantity of items were sold as part of an itemized<br>transaction. Quantities in the `SOLD` state are no longer tracked. |
| `RETURNED_BY_CUSTOMER` | The related quantity of items were returned through the Square Point<br>of Sale application, but are not yet available for sale. **READ-ONLY**:<br>the Inventory API cannot move quantities to or from this state. |
| `RESERVED_FOR_SALE` | The related quantity of items are on hand, but not currently<br>available for sale. **READ-ONLY**: the Inventory API cannot move<br>quantities to or from this state. |
| `SOLD_ONLINE` | The related quantity of items were sold online. **READ-ONLY**: the<br>Inventory API cannot move quantities to or from this state. |
| `ORDERED_FROM_VENDOR` | The related quantity of items were ordered from a vendor but not yet<br>received. **READ-ONLY**: the Inventory API cannot move quantities to or<br>from this state. |
| `RECEIVED_FROM_VENDOR` | The related quantity of items were received from a vendor but are<br>not yet available for sale. **READ-ONLY**: the Inventory API cannot move<br>quantities to or from this state. |
| `IN_TRANSIT_TO` | The related quantity of items are in transit between locations.<br>*READ-ONLY**: the Inventory API cannot move quantities to or from this<br>state. |
| `NONE` | A placeholder indicating that the related quantity of items are not<br>currently tracked in Square. Transferring quantities from the `NONE` state<br>to a tracked state (e.g., `IN_STOCK`) introduces stock into the system. |
| `WASTE` | The related quantity of items are lost or damaged and cannot be<br>sold. |
| `UNLINKED_RETURN` | The related quantity of items were returned but not linked to a<br>previous transaction. Unlinked returns are not tracked in Square.<br>Transferring a quantity from `UNLINKED_RETURN` to a tracked state (e.g.,<br>`IN_STOCK`) introduces new stock into the system. |

#### Location Capability

Indicates payment capabilities that a business's location might or
might not have enabled.

##### Fields

| Name | Description |
|  --- | --- |
| `CREDIT_CARD_PROCESSING` | The location can process credit cards with Square.<br><br>If this value is not present in a [`Location`](#type-location)'s'<br>`capabilities` array, the location _cannot_ process credit cards. |

#### Location Status

Indicates the location's status.

##### Fields

| Name | Description |
|  --- | --- |
| `ACTIVE` | A fully operational location. The location can be used across all Square products and APIs. |
| `INACTIVE` | A functionally limited location. The location can only be used via Square APIs.<br><br>__NOTE__: We __strongly__ discourage the use of inactive locations.<br>Making API calls with inactive locations will cause complications<br>if the restrictions on inactive locations increase in the future. |

#### Location Type

Indicates the location's type.

##### Fields

| Name | Description |
|  --- | --- |
| `PHYSICAL` | A physical location of a business. |
| `MOBILE` | A location without a physical address. For example: mobile food truck, online store, phone app. |

#### Measurement Unit Area

Unit of area used to measure a quantity.

##### Fields

| Name | Description |
|  --- | --- |
| `IMPERIAL_ACRE` | The area is measured in acres. |
| `IMPERIAL_SQUARE_INCH` | The area is measured in square inches. |
| `IMPERIAL_SQUARE_FOOT` | The area is measured in square feet. |
| `IMPERIAL_SQUARE_YARD` | The area is measured in square yards. |
| `IMPERIAL_SQUARE_MILE` | The area is measured in square miles. |
| `METRIC_SQUARE_CENTIMETER` | The area is measured in square centimeters. |
| `METRIC_SQUARE_METER` | The area is measured in square meters. |
| `METRIC_SQUARE_KILOMETER` | The area is measured in square kilometers. |

#### Measurement Unit Generic

A custom unit of measurement defined by the user.

##### Fields

| Name | Description |
|  --- | --- |
| `INVALID_GENERIC_UNIT` | - |
| `UNIT` | - |

#### Measurement Unit Length

The unit of length used to measure a quantity.

##### Fields

| Name | Description |
|  --- | --- |
| `IMPERIAL_INCH` | The length is measured in inches. |
| `IMPERIAL_FOOT` | The length is measured in feet. |
| `IMPERIAL_YARD` | The length is measured in yards. |
| `IMPERIAL_MILE` | The length is measured in miles. |
| `METRIC_MILLIMETER` | The length is measured in millimeters. |
| `METRIC_CENTIMETER` | The length is measured in centimeters. |
| `METRIC_METER` | The length is measured in meters. |
| `METRIC_KILOMETER` | The length is measured in kilometers. |

#### Measurement Unit Volume

The unit of volume used to measure a quantity.

##### Fields

| Name | Description |
|  --- | --- |
| `GENERIC_FLUID_OUNCE` | The volume is measured in ounces. |
| `GENERIC_SHOT` | The volume is measured in shots. |
| `GENERIC_CUP` | The volume is measured in cups. |
| `GENERIC_PINT` | The volume is measured in pints. |
| `GENERIC_QUART` | The volume is measured in quarts. |
| `GENERIC_GALLON` | The volume is measured in gallons. |
| `IMPERIAL_CUBIC_INCH` | The volume is measured in cubic inches. |
| `IMPERIAL_CUBIC_FOOT` | The volume is measured in cubic feet. |
| `IMPERIAL_CUBIC_YARD` | The volume is measured in cubic yards. |
| `METRIC_MILLILITER` | The volume is measured in metric milliliters. |
| `METRIC_LITER` | The volume is measured in metric liters. |

#### Measurement Unit Weight

Unit of weight used to measure a quantity.

##### Fields

| Name | Description |
|  --- | --- |
| `IMPERIAL_WEIGHT_OUNCE` | The weight is measured in ounces. |
| `IMPERIAL_POUND` | The weight is measured in pounds. |
| `IMPERIAL_STONE` | The weight is measured in stones. |
| `METRIC_MILLIGRAM` | The weight is measured in milligrams. |
| `METRIC_GRAM` | The weight is measured in grams. |
| `METRIC_KILOGRAM` | The weight is measured in kilograms. |

#### Order Fulfillment Pickup Details Schedule Type

The schedule type of the pickup fulfillment.

##### Fields

| Name | Description |
|  --- | --- |
| `SCHEDULED` | Indicates the fulfillment will be picked up at a scheduled pickup time. |
| `ASAP` | Indicates the fulfillment should be prepared immediately. |

#### Order Fulfillment State

The state of the fulfillment.

##### Fields

| Name | Description |
|  --- | --- |
| `PROPOSED` | Indicates the fulfillment has been proposed. |
| `RESERVED` | Indicates the fulfillment has been reserved. |
| `PREPARED` | Indicates the fulfillment has been prepared. |
| `COMPLETED` | Indicates the fulfillment was successfully completed. |
| `CANCELED` | Indicates the fulfillment was canceled by either the merchant or buyer. |
| `FAILED` | Indicates the fulfillment failed to be completed but was not explicitly canceled. |

#### Order Fulfillment Type

The type of fulfillment.

##### Fields

| Name | Description |
|  --- | --- |
| `PICKUP` | A fulfillment to be picked up by a recipient. |

#### Order Line Item Discount Scope

Indicates whether this is a line item or order level discount.

##### Fields

| Name | Description |
|  --- | --- |
| `OTHER_DISCOUNT_SCOPE` | Used for reporting only.<br>The original transaction discount scope is currently not supported by the API. |
| `LINE_ITEM` | The discount should be applied to a single line item. |
| `ORDER` | The discount should be applied to the entire order. |

#### Order Line Item Discount Type

Indicates how the discount is applied to the associated line item or order.

##### Fields

| Name | Description |
|  --- | --- |
| `UNKNOWN_DISCOUNT` | Used for reporting only.<br>The original transaction discount type is currently not supported by the API. |
| `FIXED_PERCENTAGE` | Apply the discount as a fixed percentage (e.g., 5%) off the item price. |
| `FIXED_AMOUNT` | Apply the discount as a fixed monetary value (e.g., $1.00) off the item price. |
| `VARIABLE_PERCENTAGE` | Apply the discount as a variable percentage off the item price.<br><br>The variable percentage is defined in Register POS apps. Specific value is assigned at the time of the purchase. |
| `VARIABLE_AMOUNT` | Apply the discount as a variable amount off the item price.<br><br>The variable amount is defined in Square POS app. Specific value is assigned at the time of the purchase. |

#### Order Line Item Tax Scope

Indicates whether this is a line item or order level tax.

##### Fields

| Name | Description |
|  --- | --- |
| `OTHER_TAX_SCOPE` | Used for reporting only.<br>The original transaction tax scope is currently not supported by the API. |
| `LINE_ITEM` | The tax should be applied to a single line item. |
| `ORDER` | The tax should be applied to the entire order. |

#### Order Line Item Tax Type

Indicates how the tax is applied to the associated line item or order.

##### Fields

| Name | Description |
|  --- | --- |
| `UNKNOWN_TAX` | Used for reporting only.<br>The original transaction tax type is currently not supported by the API. |
| `ADDITIVE` | The tax is an additive tax. The tax amount is added on top of the price.<br>For example, a $1.00 item with a 10% additive tax would have a total cost to the buyer of $1.10. |
| `INCLUSIVE` | The tax is an inclusive tax. Inclusive taxes are already included in the line item price or order total.<br>For example, a $1.00 item with a 10% inclusive tax would have a pre-tax cost of $0.91 (91 cents)<br>and a $0.09 (9 cents) tax for a total cost of $1 to the buyer. |

#### Order Service Charge Calculation Phase

Represents a phase in the process of calculating order totals. Service charges will
be applied after the phase indicated.

[Read more about how order totals are calculated.](/orders-api/how-it-works#how-totals-are-calculated)

##### Fields

| Name | Description |
|  --- | --- |
| `SUBTOTAL_PHASE` | The service charge will be applied after discounts but before taxes. |
| `TOTAL_PHASE` | The service charge will be applied after both discounts and taxes are applied. |

#### Order State

The state of the order.

##### Fields

| Name | Description |
|  --- | --- |
| `OPEN` | Indicates the order is open. Open orders may be updated. |
| `COMPLETED` | Indicates the order is completed. Completed orders are fully paid. This is a terminal state. |
| `CANCELED` | Indicates the order is canceled. Canceled orders are not paid. This is a terminal state. |

#### Product

Indicates the Square product used to generate an inventory change.

##### Fields

| Name | Description |
|  --- | --- |
| `SQUARE_POS` | Square Point of Sale application. |
| `EXTERNAL_API` | Square Connect APIs (Transactions API, Checkout API). |
| `BILLING` | A Square subscription (various products). |
| `APPOINTMENTS` | Square Appointments. |
| `INVOICES` | Square Invoices. |
| `ONLINE_STORE` | Square Online Store. |
| `PAYROLL` | Square Payroll. |
| `DASHBOARD` | Square Dashboard |
| `ITEM_LIBRARY_IMPORT` | Item Library Import |
| `OTHER` | A Square product that does not match any other value. |

#### Refund Status

Indicates a refund's current status.

##### Fields

| Name | Description |
|  --- | --- |
| `PENDING` | The refund is pending. |
| `APPROVED` | The refund has been approved by Square. |
| `REJECTED` | The refund has been rejected by Square. |
| `FAILED` | The refund failed. |

#### Register Domain Response Status

The status of domain registration.

##### Fields

| Name | Description |
|  --- | --- |
| `PENDING` | The domain is added, but not verified. |
| `VERIFIED` | The domain is added and verified. It can be used to accept Apple Pay transactions. |

#### Search Orders Sort Field

Specifies which timestamp to use to sort SearchOrder results.

##### Fields

| Name | Description |
|  --- | --- |
| `CREATED_AT` | Time when the order was created in RFC-3339 format. |
| `UPDATED_AT` | Time when the order last updated in RFC-3339 format. |
| `CLOSED_AT` | Time when the order was closed in RFC-3339 format. |

#### Shift Filter Status

Specifies the `status` of `Shift` records to be returned.

##### Fields

| Name | Description |
|  --- | --- |
| `OPEN` | Shifts that have been started and not ended. |
| `CLOSED` | Shifts that have been started and ended. |

#### Shift Sort Field

Enumerates the `Shift` fields to sort on.

##### Fields

| Name | Description |
|  --- | --- |
| `START_AT` | The start date/time of a `Shift` |
| `END_AT` | The end date/time of a `Shift` |
| `CREATED_AT` | The date/time that a `Shift` is created |
| `UPDATED_AT` | The most recent date/time that a `Shift` is updated |

#### Shift Status

Enumerates the possible status of a `Shift`

##### Fields

| Name | Description |
|  --- | --- |
| `OPEN` | Employee started a work shift and the shift is not complete |
| `CLOSED` | Employee started and ended a work shift. |

#### Shift Workday Matcher

Defines the logic used to apply a workday filter.

##### Fields

| Name | Description |
|  --- | --- |
| `START_AT` | All shifts that start on or after the specified workday |
| `END_AT` | All shifts that end on or before the specified workday |
| `INTERSECTION` | All shifts that start between the start and end workdays (inclusive) |

#### Sort Order

The order (e.g., chronological or alphabetical) in which results from a request are returned.

##### Fields

| Name | Description |
|  --- | --- |
| `DESC` | The results are returned in descending (e.g., newest-first or Z-A) order. |
| `ASC` | The results are returned in ascending (e.g., oldest-first or A-Z) order. |

#### Tax Calculation Phase

When to calculate the taxes due on a cart.

##### Fields

| Name | Description |
|  --- | --- |
| `TAX_SUBTOTAL_PHASE` | The fee is calculated based on the payment's subtotal. |
| `TAX_TOTAL_PHASE` | The fee is calculated based on the payment's total. |

#### Tax Inclusion Type

Whether to the tax amount should be additional to or included in to the [CatalogItem](#type-catalogitem) price.

##### Fields

| Name | Description |
|  --- | --- |
| `ADDITIVE` | The tax is an additive tax. The tax amount is added on top of the<br>[CatalogItemVariation](#type-catalogitemvariation) price. For example, a $1.00 item with a 10% additive<br>tax would have a total cost to the buyer of $1.10. |
| `INCLUSIVE` | The tax is an inclusive tax. The tax amount is included in the<br>[CatalogItemVariation](#type-catalogitemvariation) price. For example, a $1.00 item with a 10% inclusive<br>tax would have a total cost to the buyer of $1.00, with $0.91 (91 cents) of that total being the cost of the item<br>and $0.09 (9 cents) being tax. |

#### Tender Card Details Entry Method

Indicates the method used to enter the card's details.

##### Fields

| Name | Description |
|  --- | --- |
| `SWIPED` | The card was swiped through a Square reader or Square stand. |
| `KEYED` | The card information was keyed manually into Square Point of Sale or a<br>Square-hosted web form. |
| `EMV` | The card was processed via EMV with a Square reader. |
| `ON_FILE` | The buyer's card details were already on file with Square. |
| `CONTACTLESS` | The card was processed via a contactless (i.e., NFC) transaction<br>with a Square reader. |

#### Tender Card Details Status

Indicates the card transaction's current status.

##### Fields

| Name | Description |
|  --- | --- |
| `AUTHORIZED` | The card transaction has been authorized but not yet captured. |
| `CAPTURED` | The card transaction was authorized and subsequently captured (i.e., completed). |
| `VOIDED` | The card transaction was authorized and subsequently voided (i.e., canceled). |
| `FAILED` | The card transaction failed. |

#### Tender Type

Indicates a tender's type.

##### Fields

| Name | Description |
|  --- | --- |
| `CARD` | A credit card. |
| `CASH` | Cash. |
| `THIRD_PARTY_CARD` | A credit card processed with a card processor other than Square.<br><br>This value applies only to merchants in countries where Square does not<br>yet provide card processing. |
| `SQUARE_GIFT_CARD` | A Square gift card. |
| `NO_SALE` | This tender represents the register being opened for a "no sale" event. |
| `OTHER` | A form of tender that does not match any other value. |

#### Transaction Product

Indicates the Square product used to process a transaction.

##### Fields

| Name | Description |
|  --- | --- |
| `REGISTER` | Square Point of Sale. |
| `EXTERNAL_API` | The Square Connect API. |
| `BILLING` | A Square subscription for one of multiple products. |
| `APPOINTMENTS` | Square Appointments. |
| `INVOICES` | Square Invoices. |
| `ONLINE_STORE` | Square Online Store. |
| `PAYROLL` | Square Payroll. |
| `OTHER` | A Square product that does not match any other value. |

#### V1 Adjust Inventory Request Adjustment Type

##### Fields

| Name | Description |
|  --- | --- |
| `SALE` | - |
| `RECEIVE_STOCK` | - |
| `MANUAL_ADJUST` | - |

#### V1 Bank Account Type

##### Fields

| Name | Description |
|  --- | --- |
| `BUSINESS_CHECKING` | - |
| `CHECKING` | - |
| `INVESTMENT` | - |
| `LOAN` | - |
| `SAVINGS` | - |
| `OTHER` | - |

#### V1 Cash Drawer Event Event Type

##### Fields

| Name | Description |
|  --- | --- |
| `NO_SALE` | - |
| `CASH_TENDER_PAYMENT` | - |
| `OTHER_TENDER_PAYMENT` | - |
| `CASH_TENDER_CANCELED_PAYMENT` | - |
| `OTHER_TENDER_CANCELED_PAYMENT` | - |
| `CASH_TENDER_REFUND` | - |
| `OTHER_TENDER_REFUND` | - |
| `PAID_IN` | - |
| `PAID_OUT` | - |

#### V1 Cash Drawer Shift Event Type

##### Fields

| Name | Description |
|  --- | --- |
| `OPEN` | - |
| `ENDED` | - |
| `CLOSED` | - |

#### V1 Create Refund Request Type

##### Fields

| Name | Description |
|  --- | --- |
| `FULL` | - |
| `PARTIAL` | - |

#### V1 Discount Color

##### Fields

| Name | Description |
|  --- | --- |
| `Enum_9da2a6` | - |
| `Enum_4ab200` | - |
| `Enum_0b8000` | - |
| `Enum_2952cc` | - |
| `a82ee5` | - |
| `e5457a` | - |
| `b21212` | - |
| `Enum_593c00` | - |
| `e5BF00` | - |

#### V1 Discount Discount Type

##### Fields

| Name | Description |
|  --- | --- |
| `FIXED` | - |
| `VARIABLE_PERCENTAGE` | - |
| `VARIABLE_AMOUNT` | - |

#### V1 Employee Role Permissions

##### Fields

| Name | Description |
|  --- | --- |
| `REGISTER_ACCESS_SALES_HISTORY` | - |
| `REGISTER_APPLY_RESTRICTED_DISCOUNTS` | - |
| `REGISTER_CHANGE_SETTINGS` | - |
| `REGISTER_EDIT_ITEM` | - |
| `REGISTER_ISSUE_REFUNDS` | - |
| `REGISTER_OPEN_CASH_DRAWER_OUTSIDE_SALE` | - |
| `REGISTER_VIEW_SUMMARY_REPORTS` | - |

#### V1 Employee Status

##### Fields

| Name | Description |
|  --- | --- |
| `ACTIVE` | - |
| `INACTIVE` | - |

#### V1 Fee Adjustment Type

##### Fields

| Name | Description |
|  --- | --- |
| `TAX` | - |

#### V1 Fee Calculation Phase

##### Fields

| Name | Description |
|  --- | --- |
| `FEE_SUBTOTAL_PHASE` | - |
| `OTHER` | - |
| `FEE_TOTAL_PHASE` | - |

#### V1 Fee Inclusion Type

##### Fields

| Name | Description |
|  --- | --- |
| `ADDITIVE` | - |
| `INCLUSIVE` | - |

#### V1 Fee Type

##### Fields

| Name | Description |
|  --- | --- |
| `CA_GST` | - |
| `CA_HST` | - |
| `CA_PST` | - |
| `CA_QST` | - |
| `JP_CONSUMPTION_TAX` | - |
| `CA_PEI_PST` | - |
| `US_SALES_TAX` | - |
| `OTHER` | - |

#### V1 Item Type

##### Fields

| Name | Description |
|  --- | --- |
| `NORMAL` | - |
| `GIFT_CARD` | - |
| `OTHER` | - |

#### V1 Item Visibility

##### Fields

| Name | Description |
|  --- | --- |
| `PUBLIC` | - |
| `PRIVATE` | - |

#### V1 List Settlements Request Status

##### Fields

| Name | Description |
|  --- | --- |
| `SENT` | - |
| `FAILED` | - |

#### V1 Merchant Account Type

##### Fields

| Name | Description |
|  --- | --- |
| `LOCATION` | - |
| `BUSINESS` | - |

#### V1 Merchant Business Type

##### Fields

| Name | Description |
|  --- | --- |
| `ACCOUNTING` | - |
| `APPAREL_AND_ACCESSORY_SHOPS` | - |
| `ART_DEALERS_GALLERIES` | - |
| `ART_DESIGN_AND_PHOTOGRAPHY` | - |
| `BAR_CLUB_LOUNGE` | - |
| `BEAUTY_AND_BARBER_SHOPS` | - |
| `BOOK_STORES` | - |
| `BUSINESS_SERVICES` | - |
| `CATERING` | - |
| `CHARITABLE_SOCIAL_SERVICE_ORGANIZATIONS` | - |
| `CHARITIBLE_ORGS` | - |
| `CLEANING_SERVICES` | - |
| `COMPUTER_EQUIPMENT_SOFTWARE_MAINTENANCE_REPAIR_SERVICES` | - |
| `CONSULTANT` | - |
| `CONTRACTORS` | - |
| `DELIVERY_SERVICES` | - |
| `DENTISTRY` | - |
| `EDUCATION` | - |
| `FOOD_STORES_CONVENIENCE_STORES_AND_SPECIALTY_MARKETS` | - |
| `FOOD_TRUCK_CART` | - |
| `FURNITURE_HOME_AND_OFFICE_EQUIPMENT` | - |
| `FURNITURE_HOME_GOODS` | - |
| `HOTELS_AND_LODGING` | - |
| `INDIVIDUAL_USE` | - |
| `JEWELRY_AND_WATCHES` | - |
| `LANDSCAPING_AND_HORTICULTURAL_SERVICES` | - |
| `LANGUAGE_SCHOOLS` | - |
| `LEGAL_SERVICES` | - |
| `MEDICAL_PRACTITIONERS` | - |
| `MEDICAL_SERVICES_AND_HEALTH_PRACTITIONERS` | - |
| `MEMBERSHIP_ORGANIZATIONS` | - |
| `MUSIC_AND_ENTERTAINMENT` | - |
| `OTHER` | - |
| `OUTDOOR_MARKETS` | - |
| `PERSONAL_SERVICES` | - |
| `POLITICAL_ORGANIZATIONS` | - |
| `PROFESSIONAL_SERVICES` | - |
| `REAL_ESTATE` | - |
| `RECREATION_SERVICES` | - |
| `REPAIR_SHOPS_AND_RELATED_SERVICES` | - |
| `RESTAURANTS` | - |
| `RETAIL_SHOPS` | - |
| `SCHOOLS_AND_EDUCATIONAL_SERVICES` | - |
| `SPORTING_GOODS` | - |
| `TAXICABS_AND_LIMOUSINES` | - |
| `TICKET_SALES` | - |
| `TOURISM` | - |
| `TRAVEL_TOURISM` | - |
| `VETERINARY_SERVICES` | - |
| `WEB_DEV_DESIGN` | - |

#### V1 Modifier List Selection Type

##### Fields

| Name | Description |
|  --- | --- |
| `SINGLE` | - |
| `MULTIPLE` | - |

#### V1 Order History Entry Action

##### Fields

| Name | Description |
|  --- | --- |
| `ORDER_PLACED` | - |
| `DECLINED` | - |
| `PAYMENT_RECEIVED` | - |
| `CANCELED` | - |
| `COMPLETED` | - |
| `REFUNDED` | - |
| `EXPIRED` | - |

#### V1 Order State

##### Fields

| Name | Description |
|  --- | --- |
| `PENDING` | - |
| `OPEN` | - |
| `COMPLETED` | - |
| `CANCELED` | - |
| `REFUNDED` | - |
| `REJECTED` | - |

#### V1 Page Cell Object Type

##### Fields

| Name | Description |
|  --- | --- |
| `ITEM` | - |
| `DISCOUNT` | - |
| `CATEGORY` | - |
| `PLACEHOLDER` | - |

#### V1 Page Cell Placeholder Type

##### Fields

| Name | Description |
|  --- | --- |
| `ALL_ITEMS` | - |
| `DISCOUNTS_CATEGORY` | - |
| `REWARDS_FINDER` | - |

#### V1 Payment Itemization Itemization Type

##### Fields

| Name | Description |
|  --- | --- |
| `ITEM` | - |
| `CUSTOM_AMOUNT` | - |
| `GIFT_CARD_ACTIVATION` | - |
| `GIFT_CARD_RELOAD` | - |
| `GIFT_CARD_UNKNOWN` | - |
| `OTHER` | - |

#### V1 Payment Surcharge Type

##### Fields

| Name | Description |
|  --- | --- |
| `UNKNOWN` | - |
| `AUTO_GRATUITY` | - |
| `CUSTOM` | - |

#### V1 Settlement Entry Type

##### Fields

| Name | Description |
|  --- | --- |
| `ADJUSTMENT` | A manual adjustment applied to the merchant's account by Square |
| `BALANCE_CHARGE` | A payment from an existing Square balance, such as a gift card |
| `CHARGE` | A credit card payment CAPTURE |
| `FREE_PROCESSING` | Square offers Free Payments Processing for a variety of business scenarios including seller referral or when we want to apologize for a bug, customer service, repricing complication, etc. This entry represents a credit to the merchant for the purposes of Free Processing. |
| `HOLD_ADJUSTMENT` | An adjustment made by Square related to holding/releasing a payment |
| `PAID_SERVICE_FEE` | a fee paid to a 3rd party merchant |
| `PAID_SERVICE_FEE_REFUND` | a refund for a 3rd party merchant fee |
| `REDEMPTION_CODE` | Repayment for a redemption code |
| `REFUND` | A refund for an existing card payment |
| `RETURNED_PAYOUT` | An entry created when we receive a response for the ACH file we sent indicating that the settlement of the original entry failed. |
| `SQUARE_CAPITAL_ADVANCE` | Initial deposit to a merchant for a Capital merchant cash advance (MCA). |
| `SQUARE_CAPITAL_PAYMENT` | Capital merchant cash advance (MCA) assessment. These are, generally, proportional to the merchant's sales but may be issued for other reasons related to the MCA. |
| `SQUARE_CAPITAL_REVERSED_PAYMENT` | Capital merchant cash advance (MCA) assessment refund. These are, generally, proportional to the merchant's refunds but may be issued for other reasons related to the MCA. |
| `SUBSCRIPTION_FEE` | Fee charged for subscription to a Square product |
| `SUBSCRIPTION_FEE_REFUND` | Refund of a previously charged Square product subscription fee. |
| `OTHER` | - |
| `INCENTED_PAYMENT` | A payment in which Square covers part of the funds for a purchase |
| `RETURNED_ACH_ENTRY` | A settlement failed to be processed and the settlement amount has been returned to the account |
| `RETURNED_SQUARE_275` | Refund for cancelling a Square Plus subscription |
| `SQUARE_275` | Fee charged for a Square Plus subscription ($275) |
| `SQUARE_CARD` | Settlements to or withdrawals from the Square Card (an asset) |

#### V1 Tender Card Brand

The brand of a credit card.

##### Fields

| Name | Description |
|  --- | --- |
| `OTHER_BRAND` | - |
| `VISA` | - |
| `MASTER_CARD` | - |
| `AMERICAN_EXPRESS` | - |
| `DISCOVER` | - |
| `DISCOVER_DINERS` | - |
| `JCB` | - |
| `CHINA_UNIONPAY` | - |
| `SQUARE_GIFT_CARD` | - |

#### V1 Tender Entry Method

##### Fields

| Name | Description |
|  --- | --- |
| `MANUAL` | - |
| `SCANNED` | - |
| `SQUARE_CASH` | - |
| `SQUARE_WALLET` | - |
| `SWIPED` | - |
| `WEB_FORM` | - |
| `OTHER` | - |

#### V1 Tender Type

##### Fields

| Name | Description |
|  --- | --- |
| `CREDIT_CARD` | - |
| `CASH` | - |
| `THIRD_PARTY_CARD` | - |
| `NO_SALE` | - |
| `SQUARE_WALLET` | - |
| `SQUARE_GIFT_CARD` | - |
| `UNKNOWN` | - |
| `OTHER` | - |

#### V1 Timecard Event Event Type

Actions that resulted in a change to a timecard. All timecard
events created with the Connect API have an event type that begins with
`API`.

##### Fields

| Name | Description |
|  --- | --- |
| `API_CREATE` | The timecard was created by a request to the<br>[CreateTimecard](#endpoint-v1employees-createtimecard) endpoint. |
| `API_EDIT` | The timecard was edited by a request to the<br>[UpdateTimecard](#endpoint-v1employees-updatetimecard) endpoint. |
| `API_DELETE` | The timecard was deleted by a request to the<br>[DeleteTimecard](#endpoint-v1employees-deletetimecard) endpoint. |
| `REGISTER_CLOCKIN` | The employee clocked in via Square Point of Sale. |
| `REGISTER_CLOCKOUT` | The employee clocked out via Square Point of Sale. |
| `DASHBOARD_SUPERVISOR_CLOSE` | A supervisor clocked out the employee from the merchant<br>dashboard. |
| `DASHBOARD_EDIT` | A supervisor manually edited the timecard from the merchant<br>dashboard |
| `DASHBOARD_DELETE` | A supervisor deleted the timecard from the merchant dashboard. |

#### V1 Update Order Request Action

##### Fields

| Name | Description |
|  --- | --- |
| `COMPLETE` | - |
| `CANCEL` | - |
| `REFUND` | - |

#### V1 Variation Inventory Alert Type

##### Fields

| Name | Description |
|  --- | --- |
| `LOW_QUANTITY` | - |
| `NONE` | - |
| `INVESTMENT` | - |
| `LOAN` | - |
| `SAVINGS` | - |
| `OTHER` | - |

#### V1 Variation Pricing Type

##### Fields

| Name | Description |
|  --- | --- |
| `FIXED_PRICING` | - |
| `VARIABLE_PRICING` | - |

#### Webhook Events

The type of an event that triggers a webhook notification to an application.

##### Fields

| Name | Description |
|  --- | --- |
| `Enum_inventorycountupdated` | The quantity was updated for a catalog item variation.<br>Webhook notification data is packaged as: [`InventoryCount[]`](#type-inventorychange). |

#### Weekday

The days of the week.

##### Fields

| Name | Description |
|  --- | --- |
| `MON` | Monday |
| `TUE` | Tuesday |
| `WED` | Wednesday |
| `THU` | Thursday |
| `FRI` | Friday |
| `SAT` | Saturday |
| `SUN` | Sunday |

### Structures

* [Additional Recipient](#additional-recipient)
* [Additional Recipient Receivable](#additional-recipient-receivable)
* [Additional Recipient Receivable Refund](#additional-recipient-receivable-refund)
* [Address](#address)
* [Batch Change Inventory Request](#batch-change-inventory-request)
* [Batch Change Inventory Response](#batch-change-inventory-response)
* [Batch Delete Catalog Objects Request](#batch-delete-catalog-objects-request)
* [Batch Delete Catalog Objects Response](#batch-delete-catalog-objects-response)
* [Batch Retrieve Catalog Objects Request](#batch-retrieve-catalog-objects-request)
* [Batch Retrieve Catalog Objects Response](#batch-retrieve-catalog-objects-response)
* [Batch Retrieve Inventory Changes Request](#batch-retrieve-inventory-changes-request)
* [Batch Retrieve Inventory Changes Response](#batch-retrieve-inventory-changes-response)
* [Batch Retrieve Inventory Counts Request](#batch-retrieve-inventory-counts-request)
* [Batch Retrieve Inventory Counts Response](#batch-retrieve-inventory-counts-response)
* [Batch Retrieve Orders Request](#batch-retrieve-orders-request)
* [Batch Retrieve Orders Response](#batch-retrieve-orders-response)
* [Batch Upsert Catalog Objects Request](#batch-upsert-catalog-objects-request)
* [Batch Upsert Catalog Objects Response](#batch-upsert-catalog-objects-response)
* [Break](#break)
* [Break Type](#break-type)
* [Business Hours](#business-hours)
* [Business Hours Period](#business-hours-period)
* [Capture Transaction Response](#capture-transaction-response)
* [Card](#card)
* [Catalog Category](#catalog-category)
* [Catalog Discount](#catalog-discount)
* [Catalog Id Mapping](#catalog-id-mapping)
* [Catalog Image](#catalog-image)
* [Catalog Info Response](#catalog-info-response)
* [Catalog Info Response Limits](#catalog-info-response-limits)
* [Catalog Item](#catalog-item)
* [Catalog Item Modifier List Info](#catalog-item-modifier-list-info)
* [Catalog Item Variation](#catalog-item-variation)
* [Catalog Measurement Unit](#catalog-measurement-unit)
* [Catalog Modifier](#catalog-modifier)
* [Catalog Modifier List](#catalog-modifier-list)
* [Catalog Modifier Override](#catalog-modifier-override)
* [Catalog Object](#catalog-object)
* [Catalog Object Batch](#catalog-object-batch)
* [Catalog Pricing Rule](#catalog-pricing-rule)
* [Catalog Product Set](#catalog-product-set)
* [Catalog Query](#catalog-query)
* [Catalog Query Exact](#catalog-query-exact)
* [Catalog Query Items for Modifier List](#catalog-query-items-for-modifier-list)
* [Catalog Query Items for Tax](#catalog-query-items-for-tax)
* [Catalog Query Prefix](#catalog-query-prefix)
* [Catalog Query Range](#catalog-query-range)
* [Catalog Query Sorted Attribute](#catalog-query-sorted-attribute)
* [Catalog Query Text](#catalog-query-text)
* [Catalog Tax](#catalog-tax)
* [Catalog Time Period](#catalog-time-period)
* [Catalog V1 Id](#catalog-v1-id)
* [Charge Request](#charge-request)
* [Charge Request Additional Recipient](#charge-request-additional-recipient)
* [Charge Response](#charge-response)
* [Checkout](#checkout-1)
* [Coordinates](#coordinates)
* [Create Break Type Request](#create-break-type-request)
* [Create Break Type Response](#create-break-type-response)
* [Create Checkout Request](#create-checkout-request)
* [Create Checkout Response](#create-checkout-response)
* [Create Customer Card Request](#create-customer-card-request)
* [Create Customer Card Response](#create-customer-card-response)
* [Create Customer Request](#create-customer-request)
* [Create Customer Response](#create-customer-response)
* [Create Mobile Authorization Code Request](#create-mobile-authorization-code-request)
* [Create Mobile Authorization Code Response](#create-mobile-authorization-code-response)
* [Create Order Request](#create-order-request)
* [Create Order Request Discount](#create-order-request-discount)
* [Create Order Request Line Item](#create-order-request-line-item)
* [Create Order Request Modifier](#create-order-request-modifier)
* [Create Order Request Tax](#create-order-request-tax)
* [Create Order Response](#create-order-response)
* [Create Refund Request](#create-refund-request)
* [Create Refund Response](#create-refund-response)
* [Create Shift Request](#create-shift-request)
* [Create Shift Response](#create-shift-response)
* [Customer](#customer)
* [Customer Creation Source Filter](#customer-creation-source-filter)
* [Customer Filter](#customer-filter)
* [Customer Group Info](#customer-group-info)
* [Customer Preferences](#customer-preferences)
* [Customer Query](#customer-query)
* [Customer Sort](#customer-sort)
* [Date Range](#date-range)
* [Delete Break Type Response](#delete-break-type-response)
* [Delete Catalog Object Response](#delete-catalog-object-response)
* [Delete Customer Card Response](#delete-customer-card-response)
* [Delete Customer Response](#delete-customer-response)
* [Delete Shift Response](#delete-shift-response)
* [Device](#device)
* [Employee](#employee)
* [Employee Wage](#employee-wage)
* [Error](#error)
* [Get Break Type Response](#get-break-type-response)
* [Get Employee Wage Response](#get-employee-wage-response)
* [Get Shift Response](#get-shift-response)
* [Inventory Adjustment](#inventory-adjustment)
* [Inventory Change](#inventory-change)
* [Inventory Count](#inventory-count)
* [Inventory Physical Count](#inventory-physical-count)
* [Inventory Transfer](#inventory-transfer)
* [Item Variation Location Overrides](#item-variation-location-overrides)
* [List Additional Recipient Receivable Refunds Request](#list-additional-recipient-receivable-refunds-request)
* [List Additional Recipient Receivable Refunds Response](#list-additional-recipient-receivable-refunds-response)
* [List Additional Recipient Receivables Request](#list-additional-recipient-receivables-request)
* [List Additional Recipient Receivables Response](#list-additional-recipient-receivables-response)
* [List Break Types Request](#list-break-types-request)
* [List Break Types Response](#list-break-types-response)
* [List Catalog Request](#list-catalog-request)
* [List Catalog Response](#list-catalog-response)
* [List Customers Request](#list-customers-request)
* [List Customers Response](#list-customers-response)
* [List Employee Wages Request](#list-employee-wages-request)
* [List Employee Wages Response](#list-employee-wages-response)
* [List Employees Request](#list-employees-request)
* [List Employees Response](#list-employees-response)
* [List Locations Response](#list-locations-response)
* [List Refunds Request](#list-refunds-request)
* [List Refunds Response](#list-refunds-response)
* [List Transactions Request](#list-transactions-request)
* [List Transactions Response](#list-transactions-response)
* [List Workweek Configs Request](#list-workweek-configs-request)
* [List Workweek Configs Response](#list-workweek-configs-response)
* [Location](#location)
* [Measurement Unit](#measurement-unit)
* [Measurement Unit Custom](#measurement-unit-custom)
* [Money](#money)
* [Obtain Token Request](#obtain-token-request)
* [Obtain Token Response](#obtain-token-response)
* [Order](#order)
* [Order Entry](#order-entry)
* [Order Fulfillment](#order-fulfillment)
* [Order Fulfillment Pickup Details](#order-fulfillment-pickup-details)
* [Order Fulfillment Recipient](#order-fulfillment-recipient)
* [Order Line Item](#order-line-item)
* [Order Line Item Discount](#order-line-item-discount)
* [Order Line Item Modifier](#order-line-item-modifier)
* [Order Line Item Tax](#order-line-item-tax)
* [Order Money Amounts](#order-money-amounts)
* [Order Quantity Unit](#order-quantity-unit)
* [Order Return](#order-return)
* [Order Return Discount](#order-return-discount)
* [Order Return Line Item](#order-return-line-item)
* [Order Return Line Item Modifier](#order-return-line-item-modifier)
* [Order Return Service Charge](#order-return-service-charge)
* [Order Return Tax](#order-return-tax)
* [Order Rounding Adjustment](#order-rounding-adjustment)
* [Order Service Charge](#order-service-charge)
* [Order Source](#order-source)
* [Refund](#refund)
* [Register Domain Request](#register-domain-request)
* [Register Domain Response](#register-domain-response)
* [Renew Token Request](#renew-token-request)
* [Renew Token Response](#renew-token-response)
* [Retrieve Catalog Object Request](#retrieve-catalog-object-request)
* [Retrieve Catalog Object Response](#retrieve-catalog-object-response)
* [Retrieve Customer Response](#retrieve-customer-response)
* [Retrieve Employee Response](#retrieve-employee-response)
* [Retrieve Inventory Adjustment Response](#retrieve-inventory-adjustment-response)
* [Retrieve Inventory Changes Request](#retrieve-inventory-changes-request)
* [Retrieve Inventory Changes Response](#retrieve-inventory-changes-response)
* [Retrieve Inventory Count Request](#retrieve-inventory-count-request)
* [Retrieve Inventory Count Response](#retrieve-inventory-count-response)
* [Retrieve Inventory Physical Count Response](#retrieve-inventory-physical-count-response)
* [Retrieve Transaction Response](#retrieve-transaction-response)
* [Revoke Token Request](#revoke-token-request)
* [Revoke Token Response](#revoke-token-response)
* [Search Catalog Objects Request](#search-catalog-objects-request)
* [Search Catalog Objects Response](#search-catalog-objects-response)
* [Search Customers Request](#search-customers-request)
* [Search Customers Response](#search-customers-response)
* [Search Orders Customer Filter](#search-orders-customer-filter)
* [Search Orders Date Time Filter](#search-orders-date-time-filter)
* [Search Orders Filter](#search-orders-filter)
* [Search Orders Fulfillment Filter](#search-orders-fulfillment-filter)
* [Search Orders Query](#search-orders-query)
* [Search Orders Request](#search-orders-request)
* [Search Orders Response](#search-orders-response)
* [Search Orders Sort](#search-orders-sort)
* [Search Orders Source Filter](#search-orders-source-filter)
* [Search Orders State Filter](#search-orders-state-filter)
* [Search Shifts Request](#search-shifts-request)
* [Search Shifts Response](#search-shifts-response)
* [Shift](#shift)
* [Shift Filter](#shift-filter)
* [Shift Query](#shift-query)
* [Shift Sort](#shift-sort)
* [Shift Wage](#shift-wage)
* [Shift Workday](#shift-workday)
* [Source Application](#source-application)
* [Standard Unit Description](#standard-unit-description)
* [Standard Unit Description Group](#standard-unit-description-group)
* [Tender](#tender)
* [Tender Card Details](#tender-card-details)
* [Tender Cash Details](#tender-cash-details)
* [Time Range](#time-range)
* [Transaction](#transaction)
* [Update Break Type Request](#update-break-type-request)
* [Update Break Type Response](#update-break-type-response)
* [Update Customer Request](#update-customer-request)
* [Update Customer Response](#update-customer-response)
* [Update Item Modifier Lists Request](#update-item-modifier-lists-request)
* [Update Item Modifier Lists Response](#update-item-modifier-lists-response)
* [Update Item Taxes Request](#update-item-taxes-request)
* [Update Item Taxes Response](#update-item-taxes-response)
* [Update Shift Request](#update-shift-request)
* [Update Shift Response](#update-shift-response)
* [Update Workweek Config Request](#update-workweek-config-request)
* [Update Workweek Config Response](#update-workweek-config-response)
* [Upsert Catalog Object Request](#upsert-catalog-object-request)
* [Upsert Catalog Object Response](#upsert-catalog-object-response)
* [V1 Adjust Inventory Request](#v1-adjust-inventory-request)
* [V1 Bank Account](#v1-bank-account)
* [V1 Cash Drawer Event](#v1-cash-drawer-event)
* [V1 Cash Drawer Shift](#v1-cash-drawer-shift)
* [V1 Category](#v1-category)
* [V1 Create Category Request](#v1-create-category-request)
* [V1 Create Discount Request](#v1-create-discount-request)
* [V1 Create Employee Role Request](#v1-create-employee-role-request)
* [V1 Create Fee Request](#v1-create-fee-request)
* [V1 Create Item Request](#v1-create-item-request)
* [V1 Create Modifier List Request](#v1-create-modifier-list-request)
* [V1 Create Modifier Option Request](#v1-create-modifier-option-request)
* [V1 Create Page Request](#v1-create-page-request)
* [V1 Create Refund Request](#v1-create-refund-request)
* [V1 Create Variation Request](#v1-create-variation-request)
* [V1 Delete Page Cell Request](#v1-delete-page-cell-request)
* [V1 Discount](#v1-discount)
* [V1 Employee](#v1-employee)
* [V1 Employee Role](#v1-employee-role)
* [V1 Fee](#v1-fee)
* [V1 Inventory Entry](#v1-inventory-entry)
* [V1 Item](#v1-item)
* [V1 Item Image](#v1-item-image)
* [V1 List Bank Accounts Response](#v1-list-bank-accounts-response)
* [V1 List Cash Drawer Shifts Request](#v1-list-cash-drawer-shifts-request)
* [V1 List Cash Drawer Shifts Response](#v1-list-cash-drawer-shifts-response)
* [V1 List Categories Response](#v1-list-categories-response)
* [V1 List Discounts Response](#v1-list-discounts-response)
* [V1 List Employee Roles Request](#v1-list-employee-roles-request)
* [V1 List Employee Roles Response](#v1-list-employee-roles-response)
* [V1 List Employees Request](#v1-list-employees-request)
* [V1 List Employees Response](#v1-list-employees-response)
* [V1 List Fees Response](#v1-list-fees-response)
* [V1 List Inventory Request](#v1-list-inventory-request)
* [V1 List Inventory Response](#v1-list-inventory-response)
* [V1 List Items Request](#v1-list-items-request)
* [V1 List Items Response](#v1-list-items-response)
* [V1 List Locations Response](#v1-list-locations-response)
* [V1 List Modifier Lists Response](#v1-list-modifier-lists-response)
* [V1 List Orders Request](#v1-list-orders-request)
* [V1 List Orders Response](#v1-list-orders-response)
* [V1 List Pages Response](#v1-list-pages-response)
* [V1 List Payments Request](#v1-list-payments-request)
* [V1 List Payments Response](#v1-list-payments-response)
* [V1 List Refunds Request](#v1-list-refunds-request)
* [V1 List Refunds Response](#v1-list-refunds-response)
* [V1 List Settlements Request](#v1-list-settlements-request)
* [V1 List Settlements Response](#v1-list-settlements-response)
* [V1 List Timecard Events Response](#v1-list-timecard-events-response)
* [V1 List Timecards Request](#v1-list-timecards-request)
* [V1 List Timecards Response](#v1-list-timecards-response)
* [V1 Merchant](#v1-merchant)
* [V1 Merchant Location Details](#v1-merchant-location-details)
* [V1 Modifier List](#v1-modifier-list)
* [V1 Modifier Option](#v1-modifier-option)
* [V1 Money](#v1-money)
* [V1 Order](#v1-order)
* [V1 Order History Entry](#v1-order-history-entry)
* [V1 Page](#v1-page)
* [V1 Page Cell](#v1-page-cell)
* [V1 Payment](#v1-payment)
* [V1 Payment Discount](#v1-payment-discount)
* [V1 Payment Item Detail](#v1-payment-item-detail)
* [V1 Payment Itemization](#v1-payment-itemization)
* [V1 Payment Modifier](#v1-payment-modifier)
* [V1 Payment Surcharge](#v1-payment-surcharge)
* [V1 Payment Tax](#v1-payment-tax)
* [V1 Phone Number](#v1-phone-number)
* [V1 Refund](#v1-refund)
* [V1 Settlement](#v1-settlement)
* [V1 Settlement Entry](#v1-settlement-entry)
* [V1 Tender](#v1-tender)
* [V1 Timecard](#v1-timecard)
* [V1 Timecard Event](#v1-timecard-event)
* [V1 Update Category Request](#v1-update-category-request)
* [V1 Update Discount Request](#v1-update-discount-request)
* [V1 Update Employee Request](#v1-update-employee-request)
* [V1 Update Employee Role Request](#v1-update-employee-role-request)
* [V1 Update Fee Request](#v1-update-fee-request)
* [V1 Update Item Request](#v1-update-item-request)
* [V1 Update Modifier List Request](#v1-update-modifier-list-request)
* [V1 Update Modifier Option Request](#v1-update-modifier-option-request)
* [V1 Update Order Request](#v1-update-order-request)
* [V1 Update Page Cell Request](#v1-update-page-cell-request)
* [V1 Update Page Request](#v1-update-page-request)
* [V1 Update Timecard Request](#v1-update-timecard-request)
* [V1 Update Variation Request](#v1-update-variation-request)
* [V1 Variation](#v1-variation)
* [Void Transaction Response](#void-transaction-response)
* [Workweek Config](#workweek-config)

#### Additional Recipient

Represents an additional recipient (other than the merchant) receiving a portion of this tender.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` |  | The location ID for a recipient (other than the merchant) receiving a portion of this tender. |
| `description` | `String` |  | The description of the additional recipient. |
| `amount_money` | [`Money Hash`](#money) |  | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `receivable_id` | `String` | Optional | The unique ID for this [AdditionalRecipientReceivable](#type-additionalrecipientreceivable), assigned by the server. |

##### Example (as JSON)

```json
{
  "location_id": "location_id4",
  "description": "description0",
  "amount_money": {
    "amount": null,
    "currency": null
  },
  "receivable_id": null
}
```

#### Additional Recipient Receivable

Represents a monetary distribution of part of a [Transaction](#type-transaction)'s amount for Transactions which included additional recipients. The location of this receivable is that same as the one specified in the [AdditionalRecipient](#type-additionalrecipient).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` |  | The additional recipient receivable's unique ID, issued by Square payments servers. |
| `transaction_id` | `String` |  | The ID of the transaction that the additional recipient receivable was applied to. |
| `transaction_location_id` | `String` |  | The ID of the location that created the receivable. This is the location ID on the associated transaction. |
| `amount_money` | [`Money Hash`](#money) |  | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `created_at` | `String` | Optional | The time when the additional recipient receivable was created, in RFC 3339 format. |
| `refunds` | [`Array<Additional Recipient Receivable Refund Hash>`](#additional-recipient-receivable-refund) | Optional | Any refunds of the receivable that have been applied. |

##### Example (as JSON)

```json
{
  "id": "id0",
  "transaction_id": "transaction_id8",
  "transaction_location_id": "transaction_location_id6",
  "amount_money": {
    "amount": null,
    "currency": null
  },
  "created_at": null,
  "refunds": null
}
```

#### Additional Recipient Receivable Refund

A refund of an [AdditionalRecipientReceivable](#type-additionalrecipientreceivable). This includes the ID of the additional recipient receivable associated to this object, as well as a reference to the [Refund](#type-refund) that created this receivable refund.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` |  | The receivable refund's unique ID, issued by Square payments servers. |
| `receivable_id` | `String` |  | The ID of the receivable that the refund was applied to. |
| `refund_id` | `String` |  | The ID of the refund that is associated to this receivable refund. |
| `transaction_location_id` | `String` |  | The ID of the location that created the receivable. This is the location ID on the associated transaction. |
| `amount_money` | [`Money Hash`](#money) |  | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `created_at` | `String` | Optional | The time when the refund was created, in RFC 3339 format. |

##### Example (as JSON)

```json
{
  "id": "id0",
  "receivable_id": "receivable_id0",
  "refund_id": "refund_id4",
  "transaction_location_id": "transaction_location_id6",
  "amount_money": {
    "amount": null,
    "currency": null
  },
  "created_at": null
}
```

#### Address

Represents a physical address.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `address_line_1` | `String` | Optional | The first line of the address.<br><br>Fields that start with `address_line` provide the address's most specific<br>details, like street number, street name, and building name. They do *not*<br>provide less specific details like city, state/province, or country (these<br>details are provided in other fields). |
| `address_line_2` | `String` | Optional | The second line of the address, if any. |
| `address_line_3` | `String` | Optional | The third line of the address, if any. |
| `locality` | `String` | Optional | The city or town of the address. |
| `sublocality` | `String` | Optional | A civil region within the address's `locality`, if any. |
| `sublocality_2` | `String` | Optional | A civil region within the address's `sublocality`, if any. |
| `sublocality_3` | `String` | Optional | A civil region within the address's `sublocality_2`, if any. |
| `administrative_district_level_1` | `String` | Optional | A civil entity within the address's country. In the US, this<br>is the state. |
| `administrative_district_level_2` | `String` | Optional | A civil entity within the address's `administrative_district_level_1`.<br>In the US, this is the county. |
| `administrative_district_level_3` | `String` | Optional | A civil entity within the address's `administrative_district_level_2`,<br>if any. |
| `postal_code` | `String` | Optional | The address's postal code. |
| `country` | [`String (Country)`](#country) | Optional | Indicates the country associated with another entity, such as a business.<br>Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm). |
| `first_name` | `String` | Optional | Optional first name when it's representing recipient. |
| `last_name` | `String` | Optional | Optional last name when it's representing recipient. |
| `organization` | `String` | Optional | Optional organization name when it's representing recipient. |

##### Example (as JSON)

```json
{
  "address_line_1": null,
  "address_line_2": null,
  "address_line_3": null,
  "locality": null,
  "sublocality": null,
  "sublocality_2": null,
  "sublocality_3": null,
  "administrative_district_level_1": null,
  "administrative_district_level_2": null,
  "administrative_district_level_3": null,
  "postal_code": null,
  "country": null,
  "first_name": null,
  "last_name": null,
  "organization": null
}
```

#### Batch Change Inventory Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` | Optional | A client-supplied, universally unique identifier (UUID) for the<br>request.<br><br>See [Idempotency](/basics/api101/idempotency) in the<br>[API Development 101](/basics/api101/overview) section for more<br>information. |
| `changes` | [`Array<Inventory Change Hash>`](#inventory-change) | Optional | The set of physical counts and inventory adjustments to be made.<br>Changes are applied based on the client-supplied timestamp and may be sent<br>out of order. Max size is 100 changes. |
| `ignore_unchanged_counts` | `Boolean` | Optional | Indicates whether the current physical count should be ignored if<br>the quantity is unchanged since the last physical count. Default: `true`. |

##### Example (as JSON)

```json
{
  "request_body": {
    "idempotency_key": "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
    "changes": [
      {
        "type": "PHYSICAL_COUNT",
        "physical_count": {
          "reference_id": "1536bfbf-efed-48bf-b17d-a197141b2a92",
          "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
          "state": "IN_STOCK",
          "location_id": "C6W5YS5QM06F5",
          "quantity": "53",
          "employee_id": "LRK57NSQ5X7PUD05",
          "occurred_at": "2016-11-16T22:25:24.878Z"
        }
      }
    ],
    "ignore_unchanged_counts": true
  }
}
```

#### Batch Change Inventory Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `counts` | [`Array<Inventory Count Hash>`](#inventory-count) | Optional | The current counts for all objects referenced in the request. |

##### Example (as JSON)

```json
{
  "errors": [],
  "counts": [
    {
      "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
      "catalog_object_type": "ITEM_VARIATION",
      "state": "IN_STOCK",
      "location_id": "C6W5YS5QM06F5",
      "quantity": "53",
      "calculated_at": "2016-11-16T22:28:01.223Z"
    }
  ]
}
```

#### Batch Delete Catalog Objects Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `object_ids` | `Array<String>` | Optional | The IDs of the [CatalogObject](#type-catalogobject)s to be deleted. When an object is deleted, other objects<br>in the graph that depend on that object will be deleted as well (for example, deleting a<br>[CatalogItem](#type-catalogitem) will delete its [CatalogItemVariation](#type-catalogitemvariation)s). |

##### Example (as JSON)

```json
{
  "request_body": {
    "object_ids": [
      "W62UWFY35CWMYGVWK6TWJDNI",
      "AA27W3M2GGTF3H6AVPNB77CK"
    ]
  }
}
```

#### Batch Delete Catalog Objects Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `deleted_object_ids` | `Array<String>` | Optional | The IDs of all [CatalogObject](#type-catalogobject)s deleted by this request. |
| `deleted_at` | `String` | Optional | The database [timestamp](#workingwithdates) of this deletion in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z". |

##### Example (as JSON)

```json
{
  "deleted_object_ids": [
    "W62UWFY35CWMYGVWK6TWJDNI",
    "AA27W3M2GGTF3H6AVPNB77CK"
  ],
  "deleted_at": "2016-11-16T22:25:24.878Z"
}
```

#### Batch Retrieve Catalog Objects Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `object_ids` | `Array<String>` |  | The IDs of the [CatalogObject](#type-catalogobject)s to be retrieved. |
| `include_related_objects` | `Boolean` | Optional | If `true`, the response will include additional objects that are related to the<br>requested objects, as follows:<br><br>If the `objects` field of the response contains a [CatalogItem](#type-catalogitem), <br>its associated [CatalogCategory](#type-catalogcategory), [CatalogTax](#type-catalogtax)es,<br>[CatalogImage](#type-catalogimage)s and [CatalogModifierList](#type-catalogmodifierlist)s<br>will be returned in the `related_objects` field of the response. If the `objects`<br>field of the response contains a [CatalogItemVariation](#type-catalogitemvariation),<br>its parent [CatalogItem](#type-catalogitem) will be returned in the `related_objects` field of<br>the response. |

##### Example (as JSON)

```json
{
  "object_ids": [
    "object_ids4",
    "object_ids5"
  ],
  "include_related_objects": null
}
```

#### Batch Retrieve Catalog Objects Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | A list of [CatalogObject](#type-catalogobject)s returned. |
| `related_objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | A list of [CatalogObject](#type-catalogobject)s referenced by the object in the `objects` field. |

##### Example (as JSON)

```json
{
  "objects": [
    {
      "type": "ITEM",
      "id": "W62UWFY35CWMYGVWK6TWJDNI",
      "updated_at": "2016-11-16T22:25:24.878Z",
      "version": 1479335124878,
      "is_deleted": false,
      "present_at_all_locations": true,
      "item_data": {
        "name": "Tea",
        "description": "Hot Leaf Juice",
        "category_id": "BJNQCF2FJ6S6UIDT65ABHLRX",
        "tax_ids": [
          "HURXQOOAIC4IZSI2BEXQRYFY"
        ],
        "variations": [
          {
            "type": "ITEM_VARIATION",
            "id": "2TZFAOHWGG7PAK2QEXWYPZSP",
            "updated_at": "2016-11-16T22:25:24.878Z",
            "version": 1479335124878,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "W62UWFY35CWMYGVWK6TWJDNI",
              "name": "Mug",
              "ordinal": 0,
              "pricing_type": "FIXED_PRICING",
              "price_money": {
                "amount": 150,
                "currency": "USD"
              }
            }
          }
        ]
      }
    },
    {
      "type": "ITEM",
      "id": "AA27W3M2GGTF3H6AVPNB77CK",
      "updated_at": "2016-11-16T22:25:24.878Z",
      "version": 1479335124878,
      "is_deleted": false,
      "present_at_all_locations": true,
      "item_data": {
        "name": "Coffee",
        "description": "Hot Bean Juice",
        "category_id": "BJNQCF2FJ6S6UIDT65ABHLRX",
        "tax_ids": [
          "HURXQOOAIC4IZSI2BEXQRYFY"
        ],
        "variations": [
          {
            "type": "ITEM_VARIATION",
            "id": "LBTYIHNHU52WOIHWT7SNRIYH",
            "updated_at": "2016-11-16T22:25:24.878Z",
            "version": 1479335124878,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "AA27W3M2GGTF3H6AVPNB77CK",
              "name": "Regular",
              "ordinal": 0,
              "pricing_type": "FIXED_PRICING",
              "price_money": {
                "amount": 250,
                "currency": "USD"
              }
            }
          },
          {
            "type": "ITEM_VARIATION",
            "id": "PKYIC7HGGKW5CYVSCVDEIMHY",
            "updated_at": "2016-11-16T22:25:24.878Z",
            "version": 1479335124878,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "AA27W3M2GGTF3H6AVPNB77CK",
              "name": "Large",
              "ordinal": 1,
              "pricing_type": "FIXED_PRICING",
              "price_money": {
                "amount": 350,
                "currency": "USD"
              }
            }
          }
        ]
      }
    }
  ],
  "related_objects": [
    {
      "type": "CATEGORY",
      "id": "BJNQCF2FJ6S6UIDT65ABHLRX",
      "updated_at": "2016-11-16T22:25:24.878Z",
      "version": 1479335124878,
      "is_deleted": false,
      "present_at_all_locations": true,
      "category_data": {
        "name": "Beverages"
      }
    },
    {
      "type": "TAX",
      "id": "HURXQOOAIC4IZSI2BEXQRYFY",
      "updated_at": "2016-11-16T22:25:24.878Z",
      "version": 1479335124878,
      "is_deleted": false,
      "present_at_all_locations": true,
      "tax_data": {
        "name": "Sales Tax",
        "calculation_phase": "TAX_SUBTOTAL_PHASE",
        "inclusion_type": "ADDITIVE",
        "percentage": "5.0",
        "enabled": true
      }
    }
  ]
}
```

#### Batch Retrieve Inventory Changes Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_ids` | `Array<String>` | Optional | Filters results by [CatalogObject](#type-catalogobject) ID.<br>Only applied when set. Default: unset. |
| `location_ids` | `Array<String>` | Optional | Filters results by [Location](#type-location) ID. Only<br>applied when set. Default: unset. |
| `types` | [`Array<String (Inventory Change Type)>`](#inventory-change-type) | Optional | Filters results by [InventoryChangeType](#type-inventorychangetype).<br>Default: [`PHYSICAL_COUNT`, `ADJUSTMENT`]. `TRANSFER` is not supported as<br>a filter.<br>See [InventoryChangeType](#type-inventorychangetype) for possible values |
| `states` | [`Array<String (Inventory State)>`](#inventory-state) | Optional | Filters `ADJUSTMENT` query results by<br>[InventoryState](#type-inventorystate). Only applied when set.<br>Default: unset.<br>See [InventoryState](#type-inventorystate) for possible values |
| `updated_after` | `String` | Optional | Provided as an RFC 3339 timestamp. Returns results whose<br>`created_at` or `calculated_at` value is after the given time.<br>Default: UNIX epoch (`1970-01-01T00:00:00Z`). |
| `updated_before` | `String` | Optional | Provided as an RFC 3339 timestamp. Returns results whose<br>`created_at` or `calculated_at` value is strictly before the given time.<br>Default: UNIX epoch (`1970-01-01T00:00:00Z`). |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_body": {
    "catalog_object_ids": [
      "W62UWFY35CWMYGVWK6TWJDNI"
    ],
    "location_ids": [
      "C6W5YS5QM06F5"
    ],
    "types": [
      "PHYSICAL_COUNT"
    ],
    "states": [
      "IN_STOCK"
    ],
    "updated_after": "2016-11-01T00:00:00.000Z",
    "updated_before": "2016-12-01T00:00:00.000Z"
  }
}
```

#### Batch Retrieve Inventory Changes Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `changes` | [`Array<Inventory Change Hash>`](#inventory-change) | Optional | The current calculated inventory changes for the requested objects<br>and locations. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset,<br>this is the final response.<br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "errors": [],
  "changes": [
    {
      "type": "PHYSICAL_COUNT",
      "physical_count": {
        "id": "46YDTW253DWGGK9HMAE6XCAO",
        "reference_id": "22c07cf4-5626-4224-89f9-691112019399",
        "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
        "catalog_object_type": "ITEM_VARIATION",
        "state": "IN_STOCK",
        "location_id": "C6W5YS5QM06F5",
        "quantity": "86",
        "source": {
          "product": "SQUARE_POS",
          "application_id": "416ff29c-86c4-4feb-b58c-9705f21f3ea0",
          "name": "Square Point of Sale 4.37"
        },
        "employee_id": "LRK57NSQ5X7PUD05",
        "occurred_at": "2016-11-16T22:24:49.028Z",
        "created_at": "2016-11-16T22:25:24.878Z"
      }
    }
  ]
}
```

#### Batch Retrieve Inventory Counts Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_ids` | `Array<String>` | Optional | Filters results by [CatalogObject](#type-catalogobject) ID.<br>Only applied when set. Default: unset. |
| `location_ids` | `Array<String>` | Optional | Filters results by [Location](#type-location) ID. Only<br>applied when set. Default: unset. |
| `updated_after` | `String` | Optional | Provided as an RFC 3339 timestamp. Returns results whose<br>`calculated_at` value is after the given time. Default: UNIX epoch<br>(`1970-01-01T00:00:00Z`). |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_body": {
    "catalog_object_ids": [
      "W62UWFY35CWMYGVWK6TWJDNI"
    ],
    "location_ids": [
      "59TNP9SA8VGDA"
    ],
    "updated_after": "2016-11-16T00:00:00.000Z"
  }
}
```

#### Batch Retrieve Inventory Counts Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `counts` | [`Array<Inventory Count Hash>`](#inventory-count) | Optional | The current calculated inventory counts for the requested objects<br>and locations. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset,<br>this is the final response.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "errors": [],
  "counts": [
    {
      "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
      "catalog_object_type": "ITEM_VARIATION",
      "state": "IN_STOCK",
      "location_id": "59TNP9SA8VGDA",
      "quantity": "79",
      "calculated_at": "2016-11-16T22:28:01.223Z"
    }
  ]
}
```

#### Batch Retrieve Orders Request

Defines the fields that are included in requests to the
BatchRetrieveOrders endpoint.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `order_ids` | `Array<String>` | The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per request. |

##### Example (as JSON)

```json
{
  "order_ids": [
    "order_ids5",
    "order_ids6",
    "order_ids7"
  ]
}
```

#### Batch Retrieve Orders Response

Defines the fields that are included in the response body of
a request to the BatchRetrieveOrders endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `orders` | [`Array<Order Hash>`](#order) | Optional | The requested orders. This will omit any requested orders that do not exist or are not charged. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `unconvertible_transaction_ids` | `Array<String>` | Optional | List of transaction ids within the requested set of ids that encountered<br>transformation issues when being converted to an Order. |

##### Example (as JSON)

```json
{
  "orders": [
    {
      "id": "CAISEM82RcpmcFBM0TfOyiHV3es",
      "location_id": "LOCATION_ID",
      "reference_id": "my-order-001",
      "line_items": [
        {
          "id": "945986d1-9586-11e6-ad5a-28cfe92138cf",
          "name": "Awesome product",
          "quantity": "1",
          "base_price_money": {
            "amount": 1599,
            "currency": "USD"
          },
          "total_money": {
            "amount": 1599,
            "currency": "USD"
          }
        },
        {
          "id": "a8f4168c-9586-11e6-bdf0-28cfe92138cf",
          "name": "Another awesome product",
          "quantity": "3",
          "base_price_money": {
            "amount": 2000,
            "currency": "USD"
          },
          "total_money": {
            "amount": 6000,
            "currency": "USD"
          }
        }
      ],
      "total_money": {
        "amount": 7599,
        "currency": "USD"
      }
    }
  ]
}
```

#### Batch Upsert Catalog Objects Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` |  | A value you specify that uniquely identifies this<br>request among all your requests. A common way to create<br>a valid idempotency key is to use a Universally unique<br>identifier (UUID).<br><br>If you're unsure whether a particular request was successful,<br>you can reattempt it with the same idempotency key without<br>worrying about creating duplicate objects.<br><br>See [Idempotency](/basics/api101/idempotency) for more information. |
| `batches` | [`Array<Catalog Object Batch Hash>`](#catalog-object-batch) | Optional | A batch of [CatalogObject](#type-catalogobject)s to be inserted/updated atomically.<br>The objects within a batch will be inserted in an all-or-nothing fashion, i.e., if an error occurs<br>attempting to insert or update an object within a batch, the entire batch will be rejected. However, an error<br>in one batch will not affect other batches within the same request.<br><br>For each object, its `updated_at` field is ignored and replaced with a current [timestamp](#workingwithdates), and its<br>`is_deleted` field must not be set to `true`.<br><br>To modify an existing object, supply its ID. To create a new object, use an ID starting<br>with `#`. These IDs may be used to create relationships between an object and attributes of<br>other objects that reference it. For example, you can create a [CatalogItem](#type-catalogitem) with<br>ID `#ABC` and a [CatalogItemVariation](#type-catalogitemvariation) with its `item_id` attribute set to<br>`#ABC` in order to associate the [CatalogItemVariation](#type-catalogitemvariation) with its parent<br>[CatalogItem](#type-catalogitem).<br><br>Any `#`-prefixed IDs are valid only within a single atomic batch, and will be replaced by server-generated IDs.<br><br>Each batch may contain up to 1,000 objects. The total number of objects across all batches for a single request<br>may not exceed 10,000. If either of these limits is violated, an error will be returned and no objects will<br>be inserted or updated. |

##### Example (as JSON)

```json
{
  "idempotency_key": "idempotency_key6",
  "batches": null
}
```

#### Batch Upsert Catalog Objects Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | The created [CatalogObject](#type-catalogobject)s |
| `updated_at` | `String` | Optional | The database [timestamp](#workingwithdates) of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z". |
| `id_mappings` | [`Array<Catalog Id Mapping Hash>`](#catalog-id-mapping) | Optional | The mapping between client and server IDs for this Upsert. |

##### Example (as JSON)

```json
{
  "objects": [
    {
      "type": "ITEM",
      "id": "ZSDZN34NAXDLC6D5ZQMNSOUM",
      "updated_at": "2017-05-10T18:48:39.798Z",
      "version": 1494442119798,
      "is_deleted": false,
      "present_at_all_locations": true,
      "item_data": {
        "name": "Tea",
        "description": "Hot Leaf Juice",
        "category_id": "LYT72K3WGJFFCIMB63XARP3I",
        "tax_ids": [
          "XHSHLHNWSI3HVI4BW5ZUZXI3"
        ],
        "variations": [
          {
            "type": "ITEM_VARIATION",
            "id": "NAYHET5R52MIYCEF34ZMAHFM",
            "updated_at": "2017-05-10T18:48:39.798Z",
            "version": 1494442119798,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "ZSDZN34NAXDLC6D5ZQMNSOUM",
              "name": "Mug",
              "ordinal": 0,
              "pricing_type": "FIXED_PRICING",
              "price_money": {
                "amount": 150,
                "currency": "USD"
              }
            }
          }
        ]
      }
    },
    {
      "type": "ITEM",
      "id": "PJMCEBHHUS3OKDB6PYUHLCPP",
      "updated_at": "2017-05-10T18:48:39.798Z",
      "version": 1494442119798,
      "is_deleted": false,
      "present_at_all_locations": true,
      "item_data": {
        "name": "Coffee",
        "description": "Hot Bean Juice",
        "category_id": "LYT72K3WGJFFCIMB63XARP3I",
        "tax_ids": [
          "XHSHLHNWSI3HVI4BW5ZUZXI3"
        ],
        "variations": [
          {
            "type": "ITEM_VARIATION",
            "id": "OTYDX45SPG7LJQUVCBZI4INH",
            "updated_at": "2017-05-10T18:48:39.798Z",
            "version": 1494442119798,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "PJMCEBHHUS3OKDB6PYUHLCPP",
              "name": "Regular",
              "ordinal": 0,
              "pricing_type": "FIXED_PRICING",
              "price_money": {
                "amount": 250,
                "currency": "USD"
              }
            }
          },
          {
            "type": "ITEM_VARIATION",
            "id": "GZDA3JB37FYVOPI4AOEBOITI",
            "updated_at": "2017-05-10T18:48:39.798Z",
            "version": 1494442119798,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "PJMCEBHHUS3OKDB6PYUHLCPP",
              "name": "Large",
              "ordinal": 1,
              "pricing_type": "FIXED_PRICING",
              "price_money": {
                "amount": 350,
                "currency": "USD"
              }
            }
          }
        ]
      }
    },
    {
      "type": "CATEGORY",
      "id": "LYT72K3WGJFFCIMB63XARP3I",
      "updated_at": "2017-05-10T18:48:39.798Z",
      "version": 1494442119798,
      "is_deleted": false,
      "present_at_all_locations": true,
      "category_data": {
        "name": "Beverages"
      }
    },
    {
      "type": "TAX",
      "id": "XHSHLHNWSI3HVI4BW5ZUZXI3",
      "updated_at": "2017-05-10T18:48:39.798Z",
      "version": 1494442119798,
      "is_deleted": false,
      "present_at_all_locations": true,
      "tax_data": {
        "name": "Sales Tax",
        "calculation_phase": "TAX_SUBTOTAL_PHASE",
        "inclusion_type": "ADDITIVE",
        "percentage": "5.0",
        "applies_to_custom_amounts": true,
        "enabled": true
      }
    }
  ],
  "id_mappings": [
    {
      "client_object_id": "#Tea",
      "object_id": "ZSDZN34NAXDLC6D5ZQMNSOUM"
    },
    {
      "client_object_id": "#Coffee",
      "object_id": "PJMCEBHHUS3OKDB6PYUHLCPP"
    },
    {
      "client_object_id": "#Beverages",
      "object_id": "LYT72K3WGJFFCIMB63XARP3I"
    },
    {
      "client_object_id": "#SalesTax",
      "object_id": "XHSHLHNWSI3HVI4BW5ZUZXI3"
    },
    {
      "client_object_id": "#Tea_Mug",
      "object_id": "NAYHET5R52MIYCEF34ZMAHFM"
    },
    {
      "client_object_id": "#Coffee_Regular",
      "object_id": "OTYDX45SPG7LJQUVCBZI4INH"
    },
    {
      "client_object_id": "#Coffee_Large",
      "object_id": "GZDA3JB37FYVOPI4AOEBOITI"
    }
  ]
}
```

#### Break

A record of an employee's break during a shift.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object |
| `start_at` | `String` |  | RFC 3339; follows same timezone info as `Shift`. Precision up to<br>the minute is respected; seconds are truncated. |
| `end_at` | `String` | Optional | RFC 3339; follows same timezone info as `Shift`. Precision up to<br>the minute is respected; seconds are truncated. The `end_at` minute is not<br>counted when the break length is calculated. For example, a break from `00:00`<br>to `00:11`  is considered a 10 minute break (midnight to 10 minutes after midnight). |
| `break_type_id` | `String` |  | The `BreakType` this `Break` was templated on. |
| `name` | `String` |  | A human-readable name. |
| `expected_duration` | `String` |  | Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of<br>the break. |
| `is_paid` | `Boolean` |  | Whether this break counts towards time worked for compensation<br>purposes. |

##### Example (as JSON)

```json
{
  "id": null,
  "start_at": "start_at2",
  "end_at": null,
  "break_type_id": "break_type_id6",
  "name": "name0",
  "expected_duration": "expected_duration4",
  "is_paid": false
}
```

#### Break Type

A defined break template that sets an expectation for possible `Break` 
instances on a `Shift`.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object. |
| `location_id` | `String` |  | The ID of the business location this type of break applies to. |
| `break_name` | `String` |  | A human-readable name for this type of break. Will be displayed to<br>employees in Square products. |
| `expected_duration` | `String` |  | Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of<br>this break. Precision below minutes is truncated. |
| `is_paid` | `Boolean` |  | Whether this break counts towards time worked for compensation<br>purposes. |
| `version` | `Integer` | Optional | Used for resolving concurrency issues; request will fail if version<br>provided does not match server version at time of request. If a value is not<br>provided, Square's servers execute a "blind" write; potentially <br>overwriting another writer's data. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |
| `updated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |

##### Example (as JSON)

```json
{
  "id": null,
  "location_id": "location_id4",
  "break_name": "break_name8",
  "expected_duration": "expected_duration4",
  "is_paid": false,
  "version": null,
  "created_at": null,
  "updated_at": null
}
```

#### Business Hours

Represents the hours of operation for a business location.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `periods` | [`Array<Business Hours Period Hash>`](#business-hours-period) | Optional | The list of time periods during which the business is open. There may be at most 10<br>periods per day. |

##### Example (as JSON)

```json
{
  "periods": null
}
```

#### Business Hours Period

Represents a period of time during which a business location is open.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `day_of_week` | [`String (Day of Week)`](#day-of-week) | Optional | Indicates the specific day  of the week. |
| `start_local_time` | `String` | Optional | The start time of a business hours period, specified in local time using partial-time<br>RFC3339 format. |
| `end_local_time` | `String` | Optional | The end time of a business hours period, specified in local time using partial-time<br>RFC3339 format. |

##### Example (as JSON)

```json
{
  "day_of_week": null,
  "start_local_time": null,
  "end_local_time": null
}
```

#### Capture Transaction Response

Defines the fields that are included in the response body of
a request to the CaptureTransaction endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{}
```

#### Card

Represents the payment details of a card to be used for payments. These
details are determined by the `card_nonce` generated by `SqPaymentForm`.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | Unique ID for this card. Generated by Square. |
| `card_brand` | [`String (Card Brand)`](#card-brand) | Optional | Indicates a card's brand, such as `VISA` or `MASTERCARD`. |
| `last_4` | `String` | Optional | The last 4 digits of the card number. |
| `exp_month` | `Long` | Optional | The expiration month of the associated card as an integer between 1 and 12. |
| `exp_year` | `Long` | Optional | The four-digit year of the card's expiration date. |
| `cardholder_name` | `String` | Optional | The name of the cardholder. |
| `billing_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `fingerprint` | `String` | Optional | A unique, Square-assigned ID that identifies the card across multiple<br>locations and applications for a single Square account. |

##### Example (as JSON)

```json
{
  "id": null,
  "card_brand": null,
  "last_4": null,
  "exp_month": null,
  "exp_year": null,
  "cardholder_name": null,
  "billing_address": null,
  "fingerprint": null
}
```

#### Catalog Category

A category to which an [CatalogItem](#type-catalogitem) belongs in the Catalog object model.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The category's name. Searchable. This field has max length of 255 Unicode code points. |

##### Example (as JSON)

```json
{
  "object": {
    "type": "CATEGORY",
    "id": "#Beverages",
    "present_at_all_locations": true,
    "category_data": {
      "name": "Beverages"
    }
  }
}
```

#### Catalog Discount

A discount in the Catalog object model.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The discount's name. Searchable. This field has max length of 255 Unicode code points. |
| `discount_type` | [`String (Catalog Discount Type)`](#catalog-discount-type) | Optional | How to apply a [CatalogDiscount](#type-catalogdiscount) to a [CatalogItem](#type-catalogitem). |
| `percentage` | `String` | Optional | The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal<br>separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type`<br>is `VARIABLE_PERCENTAGE`.<br><br>Do not include this field for amount-based or variable discounts. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `pin_required` | `Boolean` | Optional | Indicates whether a mobile staff member needs to enter their PIN to apply the<br>discount to a payment in the Square Point of Sale app. |
| `label_color` | `String` | Optional | The color of the discount's display label in the Square Point of Sale app. This must be a valid hex color code. |

##### Example (as JSON)

```json
{
  "object": {
    "type": "DISCOUNT",
    "id": "#Maythe4th",
    "present_at_all_locations": true,
    "discount_data": {
      "name": "Welcome to the Dark(Roast) Side!",
      "discount_type": "FIXED_PERCENTAGE",
      "percentage": "5.4",
      "pin_required": false,
      "label_color": "red"
    }
  }
}
```

#### Catalog Id Mapping

A mapping between a client-supplied temporary ID and a permanent server ID.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `client_object_id` | `String` | Optional | The client-supplied, temporary `#`-prefixed ID for a new [CatalogObject](#type-catalogobject). |
| `object_id` | `String` | Optional | The permanent ID for the [CatalogObject](#type-catalogobject) created by the server. |

##### Example (as JSON)

```json
{
  "client_object_id": null,
  "object_id": null
}
```

#### Catalog Image

An image file to use in Square catalogs. Can be associated with catalog
items, item variations, and categories.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The internal name of this image. Identifies this image in calls to the<br>Connect APIs. |
| `url` | `String` | Optional | The URL of this image. Generated by Square after an image is uploaded<br>to the CreateCatalogImage endpoint. |
| `caption` | `String` | Optional | A caption that describes what is shown in the image. Displayed in the<br>Square Online Store. |

##### Example (as JSON)

```json
{
  "name": null,
  "url": null,
  "caption": null
}
```

#### Catalog Info Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `limits` | [`Catalog Info Response Limits Hash`](#catalog-info-response-limits) | Optional | - |
| `standard_unit_description_group` | [`Standard Unit Description Group Hash`](#standard-unit-description-group) | Optional | Group of standard measurement units. |

##### Example (as JSON)

```json
{
  "limits": {
    "batch_upsert_max_objects_per_batch": 1000,
    "batch_upsert_max_total_objects": 10000,
    "batch_retrieve_max_object_ids": 1000,
    "search_max_page_limit": 1000,
    "batch_delete_max_object_ids": 200,
    "update_item_taxes_max_item_ids": 1000,
    "update_item_taxes_max_taxes_to_enable": 1000,
    "update_item_taxes_max_taxes_to_disable": 1000,
    "update_item_modifier_lists_max_item_ids": 1000,
    "update_item_modifier_lists_max_modifier_lists_to_enable": 1000,
    "update_item_modifier_lists_max_modifier_lists_to_disable": 1000
  }
}
```

#### Catalog Info Response Limits

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `batch_upsert_max_objects_per_batch` | `Integer` | Optional | The maximum number of objects that may appear within a single batch in a<br>`/v2/catalog/batch-upsert` request. |
| `batch_upsert_max_total_objects` | `Integer` | Optional | The maximum number of objects that may appear across all batches in a<br>`/v2/catalog/batch-upsert` request. |
| `batch_retrieve_max_object_ids` | `Integer` | Optional | The maximum number of object IDs that may appear in a `/v2/catalog/batch-retrieve`<br>request. |
| `search_max_page_limit` | `Integer` | Optional | The maximum number of results that may be returned in a page of a<br>`/v2/catalog/search` response. |
| `batch_delete_max_object_ids` | `Integer` | Optional | The maximum number of object IDs that may be included in a single<br>`/v2/catalog/batch-delete` request. |
| `update_item_taxes_max_item_ids` | `Integer` | Optional | The maximum number of item IDs that may be included in a single<br>`/v2/catalog/update-item-taxes` request. |
| `update_item_taxes_max_taxes_to_enable` | `Integer` | Optional | The maximum number of tax IDs to be enabled that may be included in a single<br>`/v2/catalog/update-item-taxes` request. |
| `update_item_taxes_max_taxes_to_disable` | `Integer` | Optional | The maximum number of tax IDs to be disabled that may be included in a single<br>`/v2/catalog/update-item-taxes` request. |
| `update_item_modifier_lists_max_item_ids` | `Integer` | Optional | The maximum number of item IDs that may be included in a single<br>`/v2/catalog/update-item-modifier-lists` request. |
| `update_item_modifier_lists_max_modifier_lists_to_enable` | `Integer` | Optional | The maximum number of modifier list IDs to be enabled that may be included in<br>a single `/v2/catalog/update-item-modifier-lists` request. |
| `update_item_modifier_lists_max_modifier_lists_to_disable` | `Integer` | Optional | The maximum number of modifier list IDs to be disabled that may be included in<br>a single `/v2/catalog/update-item-modifier-lists` request. |

##### Example (as JSON)

```json
{
  "batch_upsert_max_objects_per_batch": null,
  "batch_upsert_max_total_objects": null,
  "batch_retrieve_max_object_ids": null,
  "search_max_page_limit": null,
  "batch_delete_max_object_ids": null,
  "update_item_taxes_max_item_ids": null,
  "update_item_taxes_max_taxes_to_enable": null,
  "update_item_taxes_max_taxes_to_disable": null,
  "update_item_modifier_lists_max_item_ids": null,
  "update_item_modifier_lists_max_modifier_lists_to_enable": null,
  "update_item_modifier_lists_max_modifier_lists_to_disable": null
}
```

#### Catalog Item

An item (i.e., product family) in the Catalog object model.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The item's name. Searchable. This field must not be empty. This field has max length of 512 Unicode code points. |
| `description` | `String` | Optional | The item's description. Searchable. This field has max length of 4096 Unicode code points. |
| `abbreviation` | `String` | Optional | The text of the item's display label in the Square Point of Sale app. Only up to the first five characters of the string are used. Searchable.<br>This field has max length of 24 Unicode code points. |
| `label_color` | `String` | Optional | The color of the item's display label in the Square Point of Sale app. This must be a valid hex color code. |
| `available_online` | `Boolean` | Optional | If `true`, the item can be added to shipping orders from the merchant's online store. |
| `available_for_pickup` | `Boolean` | Optional | If `true`, the item can be added to pickup orders from the merchant's online store. |
| `available_electronically` | `Boolean` | Optional | If `true`, the item can be added to electronically fulfilled orders from the merchant's online store. |
| `category_id` | `String` | Optional | The ID of the item's category, if any. |
| `tax_ids` | `Array<String>` | Optional | A set of IDs indicating the [CatalogTax](#type-catalogtax)es that are enabled for<br>this item. When updating an item, any taxes listed here will be added to the item.<br>[CatalogTax](#type-catalogtax)es may also be added to or deleted from an item using `UpdateItemTaxes`. |
| `modifier_list_info` | [`Array<Catalog Item Modifier List Info Hash>`](#catalog-item-modifier-list-info) | Optional | A set of [CatalogItemModifierListInfo](#type-catalogitemmodifierlistinfo) objects<br>representing the modifier lists that apply to this item, along with the overrides and min<br>and max limits that are specific to this item. [CatalogModifierList](#type-catalogmodifierlist)s<br>may also be added to or deleted from an item using `UpdateItemModifierLists`. |
| `image_url` | `String` | Optional | __Deprecated__. The URL of an image representing this item. Deprecated<br>in favor of `image_id` in [`CatalogObject`](#type-catalogobject). |
| `variations` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | A list of [CatalogObject](#type-catalogobject)s containing the<br>[CatalogItemVariation](#type-catalogitemvariation)s for this item.<br><br>Maximum: 250 item variations |
| `product_type` | [`String (Catalog Item Product Type)`](#catalog-item-product-type) | Optional | The type of a [CatalogItem](#type-catalogitem). Connect V2 only allows the creation of `REGULAR` items. |
| `skip_modifier_screen` | `Boolean` | Optional | If `false`, the Square Point of Sale app will present the [CatalogItem](#type-catalogitem)'s<br>details screen immediately, allowing the merchant to choose [CatalogModifier](#type-catalogmodifier)s<br>before adding the item to the cart.  This is the default behavior.<br><br>If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected<br>modifiers, and merchants can edit modifiers by drilling down onto the item's details.<br><br>Third-party clients are encouraged to implement similar behaviors. |

##### Example (as JSON)

```json
{
  "object": {
    "type": "ITEM",
    "id": "#Cocoa",
    "present_at_all_locations": true,
    "item_data": {
      "name": "Cocoa",
      "description": "Hot chocolate",
      "abbreviation": "Ch",
      "visibility": "PRIVATE"
    }
  }
}
```

#### Catalog Item Modifier List Info

Controls the properties of a [CatalogModifierList](#type-catalogmodifierlist) as it applies to this [CatalogItem](#type-catalogitem).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `modifier_list_id` | `String` |  | The ID of the [CatalogModifierList](#type-catalogmodifierlist) controlled by this [CatalogModifierListInfo](#type-catalogmodifierlistinfo). |
| `modifier_overrides` | [`Array<Catalog Modifier Override Hash>`](#catalog-modifier-override) | Optional | A set of [CatalogModifierOverride](#type-catalogmodifieroverride) objects that override whether a given [CatalogModifier](#type-catalogmodifier) is enabled by default. |
| `min_selected_modifiers` | `Integer` | Optional | If zero or larger, the smallest number of [CatalogModifier](#type-catalogmodifier)s that must be selected from this [CatalogModifierList](#type-catalogmodifierlist). |
| `max_selected_modifiers` | `Integer` | Optional | If zero or larger, the largest number of [CatalogModifier](#type-catalogmodifier)s that can be selected from this [CatalogModifierList](#type-catalogmodifierlist). |
| `enabled` | `Boolean` | Optional | If `true`, enable this [CatalogModifierList](#type-catalogmodifierlist). |

##### Example (as JSON)

```json
{
  "modifier_list_id": "modifier_list_id6",
  "modifier_overrides": null,
  "min_selected_modifiers": null,
  "max_selected_modifiers": null,
  "enabled": null
}
```

#### Catalog Item Variation

An item variation (i.e., product) in the Catalog object model. Each item
may have a maximum of 250 item variations.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `item_id` | `String` | Optional | The ID of the [CatalogItem](#type-catalogitem) associated with this item variation. Searchable. |
| `name` | `String` | Optional | The item variation's name. Searchable. This field has max length of 255 Unicode code points. |
| `sku` | `String` | Optional | The item variation's SKU, if any. Searchable. |
| `upc` | `String` | Optional | The item variation's UPC, if any. Searchable in the Connect API.<br>This field is only exposed in the Connect API. It is not exposed in Square's Dashboard,<br>Square Point of Sale app or Retail Point of Sale app. |
| `ordinal` | `Integer` | Optional | The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal<br>for each item variation within a parent [CatalogItem](#type-catalogitem) is set according to the item variations's<br>position. On reads, the value is not guaranteed to be sequential or unique. |
| `pricing_type` | [`String (Catalog Pricing Type)`](#catalog-pricing-type) | Optional | Indicates whether the price of a [CatalogItemVariation](#type-catalogitemvariation) should be entered manually at the time of sale. |
| `price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `location_overrides` | [`Array<Item Variation Location Overrides Hash>`](#item-variation-location-overrides) | Optional | Per-[location](#type-location) price and inventory overrides. |
| `track_inventory` | `Boolean` | Optional | If `true`, inventory tracking is active for the variation. |
| `inventory_alert_type` | [`String (Inventory Alert Type)`](#inventory-alert-type) | Optional | Indicates whether Square should alert the merchant when the inventory quantity of a [CatalogItemVariation](#type-catalogitemvariation) is low. |
| `inventory_alert_threshold` | `Long` | Optional | If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type`<br>is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.<br><br>This value is always an integer. |
| `user_data` | `String` | Optional | Arbitrary user metadata to associate with the item variation. Cannot exceed 255 characters. Searchable. |
| `service_duration` | `Long` | Optional | If the [CatalogItem](#type-catalogitem) that owns this item variation is of type<br>`APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For<br>example, a 30 minute appointment would have the value `1800000`, which is equal to<br>30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second). |
| `catalog_measurement_unit_id` | `String` | Optional | Represents the unit used to measure a<br>[CatalogItemVariation](#type-catalogitemvariation) and specifies the<br>precision for decimal quantities. |
| `measurement_unit_id` | `String` | Optional | ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity<br>sold of this item variation. If left unset, the item will be sold in<br>whole quantities. |

##### Example (as JSON)

```json
{
  "item_id": null,
  "name": null,
  "sku": null,
  "upc": null,
  "ordinal": null,
  "pricing_type": null,
  "price_money": null,
  "location_overrides": null,
  "track_inventory": null,
  "inventory_alert_type": null,
  "inventory_alert_threshold": null,
  "user_data": null,
  "service_duration": null,
  "catalog_measurement_unit_id": null,
  "measurement_unit_id": null
}
```

#### Catalog Measurement Unit

Represents the unit used to measure a
[CatalogItemVariation](#type-catalogitemvariation) and specifies the precision
for decimal quantities.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `measurement_unit` | [`Measurement Unit Hash`](#measurement-unit) | Optional | Represents a unit of measurement to use with a quantity, such as ounces<br>or inches. Exactly one of the following fields are required: `custom_unit`,<br>`area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.<br><br>The `family` field describes the type of measurement. For example,<br>ounces are in the weight family. |
| `precision` | `Integer` | Optional | Represents the maximum number of positions allowed after the decimal<br>in quantities measured with this unit. For example, if the precision is 2,<br>then an itemization’s quantity can be 0.01, 0.12, etc.<br><br>Min: 0<br><br>Max: 5<br><br>Default: 3 |

##### Example (as JSON)

```json
{
  "measurement_unit": null,
  "precision": null
}
```

#### Catalog Modifier

A modifier in the Catalog object model.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The modifier's name. Searchable. This field has max length of 255 Unicode code points. |
| `price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "object": {
    "type": "MODIFIER",
    "present_at_all_locations": true,
    "modifier_data": {
      "name": "Almond Milk",
      "price_money": {
        "amount": 250,
        "currency": "USD"
      }
    }
  }
}
```

#### Catalog Modifier List

A modifier list in the Catalog object model. A [CatalogModifierList](#type-catalogmodifierlist)
contains [Modifier](#type-catalogmodifier)s that can be applied to a [CatalogItem](#type-catalogitem)
at the time of sale.

For example, a modifier list "Condiments" that would apply to a "Hot Dog" [CatalogItem](#type-catalogitem) might
contain [CatalogModifier](#type-catalogmodifier)s "Ketchup", "Mustard", and "Relish". The
`selection_type` field specifies whether or not multiple selections from the modifier list are allowed.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The [CatalogModifierList](#type-catalogmodifierlist)'s name. Searchable. This field has max length of 255 Unicode code points. |
| `selection_type` | [`String (Catalog Modifier List Selection Type)`](#catalog-modifier-list-selection-type) | Optional | Indicates whether a [CatalogModifierList](#type-catalogmodifierlist) supports multiple selections. |
| `modifiers` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | The options included in the [CatalogModifierList](#type-catalogmodifierlist).<br>You must include at least one [CatalogModifier](#type-catalogmodifier).<br>Each [CatalogObject](#type-catalogobject) must have type `MODIFIER` and contain<br>[CatalogModifier](#type-catalogmodifier) data. |

##### Example (as JSON)

```json
{
  "type": "MODIFIER_LIST",
  "id": "#MilkType",
  "present_at_all_locations": true,
  "modifier_list_data": {
    "name": "Milk Type",
    "selection_type": "SINGLE",
    "modifiers": [
      {
        "type": "MODIFIER",
        "present_at_all_locations": true,
        "modifier_data": {
          "name": "Whole Milk",
          "price_money": {
            "amount": 0,
            "currency": "USD"
          }
        }
      },
      {
        "type": "MODIFIER",
        "present_at_all_locations": true,
        "modifier_data": {
          "name": "Almond Milk",
          "price_money": {
            "amount": 250,
            "currency": "USD"
          }
        }
      },
      {
        "type": "MODIFIER",
        "present_at_all_locations": true,
        "modifier_data": {
          "name": "Soy Milk",
          "price_money": {
            "amount": 250,
            "currency": "USD"
          }
        }
      }
    ]
  }
}
```

#### Catalog Modifier Override

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `modifier_id` | `String` |  | The ID of the [CatalogModifier](#type-catalogmodifier) whose default behavior is being overridden. |
| `on_by_default` | `Boolean` | Optional | If `true`, this [CatalogModifier](#type-catalogmodifier) should be selected by default for this [CatalogItem](#type-catalogitem). |

##### Example (as JSON)

```json
{
  "modifier_id": "modifier_id2",
  "on_by_default": null
}
```

#### Catalog Object

The wrapper object for object types in the Catalog data model. The type
of a particular `CatalogObject` is determined by the value of
`type` and only the corresponding data field may be set.

- if type = `ITEM`, only `item_data` will be populated and it will contain a valid [CatalogItem](#type-catalogitem) object.
- if type = `ITEM_VARIATION`, only `item_variation_data` will be populated and it will contain a valid [CatalogItemVariation](#type-catalogitemvariation) object.
- if type = `MODIFIER`, only `modifier_data` will be populated and it will contain a valid [CatalogModifier](#type-catalogmodifier) object.
- if type = `MODIFIER_LIST`, only `modifier_list_data` will be populated and it will contain a valid [CatalogModifierList](#type-catalogmodifierlist) object.
- if type = `CATEGORY`, only `category_data` will be populated and it will contain a valid [CatalogCategory](#type-catalogcategory) object.
- if type = `DISCOUNT`, only `discount_data` will be populated and it will contain a valid [CatalogDiscount](#type-catalogdiscount) object.
- if type = `TAX`, only `tax_data` will be populated and it will contain a valid [CatalogTax](#type-catalogtax) object.
- if type = `IMAGE`, only `image_data` will be populated and it will contain a valid [CatalogImage](#type-catalogimage) object.

For a more detailed discussion of the Catalog data model, please see the
[Catalog Overview](/products/catalog/overview).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `type` | [`String (Catalog Object Type)`](#catalog-object-type) |  | Possible kinds of [CatalogObject](#type-catalogobject)s returned from the Catalog, each<br>containing type-specific properties in the `*_data` field corresponding to the object type. |
| `id` | `String` |  | An identifier to reference this object in the catalog. When a new CatalogObject<br>is inserted, the client should set the id to a temporary identifier starting with<br>a `'#'` character. Other objects being inserted or updated within the same request<br>may use this identifier to refer to the new object.<br><br>When the server receives the new object, it will supply a unique identifier that<br>replaces the temporary identifier for all future references. |
| `updated_at` | `String` | Optional | Last modification [timestamp](#workingwithdates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"`<br>would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds. |
| `version` | `Long` | Optional | The version of the object. When updating an object, the version supplied<br>must match the version in the database, otherwise the write will be rejected as conflicting. |
| `is_deleted` | `Boolean` | Optional | If `true`, the object has been deleted from the database. Must be `false` for new objects<br>being inserted. When deleted, the `updated_at` field will equal the deletion time. |
| `catalog_v1_ids` | [`Array<Catalog V1 Id Hash>`](#catalog-v1-id) | Optional | The Connect V1 IDs for this object at each [location](#type-location) where it is present, where they<br>differ from the object's Connect V2 ID. The field will only be present for objects that<br>have been created or modified by legacy APIs. |
| `present_at_all_locations` | `Boolean` | Optional | If `true`, this object is present at all locations (including future locations), except where specified in<br>the `absent_at_location_ids` field. If `false`, this object is not present at any locations (including future locations),<br>except where specified in the `present_at_location_ids` field. If not specified, defaults to `true`. |
| `present_at_location_ids` | `Array<String>` | Optional | A list of locations where the object is present, even if `present_at_all_locations` is `false`. |
| `absent_at_location_ids` | `Array<String>` | Optional | A list of locations where the object is not present, even if `present_at_all_locations` is `true`. |
| `image_id` | `String` | Optional | Identifies the `CatalogImage` attached to this `CatalogObject`. |
| `item_data` | [`Catalog Item Hash`](#catalog-item) | Optional | An item (i.e., product family) in the Catalog object model. |
| `category_data` | [`Catalog Category Hash`](#catalog-category) | Optional | A category to which an [CatalogItem](#type-catalogitem) belongs in the Catalog object model. |
| `item_variation_data` | [`Catalog Item Variation Hash`](#catalog-item-variation) | Optional | An item variation (i.e., product) in the Catalog object model. Each item<br>may have a maximum of 250 item variations. |
| `tax_data` | [`Catalog Tax Hash`](#catalog-tax) | Optional | A tax in the Catalog object model. |
| `discount_data` | [`Catalog Discount Hash`](#catalog-discount) | Optional | A discount in the Catalog object model. |
| `modifier_list_data` | [`Catalog Modifier List Hash`](#catalog-modifier-list) | Optional | A modifier list in the Catalog object model. A [CatalogModifierList](#type-catalogmodifierlist)<br>contains [Modifier](#type-catalogmodifier)s that can be applied to a [CatalogItem](#type-catalogitem)<br>at the time of sale.<br><br>For example, a modifier list "Condiments" that would apply to a "Hot Dog" [CatalogItem](#type-catalogitem) might<br>contain [CatalogModifier](#type-catalogmodifier)s "Ketchup", "Mustard", and "Relish". The<br>`selection_type` field specifies whether or not multiple selections from the modifier list are allowed. |
| `modifier_data` | [`Catalog Modifier Hash`](#catalog-modifier) | Optional | A modifier in the Catalog object model. |
| `image_data` | [`Catalog Image Hash`](#catalog-image) | Optional | An image file to use in Square catalogs. Can be associated with catalog<br>items, item variations, and categories. |
| `measurement_unit_data` | [`Catalog Measurement Unit Hash`](#catalog-measurement-unit) | Optional | Represents the unit used to measure a<br>[CatalogItemVariation](#type-catalogitemvariation) and specifies the precision<br>for decimal quantities. |

##### Example (as JSON)

```json
{
  "type": "PRODUCT_SET",
  "id": "id0",
  "updated_at": null,
  "version": null,
  "is_deleted": null,
  "catalog_v1_ids": null,
  "present_at_all_locations": null,
  "present_at_location_ids": null,
  "absent_at_location_ids": null,
  "image_id": null,
  "item_data": null,
  "category_data": null,
  "item_variation_data": null,
  "tax_data": null,
  "discount_data": null,
  "modifier_list_data": null,
  "modifier_data": null,
  "image_data": null,
  "measurement_unit_data": null
}
```

#### Catalog Object Batch

A batch of [CatalogObject](#type-catalogobject)s.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | A list of [CatalogObject](#type-catalogobject)s belonging to this batch. |

##### Example (as JSON)

```json
{
  "objects": null
}
```

#### Catalog Pricing Rule

Defines how prices are modified or set for items that match the pricing rule
during the active time period.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | User-defined name for the pricing rule. For example, "Buy one get one<br>free" or "10% off". |
| `time_period_ids` | `Array<String>` | Optional | Unique ID for the [CatalogTimePeriod](#type-catalogtimeperiod)s when<br>this pricing rule is in effect. If left unset, the pricing rule is always<br>in effect. |
| `total_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `item_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `discount_id` | `String` | Optional | Unique ID for the [CatalogDiscount](#type-catalogdiscount) to take off<br>the price of all matched items.<br><br>Only one of `total_price_money`, `item_price`, or `discount` can be supplied. |
| `match_products_id` | `String` | Optional | Unique ID for the [CatalogProductSet](#type-catalogproductset) that will<br>be matched by this rule. A match rule matches within the entire cart. |
| `apply_products_id` | `String` | Optional | The [CatalogProductSet](#type-catalogproductset) to apply the pricing rule to<br>within the set of matched products specified by `match_products_id`.<br>An apply rule can only match once within the set of matched products.<br>If left unset, the pricing rule will be applied to all products within the<br>set of matched products. |
| `stackable` | [`String (Aggregation Strategy)`](#aggregation-strategy) | Optional | Indicates how a [CatalogPricingRule](#type-catalogpricingrule) can be<br>combined with other rules. |
| `exclude_products_id` | `String` | Optional | Identifies the [CatalogProductSet](#type-catalogproductset) to exclude<br>from this pricing rule.<br>An exclude rule matches within the subset of the cart that fits the match rules (the match set).<br>An exclude rule can only match once in the match set.<br>If not supplied, the pricing will be applied to all products in the match set.<br>Other products retain their base price, or a price generated by other rules. |
| `valid_from_date` | `String` | Optional | Represents the date the Pricing Rule is valid from. Represented in<br>RFC3339 full-date format (YYYY-MM-DD). |
| `valid_from_local_time` | `String` | Optional | Represents the local time the pricing rule should be valid from. Time<br>zone is determined by the device running the Point of Sale app.<br><br>Represented in RFC3339 partial-time format (HH:MM:SS). Partial seconds will be truncated. |
| `valid_until_date` | `String` | Optional | Represents the date the pricing rule will become inactive.<br><br>Represented in RFC3339 full-date format (YYYY-MM-DD). |
| `valid_until_local_time` | `String` | Optional | Represents the local time at which the pricing rule will become inactive.<br>Time zone is determined by the device running the Point of Sale app.<br><br>Represented in RFC3339 partial-time format<br>(HH:MM:SS). Partial seconds will be truncated. |

##### Example (as JSON)

```json
{
  "name": null,
  "time_period_ids": null,
  "total_price_money": null,
  "item_price_money": null,
  "discount_id": null,
  "match_products_id": null,
  "apply_products_id": null,
  "stackable": null,
  "exclude_products_id": null,
  "valid_from_date": null,
  "valid_from_local_time": null,
  "valid_until_date": null,
  "valid_until_local_time": null
}
```

#### Catalog Product Set

Represents a collection of catalog objects for the purpose of applying a
[PricingRule](#type-pricingrule). Including a catalog object will include all of
its subtypes. For example, including a category in a product set will include
all of its items and associated item variations in the product set. Including
an item in a product set will also include its item variations.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | User-defined name for the product set. For example, "Clearance Items"<br>or "Winter Sale Items". |
| `product_ids_any` | `Array<String>` | Optional | Unique IDs for any [CatalogObjects](#type-catalogobject)s to include in this<br>product set. Any number of these catalog objects can be in an order for a<br>pricing rule to apply.<br><br>This can be used with `product_ids_all` in a parent [CatalogProductSet](#type-catalogproductset)<br>to match groups of products for a bulk discount, such as a discount for an entree and side combo.<br><br>Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.<br><br>Max: 500 catalog object IDs. |
| `product_ids_all` | `Array<String>` | Optional | Unique IDs for [CatalogObjects](#type-catalogobject) to include in this product set.<br>All objects in this set must be included in an order for a pricing rule to apply.<br><br>Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.<br><br>Max: 500 catalog object IDs. |
| `quantity_exact` | `Long` | Optional | If set, there must be exactly this many items from `products_any` or `products_all`<br>in the cart for the discount to apply.<br><br>Cannot be combined with either `quantity_min` or `quantity_max`. |
| `quantity_min` | `Long` | Optional | If set, there must be at least this many items from `products_any` or `products_all`<br>in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if<br>`quantity_exact`, `quantity_min` and<br>`quantity_max` are all unspecified. |
| `quantity_max` | `Long` | Optional | If set, the pricing rule will apply to a maximum of this many items from<br>`products_any` or `products_all`. |
| `all_products` | `Boolean` | Optional | If set to `true`, the product set will include every item in the catalog.<br><br>Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set. |

##### Example (as JSON)

```json
{
  "name": null,
  "product_ids_any": null,
  "product_ids_all": null,
  "quantity_exact": null,
  "quantity_min": null,
  "quantity_max": null,
  "all_products": null
}
```

#### Catalog Query

A query to be applied to a [SearchCatalogObjectsRequest](#type-searchcatalogobjectsrequest).
Only one query field may be present.

Where an attribute name is required, it should be specified as the name of any field
marked "searchable" from the structured data types for the desired result object type(s)
([CatalogItem](#type-catalogitem), [CatalogItemVariation](#type-catalogitemvariation),
[CatalogCategory](#type-catalogcategory), [CatalogTax](#type-catalogtax),
[CatalogDiscount](#type-catalogdiscount), [CatalogModifierList](#type-catalogmodifierlist),
[CatalogModifier](#type-catalogmodifier)).

For example, a query that should return Items may specify attribute names from
any of the searchable fields of the [CatalogItem](#type-catalogitem) data type, namely
`"name"`, `"description"`, and `"abbreviation"`.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `sorted_attribute_query` | [`Catalog Query Sorted Attribute Hash`](#catalog-query-sorted-attribute) | Optional | - |
| `exact_query` | [`Catalog Query Exact Hash`](#catalog-query-exact) | Optional | - |
| `prefix_query` | [`Catalog Query Prefix Hash`](#catalog-query-prefix) | Optional | - |
| `range_query` | [`Catalog Query Range Hash`](#catalog-query-range) | Optional | - |
| `text_query` | [`Catalog Query Text Hash`](#catalog-query-text) | Optional | - |
| `items_for_tax_query` | [`Catalog Query Items for Tax Hash`](#catalog-query-items-for-tax) | Optional | - |
| `items_for_modifier_list_query` | [`Catalog Query Items for Modifier List Hash`](#catalog-query-items-for-modifier-list) | Optional | - |

##### Example (as JSON)

```json
{
  "sorted_attribute_query": null,
  "exact_query": null,
  "prefix_query": null,
  "range_query": null,
  "text_query": null,
  "items_for_tax_query": null,
  "items_for_modifier_list_query": null
}
```

#### Catalog Query Exact

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `attribute_name` | `String` | The name of the attribute to be searched. |
| `attribute_value` | `String` | The desired value of the search attribute. |

##### Example (as JSON)

```json
{
  "attribute_name": "attribute_name4",
  "attribute_value": "attribute_value6"
}
```

#### Catalog Query Items for Modifier List

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `modifier_list_ids` | `Array<String>` | A set of [CatalogModifierList](#type-catalogmodifierlist) IDs to be used to find associated [CatalogItem](#type-catalogitem)s. |

##### Example (as JSON)

```json
{
  "modifier_list_ids": [
    "modifier_list_ids0"
  ]
}
```

#### Catalog Query Items for Tax

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `tax_ids` | `Array<String>` | A set of [CatalogTax](#type-catalogtax) IDs to be used to find associated [CatalogItem](#type-catalogitem)s. |

##### Example (as JSON)

```json
{
  "tax_ids": [
    "tax_ids7"
  ]
}
```

#### Catalog Query Prefix

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `attribute_name` | `String` | The name of the attribute to be searched. |
| `attribute_prefix` | `String` | The desired prefix of the search attribute value. |

##### Example (as JSON)

```json
{
  "attribute_name": "attribute_name4",
  "attribute_prefix": "attribute_prefix0"
}
```

#### Catalog Query Range

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `attribute_name` | `String` |  | The name of the attribute to be searched. |
| `attribute_min_value` | `Long` | Optional | The desired minimum value for the search attribute (inclusive). |
| `attribute_max_value` | `Long` | Optional | The desired maximum value for the search attribute (inclusive). |

##### Example (as JSON)

```json
{
  "attribute_name": "attribute_name4",
  "attribute_min_value": null,
  "attribute_max_value": null
}
```

#### Catalog Query Sorted Attribute

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `attribute_name` | `String` |  | The attribute whose value should be used as the sort key. |
| `initial_attribute_value` | `String` | Optional | The first attribute value to be returned by the query. Ascending sorts will return only<br>objects with this value or greater, while descending sorts will return only objects with this value<br>or less. If unset, start at the beginning (for ascending sorts) or end (for descending sorts). |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |

##### Example (as JSON)

```json
{
  "attribute_name": "attribute_name4",
  "initial_attribute_value": null,
  "sort_order": null
}
```

#### Catalog Query Text

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `keywords` | `Array<String>` | A list of one, two, or three search keywords. Keywords with fewer than three characters<br>are ignored. |

##### Example (as JSON)

```json
{
  "keywords": [
    "keywords3",
    "keywords4"
  ]
}
```

#### Catalog Tax

A tax in the Catalog object model.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The tax's name. Searchable. This field has max length of 255 Unicode code points. |
| `calculation_phase` | [`String (Tax Calculation Phase)`](#tax-calculation-phase) | Optional | When to calculate the taxes due on a cart. |
| `inclusion_type` | [`String (Tax Inclusion Type)`](#tax-inclusion-type) | Optional | Whether to the tax amount should be additional to or included in to the [CatalogItem](#type-catalogitem) price. |
| `percentage` | `String` | Optional | The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign.<br>A value of `7.5` corresponds to 7.5%. |
| `applies_to_custom_amounts` | `Boolean` | Optional | If `true`, the fee applies to custom amounts entered into the Square Point of Sale<br>app that are not associated with a particular [CatalogItem](#type-catalogitem). |
| `enabled` | `Boolean` | Optional | If `true`, the tax will be shown as enabled in the Square Point of Sale app. |

##### Example (as JSON)

```json
{
  "object": {
    "type": "TAX",
    "id": "#SalesTax",
    "present_at_all_locations": true,
    "tax_data": {
      "name": "Sales Tax",
      "calculation_phase": "TAX_SUBTOTAL_PHASE",
      "inclusion_type": "ADDITIVE",
      "percentage": "5.0",
      "fee_applies_to_custom_amounts": true,
      "enabled": true
    }
  }
}
```

#### Catalog Time Period

Represents a time period - either a single period or a repeating period.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event` | `String` | Optional | An iCalendar (RFC5545) [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which<br>specifies the name, timing, duration and recurrence of this time period.<br><br>Example:<br><br>```<br>DTSTART:20190707T180000<br>DURATION:P2H<br>RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR<br>```<br><br>Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported.<br>`DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT`<br>and `END:VEVENT` is not required in the request. The response will always<br>include them. |

##### Example (as JSON)

```json
{
  "event": null
}
```

#### Catalog V1 Id

An Items Connect V1 object ID along with its associated [location](#type-location) ID.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_v1_id` | `String` | Optional | The ID for an object in Connect V1, if different from its Connect V2 ID. |
| `location_id` | `String` | Optional | The ID of the [location](#type-location) this Connect V1 ID is associated with. |

##### Example (as JSON)

```json
{
  "catalog_v1_id": null,
  "location_id": null
}
```

#### Charge Request

Defines the parameters that can be included in the body of
a request to the Charge endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` |  | A value you specify that uniquely identifies this<br>transaction among transactions you've created.<br><br>If you're unsure whether a particular transaction succeeded,<br>you can reattempt it with the same idempotency key without<br>worrying about double-charging the buyer.<br><br>See [Idempotency](/basics/api101/idempotency) for more information. |
| `amount_money` | [`Money Hash`](#money) |  | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `card_nonce` | `String` | Optional | A nonce generated from the `SqPaymentForm` that represents the card<br>to charge.<br><br>The application that provides a nonce to this endpoint must be the<br>_same application_ that generated the nonce with the `SqPaymentForm`.<br>Otherwise, the nonce is invalid.<br><br>Do not provide a value for this field if you provide a value for<br>`customer_card_id`. |
| `customer_card_id` | `String` | Optional | The ID of the customer card on file to charge. Do<br>not provide a value for this field if you provide a value for `card_nonce`.<br><br>If you provide this value, you _must_ also provide a value for<br>`customer_id`. |
| `delay_capture` | `Boolean` | Optional | If `true`, the request will only perform an Auth on the provided<br>card. You can then later perform either a Capture (with the<br>[CaptureTransaction](#endpoint-capturetransaction) endpoint) or a Void<br>(with the [VoidTransaction](#endpoint-voidtransaction) endpoint).<br><br>Default value: `false` |
| `reference_id` | `String` | Optional | An optional ID you can associate with the transaction for your own<br>purposes (such as to associate the transaction with an entity ID in your<br>own database).<br><br>This value cannot exceed 40 characters. |
| `note` | `String` | Optional | An optional note to associate with the transaction.<br><br>This value cannot exceed 60 characters. |
| `customer_id` | `String` | Optional | The ID of the customer to associate this transaction with. This field<br>is required if you provide a value for `customer_card_id`, and optional<br>otherwise. |
| `billing_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `shipping_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `buyer_email_address` | `String` | Optional | The buyer's email address, if available. |
| `order_id` | `String` | Optional | The ID of the order to associate with this transaction.<br><br>If you provide this value, the `amount_money` value of your request must<br>__exactly match__ the value of the order's `total_money` field. |
| `additional_recipients` | [`Array<Additional Recipient Hash>`](#additional-recipient) | Optional | The basic primitive of multi-party transaction. The value is optional.<br>The transaction facilitated by you can be split from here.<br><br>If you provide this value, the `amount_money` value in your additional_recipients<br>must not be more than 90% of the `amount_money` value in the charge request.<br>The `location_id` must be the valid location of the app owner merchant.<br><br>This field requires the `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.<br><br>This field is currently not supported in sandbox. |

##### Example (as JSON)

```json
{
  "idempotency_key": "idempotency_key6",
  "amount_money": {
    "amount": null,
    "currency": null
  },
  "card_nonce": null,
  "customer_card_id": null,
  "delay_capture": null,
  "reference_id": null,
  "note": null,
  "customer_id": null,
  "billing_address": null,
  "shipping_address": null,
  "buyer_email_address": null,
  "order_id": null,
  "additional_recipients": null
}
```

#### Charge Request Additional Recipient

Represents an additional recipient (other than the merchant) entitled to a portion of the tender.
Support is currently limited to USD, CAD and GBP currencies

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `location_id` | `String` | The location ID for a recipient (other than the merchant) receiving a portion of the tender. |
| `description` | `String` | The description of the additional recipient. |
| `amount_money` | [`Money Hash`](#money) | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "location_id": "location_id4",
  "description": "description0",
  "amount_money": {
    "amount": null,
    "currency": null
  }
}
```

#### Charge Response

Defines the fields that are included in the response body of
a request to the Charge endpoint.

One of `errors` or `transaction` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `transaction` | [`Transaction Hash`](#transaction) | Optional | Represents a transaction processed with Square, either with the<br>Connect API or with Square Point of Sale.<br><br>The `tenders` field of this object lists all methods of payment used to pay in<br>the transaction. |

##### Example (as JSON)

```json
{
  "transaction": {
    "id": "KnL67ZIwXCPtzOrqj0HrkxMF",
    "location_id": "18YC4JDH91E1H",
    "created_at": "2016-03-10T22:57:56Z",
    "tenders": [
      {
        "id": "MtZRYYdDrYNQbOvV7nbuBvMF",
        "location_id": "18YC4JDH91E1H",
        "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
        "created_at": "2016-03-10T22:57:56Z",
        "note": "some optional note",
        "amount_money": {
          "amount": 200,
          "currency": "USD"
        },
        "additional_recipients": [
          {
            "location_id": "057P5VYJ4A5X1",
            "description": "Application fees",
            "amount_money": {
              "amount": 20,
              "currency": "USD"
            },
            "receivable_id": "ISu5xwxJ5v0CMJTQq7RvqyMF"
          }
        ],
        "type": "CARD",
        "card_details": {
          "status": "CAPTURED",
          "card": {
            "card_brand": "VISA",
            "last_4": "1111"
          },
          "entry_method": "KEYED"
        }
      }
    ],
    "reference_id": "some optional reference id",
    "product": "EXTERNAL_API"
  }
}
```

#### Checkout

Square Checkout lets merchants accept online payments for supported
payment types using a checkout workflow hosted on squareup.com.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | ID generated by Square Checkout when a new checkout is requested. |
| `checkout_page_url` | `String` | Optional | The URL that the buyer's browser should be redirected to after the<br>checkout is completed. |
| `ask_for_shipping_address` | `Boolean` | Optional | If `true`, Square Checkout will collect shipping information on your<br>behalf and store that information with the transaction information in your<br>Square Dashboard.<br><br>Default: `false`. |
| `merchant_support_email` | `String` | Optional | The email address to display on the Square Checkout confirmation page<br>and confirmation email that the buyer can use to contact the merchant.<br><br>If this value is not set, the confirmation page and email will display the<br>primary email address associated with the merchant's Square account.<br><br>Default: none; only exists if explicitly set. |
| `pre_populate_buyer_email` | `String` | Optional | If provided, the buyer's email is pre-populated on the checkout page<br>as an editable text field.<br><br>Default: none; only exists if explicitly set. |
| `pre_populate_shipping_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `redirect_url` | `String` | Optional | The URL to redirect to after checkout is completed with `checkoutId`,<br>Square's `orderId`, `transactionId`, and `referenceId` appended as URL<br>parameters. For example, if the provided redirect_url is<br>`http://www.example.com/order-complete`, a successful transaction redirects<br>the customer to:<br><br>`http://www.example.com/order-complete?checkoutId=xxxxxx&orderId=xxxxxx&referenceId=xxxxxx&transactionId=xxxxxx`<br><br>If you do not provide a redirect URL, Square Checkout will display an order<br>confirmation page on your behalf; however Square strongly recommends that<br>you provide a redirect URL so you can verify the transaction results and<br>finalize the order through your existing/normal confirmation workflow. |
| `order` | [`Order Hash`](#order) | Optional | Contains all information related to a single order to process with Square,<br>including line items that specify the products to purchase. Order objects also<br>include information on any associated tenders, refunds, and returns.<br><br>All Connect V2 Transactions have all been converted to Orders including all associated<br>itemization data. |
| `created_at` | `String` | Optional | The time when the checkout was created, in RFC 3339 format. |
| `additional_recipients` | [`Array<Additional Recipient Hash>`](#additional-recipient) | Optional | Additional recipients (other than the merchant) receiving a portion of this checkout.<br>For example, fees assessed on the purchase by a third party integration. |

##### Example (as JSON)

```json
{
  "id": null,
  "checkout_page_url": null,
  "ask_for_shipping_address": null,
  "merchant_support_email": null,
  "pre_populate_buyer_email": null,
  "pre_populate_shipping_address": null,
  "redirect_url": null,
  "order": null,
  "created_at": null,
  "additional_recipients": null
}
```

#### Coordinates

Latitude and longitude coordinates.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `latitude` | `Float` | Optional | The coordinate's latitude expressed in degrees. |
| `longitude` | `Float` | Optional | The coordinate's longitude expressed in degrees. |

##### Example (as JSON)

```json
{
  "latitude": null,
  "longitude": null
}
```

#### Create Break Type Request

A request to create a new `BreakType`

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` | Optional | Unique string value to insure idempotency of the operation |
| `break_type` | [`Break Type Hash`](#break-type) |  | A defined break template that sets an expectation for possible `Break` <br>instances on a `Shift`. |

##### Example (as JSON)

```json
{
  "idempotency_key": null,
  "break_type": {
    "id": null,
    "location_id": "location_id2",
    "break_name": "break_name0",
    "expected_duration": "expected_duration6",
    "is_paid": false,
    "version": null,
    "created_at": null,
    "updated_at": null
  }
}
```

#### Create Break Type Response

The response to the request to create a `BreakType`. Contains
the created `BreakType` object. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `break_type` | [`Break Type Hash`](#break-type) | Optional | A defined break template that sets an expectation for possible `Break` <br>instances on a `Shift`. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "break_type": {
    "id": "49SSVDJG76WF3",
    "location_id": "CGJN03P1D08GF",
    "break_name": "Lunch Break",
    "expected_duration": "PT30M",
    "is_paid": true,
    "version": 1,
    "created_at": "2019-02-26T22:42:54Z",
    "updated_at": "2019-02-26T22:42:54Z"
  }
}
```

#### Create Checkout Request

Defines the parameters that can be included in the body of
a request to the CreateCheckout endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` |  | A unique string that identifies this checkout among others<br>you've created. It can be any valid string but must be unique for every<br>order sent to Square Checkout for a given location ID.<br><br>The idempotency key is used to avoid processing the same order more than<br>once. If you're unsure whether a particular checkout was created<br>successfully, you can reattempt it with the same idempotency key and all the<br>same other parameters without worrying about creating duplicates.<br><br>We recommend using a random number/string generator native to the language<br>you are working in to generate strings for your idempotency keys.<br><br>See [Idempotency](/basics/api101/idempotency) for more information. |
| `order` | [`Create Order Request Hash`](#create-order-request) |  | - |
| `ask_for_shipping_address` | `Boolean` | Optional | If `true`, Square Checkout will collect shipping information on your<br>behalf and store that information with the transaction information in your<br>Square Dashboard.<br><br>Default: `false`. |
| `merchant_support_email` | `String` | Optional | The email address to display on the Square Checkout confirmation page<br>and confirmation email that the buyer can use to contact the merchant.<br><br>If this value is not set, the confirmation page and email will display the<br>primary email address associated with the merchant's Square account.<br><br>Default: none; only exists if explicitly set. |
| `pre_populate_buyer_email` | `String` | Optional | If provided, the buyer's email is pre-populated on the checkout page<br>as an editable text field.<br><br>Default: none; only exists if explicitly set. |
| `pre_populate_shipping_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `redirect_url` | `String` | Optional | The URL to redirect to after checkout is completed with `checkoutId`,<br>Square's `orderId`, `transactionId`, and `referenceId` appended as URL<br>parameters. For example, if the provided redirect_url is<br>`http://www.example.com/order-complete`, a successful transaction redirects<br>the customer to:<br><br>`http://www.example.com/order-complete?checkoutId=xxxxxx&orderId=xxxxxx&referenceId=xxxxxx&transactionId=xxxxxx`<br><br>If you do not provide a redirect URL, Square Checkout will display an order<br>confirmation page on your behalf; however Square strongly recommends that<br>you provide a redirect URL so you can verify the transaction results and<br>finalize the order through your existing/normal confirmation workflow.<br><br>Default: none; only exists if explicitly set. |
| `additional_recipients` | [`Array<Charge Request Additional Recipient Hash>`](#charge-request-additional-recipient) | Optional | The basic primitive of multi-party transaction. The value is optional.<br>The transaction facilitated by you can be split from here.<br><br>If you provide this value, the `amount_money` value in your additional_recipients<br>must not be more than 90% of the `total_money` calculated by Square for your order.<br>The `location_id` must be the valid location of the app owner merchant.<br><br>This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.<br><br>This field is currently not supported in sandbox. |
| `note` | `String` | Optional | An optional note to associate with the checkout object.<br><br>This value cannot exceed 60 characters. |

##### Example (as JSON)

```json
{
  "idempotency_key": null,
  "order": {
    "request_body": {
      "idempotency_key": "8193148c-9586-11e6-99f9-28cfe92138cf",
      "order": {
        "reference_id": "my-order-001",
        "line_items": [
          {
            "name": "New York Strip Steak",
            "quantity": "1",
            "base_price_money": {
              "amount": 1599,
              "currency": "USD"
            }
          },
          {
            "quantity": "2",
            "catalog_object_id": "BEMYCSMIJL46OCDV4KYIKXIB",
            "modifiers": [
              {
                "catalog_object_id": "CHQX7Y4KY6N5KINJKZCFURPZ"
              }
            ],
            "discounts": [
              {
                "name": "Sale - $1.00 off",
                "amount_money": {
                  "amount": 100,
                  "currency": "USD"
                }
              }
            ]
          }
        ],
        "taxes": [
          {
            "name": "State Sales Tax",
            "percentage": "9"
          }
        ],
        "discounts": [
          {
            "name": "Labor Day Sale",
            "percentage": "5"
          },
          {
            "catalog_object_id": "DB7L55ZH2BGWI4H23ULIWOQ7"
          }
        ]
      }
    }
  }
}
```

#### Create Checkout Response

Defines the fields that are included in the response body of
a request to the CreateCheckout endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `checkout` | [`Checkout Hash`](#checkout-1) | Optional | Square Checkout lets merchants accept online payments for supported<br>payment types using a checkout workflow hosted on squareup.com. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "checkout": {
    "id": "CAISEHGimXh-C3RIT4og1a6u1qw",
    "checkout_page_url": "https://connect.squareup.com/v2/checkout?c=CAISEHGimXh-C3RIT4og1a6u1qw&l=CYTKRM7R7JMV8",
    "ask_for_shipping_address": true,
    "merchant_support_email": "merchant+support@website.com",
    "pre_populate_buyer_email": "example@email.com",
    "pre_populate_shipping_address": {
      "address_line_1": "1455 Market St.",
      "address_line_2": "Suite 600",
      "locality": "San Francisco",
      "administrative_district_level_1": "CA",
      "postal_code": "94103",
      "country": "US",
      "first_name": "Jane",
      "last_name": "Doe"
    },
    "redirect_url": "https://merchant.website.com/order-confirm",
    "order": {
      "location_id": "CYTKRM7R7JMV8",
      "reference_id": "reference_id",
      "line_items": [
        {
          "name": "Printed T Shirt",
          "quantity": "2",
          "taxes": [
            {
              "name": "Sales Tax",
              "type": "ADDITIVE",
              "percentage": "8.5",
              "applied_money": {
                "amount": 103,
                "currency": "USD"
              }
            }
          ],
          "discounts": [
            {
              "name": "7% off previous season item",
              "type": "FIXED_PERCENTAGE",
              "percentage": "7",
              "applied_money": {
                "amount": 210,
                "currency": "USD"
              },
              "scope": "LINE_ITEM"
            },
            {
              "name": "Father's day 12% OFF",
              "type": "FIXED_PERCENTAGE",
              "percentage": "12",
              "applied_money": {
                "amount": 335,
                "currency": "USD"
              },
              "scope": "ORDER"
            },
            {
              "name": "$3 off Customer Discount",
              "type": "FIXED_AMOUNT",
              "amount_money": {
                "amount": 300,
                "currency": "USD"
              },
              "applied_money": {
                "amount": 300,
                "currency": "USD"
              },
              "scope": "LINE_ITEM"
            },
            {
              "name": "Global Sales $55 OFF",
              "type": "FIXED_AMOUNT",
              "amount_money": {
                "amount": 5500,
                "currency": "USD"
              },
              "applied_money": {
                "amount": 949,
                "currency": "USD"
              },
              "scope": "ORDER"
            }
          ],
          "base_price_money": {
            "amount": 1500,
            "currency": "USD"
          },
          "total_tax_money": {
            "amount": 103,
            "currency": "USD"
          },
          "total_discount_money": {
            "amount": 1794,
            "currency": "USD"
          },
          "total_money": {
            "amount": 1309,
            "currency": "USD"
          }
        },
        {
          "name": "Slim Jeans",
          "quantity": "1",
          "taxes": [
            {
              "name": "Sales Tax",
              "type": "ADDITIVE",
              "percentage": "8.5",
              "applied_money": {
                "amount": 105,
                "currency": "USD"
              }
            }
          ],
          "discounts": [
            {
              "name": "Father's day 12% OFF",
              "type": "FIXED_PERCENTAGE",
              "percentage": "12",
              "applied_money": {
                "amount": 300,
                "currency": "USD"
              },
              "scope": "ORDER"
            },
            {
              "name": "Global Sales $55 OFF",
              "type": "FIXED_AMOUNT",
              "amount_money": {
                "amount": 5500,
                "currency": "USD"
              },
              "applied_money": {
                "amount": 968,
                "currency": "USD"
              },
              "scope": "ORDER"
            }
          ],
          "base_price_money": {
            "amount": 2500,
            "currency": "USD"
          },
          "total_tax_money": {
            "amount": 105,
            "currency": "USD"
          },
          "total_discount_money": {
            "amount": 1268,
            "currency": "USD"
          },
          "total_money": {
            "amount": 1337,
            "currency": "USD"
          }
        },
        {
          "name": "Wooven Sweater",
          "quantity": "3",
          "taxes": [
            {
              "name": "Fair Trade Tax",
              "type": "ADDITIVE",
              "percentage": "5",
              "applied_money": {
                "amount": 228,
                "currency": "USD"
              }
            },
            {
              "name": "Sales Tax",
              "type": "ADDITIVE",
              "percentage": "8.5",
              "applied_money": {
                "amount": 387,
                "currency": "USD"
              }
            }
          ],
          "discounts": [
            {
              "name": "Father's day 12% OFF",
              "type": "FIXED_PERCENTAGE",
              "percentage": "12",
              "applied_money": {
                "amount": 1260,
                "currency": "USD"
              },
              "scope": "ORDER"
            },
            {
              "name": "$11 off Customer Discount",
              "type": "FIXED_AMOUNT",
              "amount_money": {
                "amount": 1100,
                "currency": "USD"
              },
              "applied_money": {
                "amount": 1100,
                "currency": "USD"
              },
              "scope": "LINE_ITEM"
            },
            {
              "name": "Global Sales $55 OFF",
              "type": "FIXED_AMOUNT",
              "amount_money": {
                "amount": 5500,
                "currency": "USD"
              },
              "applied_money": {
                "amount": 3583,
                "currency": "USD"
              },
              "scope": "ORDER"
            }
          ],
          "base_price_money": {
            "amount": 3500,
            "currency": "USD"
          },
          "total_tax_money": {
            "amount": 615,
            "currency": "USD"
          },
          "total_discount_money": {
            "amount": 5943,
            "currency": "USD"
          },
          "total_money": {
            "amount": 5172,
            "currency": "USD"
          }
        }
      ],
      "total_money": {
        "amount": 7818,
        "currency": "USD"
      },
      "total_tax_money": {
        "amount": 823,
        "currency": "USD"
      },
      "total_discount_money": {
        "amount": 9005,
        "currency": "USD"
      }
    },
    "created_at": "2017-06-16T22:25:35Z",
    "additional_recipients": [
      {
        "location_id": "057P5VYJ4A5X1",
        "description": "Application fees",
        "amount_money": {
          "amount": 60,
          "currency": "USD"
        }
      }
    ]
  }
}
```

#### Create Customer Card Request

Defines the fields that are included in the request body of a request
to the CreateCustomerCard endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `card_nonce` | `String` |  | A card nonce representing the credit card to link to the customer.<br><br>Card nonces are generated by the `SqPaymentForm` that buyers enter<br>their card information into. See<br>[Embedding the payment form](/payments/sqpaymentform/overview) for<br>more information.<br><br>__Note:__ Card nonces generated by digital wallets (e.g., Apple Pay)<br>cannot be used to create a customer card. |
| `billing_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `cardholder_name` | `String` | Optional | The cardholder's name. |

##### Example (as JSON)

```json
{
  "card_nonce": "card_nonce0",
  "billing_address": null,
  "cardholder_name": null
}
```

#### Create Customer Card Response

Defines the fields that are included in the response body of
a request to the CreateCustomerCard endpoint.

One of `errors` or `card` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `card` | [`Card Hash`](#card) | Optional | Represents the payment details of a card to be used for payments. These<br>details are determined by the `card_nonce` generated by `SqPaymentForm`. |

##### Example (as JSON)

```json
{
  "card": {
    "id": "icard-card_id",
    "card_brand": "VISA",
    "last_4": "1111",
    "exp_month": 11,
    "exp_year": 2018,
    "cardholder_name": "Amelia Earhart",
    "billing_address": {
      "address_line_1": "500 Electric Ave",
      "address_line_2": "Suite 600",
      "locality": "New York",
      "administrative_district_level_1": "NY",
      "postal_code": "10003",
      "country": "US"
    }
  }
}
```

#### Create Customer Request

Defines the body parameters that can be provided in a request to the
CreateCustomer endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` | Optional | The idempotency key for the request.	See the [Idempotency](/basics/api101/idempotency)<br>guide for more information. |
| `given_name` | `String` | Optional | The customer's given (i.e., first) name. |
| `family_name` | `String` | Optional | The customer's family (i.e., last) name. |
| `company_name` | `String` | Optional | The name of the customer's company. |
| `nickname` | `String` | Optional | A nickname for the customer. |
| `email_address` | `String` | Optional | The customer's email address. |
| `address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `phone_number` | `String` | Optional | The customer's phone number. |
| `reference_id` | `String` | Optional | An optional second ID you can set to associate the customer with an<br>entity in another system. |
| `note` | `String` | Optional | An optional note to associate with the customer. |
| `birthday` | `String` | Optional | The customer birthday in RFC-3339 format. Year is optional,<br>timezone and times are not allowed. Example: `0000-09-01T00:00:00-00:00`<br>for a birthday on September 1st. `1998-09-01T00:00:00-00:00` for a birthday<br>on September 1st 1998. |

##### Example (as JSON)

```json
{
  "request_body": {
    "given_name": "Amelia",
    "family_name": "Earhart",
    "email_address": "Amelia.Earhart@example.com",
    "address": {
      "address_line_1": "500 Electric Ave",
      "address_line_2": "Suite 600",
      "locality": "New York",
      "administrative_district_level_1": "NY",
      "postal_code": "10003",
      "country": "US"
    },
    "phone_number": "1-212-555-4240",
    "reference_id": "YOUR_REFERENCE_ID",
    "note": "a customer"
  }
}
```

#### Create Customer Response

Defines the fields that are included in the response body of
a request to the CreateCustomer endpoint.

One of `errors` or `customer` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `customer` | [`Customer Hash`](#customer) | Optional | Represents one of a business's customers, which can have one or more<br>cards on file associated with it. |

##### Example (as JSON)

```json
{
  "customer": {
    "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
    "created_at": "2016-03-23T20:21:54.859Z",
    "updated_at": "2016-03-23T20:21:54.859Z",
    "given_name": "Amelia",
    "family_name": "Earhart",
    "email_address": "Amelia.Earhart@example.com",
    "address": {
      "address_line_1": "500 Electric Ave",
      "address_line_2": "Suite 600",
      "locality": "New York",
      "administrative_district_level_1": "NY",
      "postal_code": "10003",
      "country": "US"
    },
    "phone_number": "1-212-555-4240",
    "reference_id": "YOUR_REFERENCE_ID",
    "note": "a customer"
  }
}
```

#### Create Mobile Authorization Code Request

Defines the body parameters that can be provided in a request to the
CreateMobileAuthorizationCode endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | The Square location ID the authorization code should be tied to. |

##### Example (as JSON)

```json
{
  "request_url": "/mobile/authorization-code",
  "request_body": {
    "location_id": "YOUR_LOCATION_ID"
  }
}
```

#### Create Mobile Authorization Code Response

Defines the fields that are included in the response body of
a request to the CreateMobileAuthorizationCode endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `authorization_code` | `String` | Optional | Generated authorization code that connects a mobile application instance to a Square account. |
| `expires_at` | `String` | Optional | The timestamp when `authorization_code` expires in [RFC 3339](https://tools.ietf.org/html/rfc3339) format, e.g., "2016-09-04T23:59:33.123Z". |
| `error` | [`Error Hash`](#error) | Optional | Represents an error encountered during a request to the Connect API. |

##### Example (as JSON)

```json
{
  "authorization_code": "YOUR_MOBILE_AUTHZ_CODE",
  "expires_at": "2019-01-10T19:42:08Z"
}
```

#### Create Order Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`Order Hash`](#order) | Optional | Contains all information related to a single order to process with Square,<br>including line items that specify the products to purchase. Order objects also<br>include information on any associated tenders, refunds, and returns.<br><br>All Connect V2 Transactions have all been converted to Orders including all associated<br>itemization data. |
| `idempotency_key` | `String` | Optional | A value you specify that uniquely identifies this<br>order among orders you've created.<br><br>If you're unsure whether a particular order was created successfully,<br>you can reattempt it with the same idempotency key without<br>worrying about creating duplicate orders.<br><br>See [Idempotency](/basics/api101/idempotency) for more information. |
| `reference_id` | `String` | Optional | __Deprecated__: Please set the reference_id on the nested [order](#type-order) field<br>instead.<br><br>An optional ID you can associate with the order for your own<br>purposes (such as to associate the order with an entity ID in your<br>own database).<br><br>This value cannot exceed 40 characters. |
| `line_items` | [`Array<Create Order Request Line Item Hash>`](#create-order-request-line-item) | Optional | __Deprecated__: Please set the line_items on the nested [order](#type-order) field<br>instead.<br><br>The line items to associate with this order.<br><br>Each line item represents a different product to include in a purchase. |
| `taxes` | [`Array<Create Order Request Tax Hash>`](#create-order-request-tax) | Optional | __Deprecated__: Please set the taxes on the nested [order](#type-order) field instead.<br><br>The taxes to include on the order. |
| `discounts` | [`Array<Create Order Request Discount Hash>`](#create-order-request-discount) | Optional | __Deprecated__: Please set the discounts on the nested [order](#type-order) field instead.<br><br>The discounts to include on the order. |

##### Example (as JSON)

```json
{
  "request_body": {
    "idempotency_key": "8193148c-9586-11e6-99f9-28cfe92138cf",
    "order": {
      "reference_id": "my-order-001",
      "line_items": [
        {
          "name": "New York Strip Steak",
          "quantity": "1",
          "base_price_money": {
            "amount": 1599,
            "currency": "USD"
          }
        },
        {
          "quantity": "2",
          "catalog_object_id": "BEMYCSMIJL46OCDV4KYIKXIB",
          "modifiers": [
            {
              "catalog_object_id": "CHQX7Y4KY6N5KINJKZCFURPZ"
            }
          ],
          "discounts": [
            {
              "name": "Sale - $1.00 off",
              "amount_money": {
                "amount": 100,
                "currency": "USD"
              }
            }
          ]
        }
      ],
      "taxes": [
        {
          "name": "State Sales Tax",
          "percentage": "9"
        }
      ],
      "discounts": [
        {
          "name": "Labor Day Sale",
          "percentage": "5"
        },
        {
          "catalog_object_id": "DB7L55ZH2BGWI4H23ULIWOQ7"
        }
      ]
    }
  }
}
```

#### Create Order Request Discount

__Deprecated__: Please use the [OrderLineItemDiscount](#type-orderlineitemdiscount) type
in the order field of [CreateOrderRequest](#type-createorderrequest) instead.

Represents a discount that can apply to either a single line item or an entire order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_id` | `String` | Optional | Only used for catalog discounts.<br>The catalog object ID for an existing [CatalogDiscount](#type-catalogdiscount).<br><br>Do not provide a value for this field if you provide values in other fields for an ad hoc discount. |
| `name` | `String` | Optional | Only used for ad hoc discounts. The discount's name. |
| `percentage` | `String` | Optional | Only used for ad hoc discounts. The percentage of the discount, as a string representation of a decimal number.<br><br>A value of `7.25` corresponds to a percentage of 7.25%. This value range between 0.0 up to 100.0 |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "catalog_object_id": null,
  "name": null,
  "percentage": null,
  "amount_money": null
}
```

#### Create Order Request Line Item

__Deprecated__: Please use the [OrderLineItem](#type-orderlineitem) type in the order
field of [CreateOrderRequest](#type-createorderrequest) instead.

Represents a line item to include in an order. Each line item describes
a different product to purchase, with its own quantity and price details.

Line items can either reference objects from the merchant's catalog, or can
alternatively specify a name and price instead.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | Only used for ad hoc line items. The name of the line item. This value cannot exceed 500 characters.<br><br>Do not provide a value for this field if you provide a value for `catalog_object_id`. |
| `quantity` | `String` |  | The quantity to purchase, as a string representation of a number.<br><br>This string must have a positive integer value. |
| `base_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `variation_name` | `String` | Optional | Only used for ad hoc line items. The variation name of the line item. This value cannot exceed 255 characters.<br><br>If this value is not set for an ad hoc line item, the default value of `Regular` is used.<br><br>Do not provide a value for this field if you provide a value for the `catalog_object_id`. |
| `note` | `String` | Optional | The note of the line item. This value cannot exceed 500 characters. |
| `catalog_object_id` | `String` | Optional | Only used for Catalog line items.<br>The catalog object ID for an existing [CatalogItemVariation](#type-catalogitemvariation).<br><br>Do not provide a value for this field if you provide a value for `name` and `base_price_money`. |
| `modifiers` | [`Array<Create Order Request Modifier Hash>`](#create-order-request-modifier) | Optional | Only used for Catalog line items. The modifiers to include on the line item. |
| `taxes` | [`Array<Create Order Request Tax Hash>`](#create-order-request-tax) | Optional | The taxes to include on the line item. |
| `discounts` | [`Array<Create Order Request Discount Hash>`](#create-order-request-discount) | Optional | The discounts to include on the line item. |

##### Example (as JSON)

```json
{
  "name": null,
  "quantity": "quantity6",
  "base_price_money": null,
  "variation_name": null,
  "note": null,
  "catalog_object_id": null,
  "modifiers": null,
  "taxes": null,
  "discounts": null
}
```

#### Create Order Request Modifier

__Deprecated__: Please use the [OrderLineItemModifier](#type-orderlineitemmodifier) type
instead.

Represents a modifier applied to a single line item.

Modifiers can reference existing objects in a merchant catalog or be constructed ad hoc at the time of purchase by providing a name and price.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_id` | `String` | Optional | The catalog object ID of a [CatalogModifier](#type-catalogmodifier). |
| `name` | `String` | Optional | Only used for ad hoc modifiers. The name of the modifier. `name` cannot exceed 255 characters.<br><br>Do not provide a value for `name` if you provide a value for `catalog_object_id`. |
| `base_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "catalog_object_id": null,
  "name": null,
  "base_price_money": null
}
```

#### Create Order Request Tax

__Deprecated__: Please use the [OrderLineItemTax](#type-orderlineitemtax) type in the
order field of [CreateOrderRequest](#type-createorderrequest) instead.

Represents a tax that can apply to either a single line item or an entire order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_id` | `String` | Optional | Only used for catalog taxes. The catalog object ID of an existing [CatalogTax](#type-catalogtax).<br><br>Do not provide a value for this field if you provide values in other fields for an ad hoc tax. |
| `name` | `String` | Optional | Only used for ad hoc taxes. The tax's name.<br><br>Do not provide a value for this field if you set `catalog_object_id`. |
| `type` | [`String (Order Line Item Tax Type)`](#order-line-item-tax-type) | Optional | Indicates how the tax is applied to the associated line item or order. |
| `percentage` | `String` | Optional | Only used for ad hoc taxes. The percentage of the tax, as a string representation of a decimal number.<br><br>A value of `7.25` corresponds to a percentage of 7.25%. This value range between 0.0 up to 100.0 |

##### Example (as JSON)

```json
{
  "catalog_object_id": null,
  "name": null,
  "type": null,
  "percentage": null
}
```

#### Create Order Response

Defines the fields that are included in the response body of
a request to the CreateOrder endpoint.

One of `errors` or `order` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`Order Hash`](#order) | Optional | Contains all information related to a single order to process with Square,<br>including line items that specify the products to purchase. Order objects also<br>include information on any associated tenders, refunds, and returns.<br><br>All Connect V2 Transactions have all been converted to Orders including all associated<br>itemization data. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "order": {
    "id": "CAISENgvlJ6jLWAzERDzjyHVybY",
    "location_id": "LOCATION_ID",
    "line_items": [
      {
        "name": "New York Strip Steak",
        "quantity": "1",
        "taxes": [
          {
            "name": "State Sales Tax",
            "type": "ADDITIVE",
            "percentage": "9",
            "applied_money": {
              "amount": 136,
              "currency": "USD"
            }
          }
        ],
        "discounts": [
          {
            "catalog_object_id": "DB7L55ZH2BGWI4H23ULIWOQ7",
            "name": "Membership Discount",
            "type": "FIXED_PERCENTAGE",
            "percentage": "0.5",
            "applied_money": {
              "amount": 8,
              "currency": "USD"
            },
            "scope": "ORDER"
          },
          {
            "name": "Labor Day Sale",
            "type": "FIXED_PERCENTAGE",
            "percentage": "5",
            "applied_money": {
              "amount": 79,
              "currency": "USD"
            },
            "scope": "ORDER"
          }
        ],
        "base_price_money": {
          "amount": 1599,
          "currency": "USD"
        },
        "gross_sales_money": {
          "amount": 1599,
          "currency": "USD"
        },
        "total_tax_money": {
          "amount": 136,
          "currency": "USD"
        },
        "total_discount_money": {
          "amount": 87,
          "currency": "USD"
        },
        "total_money": {
          "amount": 1648,
          "currency": "USD"
        }
      },
      {
        "name": "New York Steak",
        "quantity": "2",
        "catalog_object_id": "BEMYCSMIJL46OCDV4KYIKXIB",
        "variation_name": "Larger",
        "modifiers": [
          {
            "catalog_object_id": "CHQX7Y4KY6N5KINJKZCFURPZ",
            "name": "Well",
            "base_price_money": {
              "amount": 50,
              "currency": "USD"
            },
            "total_price_money": {
              "amount": 100,
              "currency": "USD"
            }
          }
        ],
        "taxes": [
          {
            "name": "State Sales Tax",
            "type": "ADDITIVE",
            "percentage": "9",
            "applied_money": {
              "amount": 374,
              "currency": "USD"
            }
          }
        ],
        "discounts": [
          {
            "catalog_object_id": "DB7L55ZH2BGWI4H23ULIWOQ7",
            "name": "Membership Discount",
            "type": "FIXED_PERCENTAGE",
            "percentage": "0.5",
            "applied_money": {
              "amount": 22,
              "currency": "USD"
            },
            "scope": "ORDER"
          },
          {
            "name": "Labor Day Sale",
            "type": "FIXED_PERCENTAGE",
            "percentage": "5",
            "applied_money": {
              "amount": 224,
              "currency": "USD"
            },
            "scope": "ORDER"
          },
          {
            "name": "Sale - $1.00 off",
            "type": "FIXED_AMOUNT",
            "amount_money": {
              "amount": 100,
              "currency": "USD"
            },
            "applied_money": {
              "amount": 100,
              "currency": "USD"
            },
            "scope": "LINE_ITEM"
          }
        ],
        "base_price_money": {
          "amount": 2200,
          "currency": "USD"
        },
        "gross_sales_money": {
          "amount": 4500,
          "currency": "USD"
        },
        "total_tax_money": {
          "amount": 374,
          "currency": "USD"
        },
        "total_discount_money": {
          "amount": 346,
          "currency": "USD"
        },
        "total_money": {
          "amount": 4528,
          "currency": "USD"
        }
      }
    ],
    "taxes": [
      {
        "name": "State Sales Tax",
        "type": "ADDITIVE",
        "percentage": "9",
        "applied_money": {
          "amount": 510,
          "currency": "USD"
        },
        "scope": "ORDER"
      }
    ],
    "discounts": [
      {
        "catalog_object_id": "DB7L55ZH2BGWI4H23ULIWOQ7",
        "name": "Membership Discount",
        "type": "FIXED_PERCENTAGE",
        "percentage": "0.5",
        "applied_money": {
          "amount": 30,
          "currency": "USD"
        },
        "scope": "ORDER"
      },
      {
        "name": "Labor Day Sale",
        "type": "FIXED_PERCENTAGE",
        "percentage": "5",
        "applied_money": {
          "amount": 303,
          "currency": "USD"
        },
        "scope": "ORDER"
      },
      {
        "name": "Sale - $1.00 off",
        "type": "FIXED_AMOUNT",
        "amount_money": {
          "amount": 100,
          "currency": "USD"
        },
        "applied_money": {
          "amount": 100,
          "currency": "USD"
        },
        "scope": "LINE_ITEM"
      }
    ],
    "total_money": {
      "amount": 6176,
      "currency": "USD"
    },
    "total_tax_money": {
      "amount": 510,
      "currency": "USD"
    },
    "total_discount_money": {
      "amount": 433,
      "currency": "USD"
    }
  }
}
```

#### Create Refund Request

Defines the body parameters that can be included in
a request to the CreateRefund endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` |  | A value you specify that uniquely identifies this<br>refund among refunds you've created for the tender.<br><br>If you're unsure whether a particular refund succeeded,<br>you can reattempt it with the same idempotency key without<br>worrying about duplicating the refund.<br><br>See [Idempotency](/basics/api101/idempotency) for more information. |
| `tender_id` | `String` |  | The ID of the tender to refund.<br><br>A [`Transaction`](#type-transaction) has one or more `tenders` (i.e., methods<br>of payment) associated with it, and you refund each tender separately with<br>the Connect API. |
| `reason` | `String` | Optional | A description of the reason for the refund.<br><br>Default value: `Refund via API` |
| `amount_money` | [`Money Hash`](#money) |  | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "idempotency_key": "idempotency_key6",
  "tender_id": "tender_id8",
  "reason": null,
  "amount_money": {
    "amount": null,
    "currency": null
  }
}
```

#### Create Refund Response

Defines the fields that are included in the response body of
a request to the CreateRefund endpoint.

One of `errors` or `refund` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `refund` | [`Refund Hash`](#refund) | Optional | Represents a refund processed for a Square transaction. |

##### Example (as JSON)

```json
{
  "refund": {
    "id": "b27436d1-7f8e-5610-45c6-417ef71434b4-SW",
    "location_id": "18YC4JDH91E1H",
    "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
    "tender_id": "MtZRYYdDrYNQbOvV7nbuBvMF",
    "created_at": "2016-02-12T00:28:18Z",
    "reason": "some reason",
    "amount_money": {
      "amount": 100,
      "currency": "USD"
    },
    "additional_recipients": [
      {
        "location_id": "057P5VYJ4A5X1",
        "description": "Application fees",
        "amount_money": {
          "amount": 10,
          "currency": "USD"
        },
        "receivable_id": "ISu5xwxJ5v0CMJTQq7RvqyMF"
      }
    ],
    "status": "PENDING"
  }
}
```

#### Create Shift Request

Represents a request to create a `Shift`

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` | Optional | Unique string value to insure the idempotency of the operation. |
| `shift` | [`Shift Hash`](#shift) |  | A record of the hourly rate, start, and end times for a single work shift <br>for an employee. May include a record of the start and end times for breaks <br>taken during the shift. |

##### Example (as JSON)

```json
{
  "idempotency_key": null,
  "shift": {
    "id": null,
    "employee_id": "employee_id4",
    "location_id": null,
    "timezone": null,
    "start_at": "start_at6",
    "end_at": null,
    "wage": null,
    "breaks": null,
    "status": null,
    "version": null,
    "created_at": null,
    "updated_at": null
  }
}
```

#### Create Shift Response

The response to the request to create a `Shift`. Contains
the created `Shift` object. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `shift` | [`Shift Hash`](#shift) | Optional | A record of the hourly rate, start, and end times for a single work shift <br>for an employee. May include a record of the start and end times for breaks <br>taken during the shift. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "shift": {
    "id": "K0YH4CV5462JB",
    "employee_id": "ormj0jJJZ5OZIzxrZYJI",
    "location_id": "PAA1RJZZKXBFG",
    "timezone": "America/New_York",
    "start_at": "2019-01-25T03:11:00-05:00",
    "end_at": "2019-01-25T13:11:00-05:00",
    "wage": {
      "title": "Barista",
      "hourly_rate": {
        "amount": 1100,
        "currency": "USD"
      }
    },
    "breaks": [
      {
        "id": "X7GAQYVVRRG6P",
        "start_at": "2019-01-25T06:11:00-05:00",
        "end_at": "2019-01-25T06:16:00-05:00",
        "break_type_id": "REGS1EQR1TPZ5",
        "name": "Tea Break",
        "expected_duration": "PT5M",
        "is_paid": true
      }
    ],
    "status": "CLOSED",
    "version": 1,
    "created_at": "2019-02-28T00:39:02Z",
    "updated_at": "2019-02-28T00:39:02Z"
  }
}
```

#### Customer

Represents one of a business's customers, which can have one or more
cards on file associated with it.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` |  | The customer's unique ID. |
| `created_at` | `String` |  | The time when the customer was created, in RFC 3339 format. |
| `updated_at` | `String` |  | The time when the customer was last updated, in RFC 3339 format. |
| `cards` | [`Array<Card Hash>`](#card) | Optional | The payment details of the customer's cards on file. |
| `given_name` | `String` | Optional | The customer's given (i.e., first) name. |
| `family_name` | `String` | Optional | The customer's family (i.e., last) name. |
| `nickname` | `String` | Optional | The customer's nickname. |
| `company_name` | `String` | Optional | The name of the customer's company. |
| `email_address` | `String` | Optional | The customer's email address. |
| `address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `phone_number` | `String` | Optional | The customer's phone number. |
| `birthday` | `String` | Optional | The customer's birthday in RFC-3339 format. Year is optional,<br>timezone and times are not allowed. Example: `0000-09-01T00:00:00-00:00`<br>for a birthday on September 1st. `1998-09-01T00:00:00-00:00` for a birthday<br>on September 1st 1998. |
| `reference_id` | `String` | Optional | A second ID you can set to associate the customer with an<br>entity in another system. |
| `note` | `String` | Optional | A note to associate with the customer. |
| `preferences` | [`Customer Preferences Hash`](#customer-preferences) | Optional | Represents a particular customer's preferences. |
| `groups` | [`Array<Customer Group Info Hash>`](#customer-group-info) | Optional | The groups the customer belongs to. |
| `creation_source` | [`String (Customer Creation Source)`](#customer-creation-source) | Optional | Indicates the method used to create the customer profile. |

##### Example (as JSON)

```json
{
  "id": "id0",
  "created_at": "created_at2",
  "updated_at": "updated_at4",
  "cards": null,
  "given_name": null,
  "family_name": null,
  "nickname": null,
  "company_name": null,
  "email_address": null,
  "address": null,
  "phone_number": null,
  "birthday": null,
  "reference_id": null,
  "note": null,
  "preferences": null,
  "groups": null,
  "creation_source": null
}
```

#### Customer Creation Source Filter

Creation source filter.

If one or more creation sources are set, customer profiles are included in,
or excluded from, the result if they match at least one of the filter
criteria.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `values` | [`Array<String (Customer Creation Source)>`](#customer-creation-source) | Optional | The list of creation sources used as filtering criteria.<br>See [CustomerCreationSource](#type-customercreationsource) for possible values |
| `rule` | [`String (Customer Inclusion Exclusion)`](#customer-inclusion-exclusion) | Optional | Indicates whether customers should be included in, or excluded from,<br>the result set when they match the filtering criteria. |

##### Example (as JSON)

```json
{
  "values": null,
  "rule": null
}
```

#### Customer Filter

Represents a set of [`CustomerQuery`](#type-customerquery) filters used
to limit the set of Customers returned by [`SearchCustomers`](#endpoint-customers-seachcustomers).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `creation_source` | [`Customer Creation Source Filter Hash`](#customer-creation-source-filter) | Optional | Creation source filter.<br><br>If one or more creation sources are set, customer profiles are included in,<br>or excluded from, the result if they match at least one of the filter<br>criteria. |
| `created_at` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |
| `updated_at` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |

##### Example (as JSON)

```json
{
  "creation_source": null,
  "created_at": null,
  "updated_at": null
}
```

#### Customer Group Info

Contains some brief information about a customer group with its identifier included.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `id` | `String` | The ID of the customer group. |
| `name` | `String` | The name of the customer group. |

##### Example (as JSON)

```json
{
  "id": "id0",
  "name": "name0"
}
```

#### Customer Preferences

Represents a particular customer's preferences.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `email_unsubscribed` | `Boolean` | Optional | The customer has unsubscribed from receiving marketing campaign emails. |

##### Example (as JSON)

```json
{
  "email_unsubscribed": null
}
```

#### Customer Query

Represents a query (filtering and sorting criteria) used to search
for customer profiles.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `filter` | [`Customer Filter Hash`](#customer-filter) | Optional | Represents a set of [`CustomerQuery`](#type-customerquery) filters used<br>to limit the set of Customers returned by [`SearchCustomers`](#endpoint-customers-seachcustomers). |
| `sort` | [`Customer Sort Hash`](#customer-sort) | Optional | Indicates the field to use for sorting customer profiles. For example,<br>by total money spent with the merchant or the date of their first purchase. |

##### Example (as JSON)

```json
{
  "filter": null,
  "sort": null
}
```

#### Customer Sort

Indicates the field to use for sorting customer profiles. For example,
by total money spent with the merchant or the date of their first purchase.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | [`String (Customer Sort Field)`](#customer-sort-field) | Optional | Indicates the sort criteria for a list of Customers. |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |

##### Example (as JSON)

```json
{
  "field": null,
  "order": null
}
```

#### Date Range

A range defined by two dates. Used for filtering a query for Connect v2 
objects that have date properties.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `start_date` | `String` | Optional | String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601<br>extended format for calendar dates.<br>The beginning of a date range (inclusive) |
| `end_date` | `String` | Optional | String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601<br>extended format for calendar dates.<br>The end of a date range (inclusive) |

##### Example (as JSON)

```json
{
  "start_date": null,
  "end_date": null
}
```

#### Delete Break Type Response

The response to a request to delete a `BreakType`. May contain a set 
of `Error` objects if the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{}
```

#### Delete Catalog Object Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `deleted_object_ids` | `Array<String>` | Optional | The IDs of all [CatalogObject](#type-catalogobject)s deleted by this request.<br>Multiple IDs may be returned when associated objects are also deleted, for example<br>a [CatalogItemVariation](#type-catalogitemvariation) will be deleted (and its ID included in this field)<br>when its parent [CatalogItem](#type-catalogitem) is deleted. |
| `deleted_at` | `String` | Optional | The database [timestamp](#workingwithdates) of this deletion in RFC 3339 format, e.g.,<br>"2016-09-04T23:59:33.123Z". |

##### Example (as JSON)

```json
{
  "deleted_object_ids": [
    "7SB3ZQYJ5GDMVFL7JK46JCHT",
    "KQLFFHA6K6J3YQAQAWDQAL57"
  ],
  "deleted_at": "2016-11-16T22:25:24.878Z"
}
```

#### Delete Customer Card Response

Defines the fields that are included in the response body of
a request to the DeleteCustomerCard endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{}
```

#### Delete Customer Response

Defines the fields that are included in the response body of
a request to the DeleteCustomer endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{}
```

#### Delete Shift Response

The response to a request to delete a `Shift`. May contain a set of 
`Error` objects if the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{}
```

#### Device

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The device's Square-issued ID. |
| `name` | `String` | Optional | The device's merchant-specified name. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null
}
```

#### Employee

An employee created in the **Square Dashboard** account of a business. 
Used by the Labor API.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this `Employee`. |
| `first_name` | `String` | Optional | Given (first) name of the employee. |
| `last_name` | `String` | Optional | Family (last) name of the employee |
| `email` | `String` | Optional | Email of the employee |
| `phone_number` | `String` | Optional | Phone number of the employee in E.164 format, i.e. "+12125554250" |
| `location_ids` | `Array<String>` | Optional | A list of location IDs where this employee has access. |
| `status` | [`String (Employee Status)`](#employee-status) | Optional | The status of the Employee being retrieved. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |
| `updated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format. |

##### Example (as JSON)

```json
{
  "id": null,
  "first_name": null,
  "last_name": null,
  "email": null,
  "phone_number": null,
  "location_ids": null,
  "status": null,
  "created_at": null,
  "updated_at": null
}
```

#### Employee Wage

The hourly wage rate that an employee will earn on a `Shift` for doing the job
specified by the `title` property of this object.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object. |
| `employee_id` | `String` |  | The `Employee` that this wage is assigned to. |
| `title` | `String` | Optional | The job title that this wage relates to. |
| `hourly_rate` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "id": null,
  "employee_id": "employee_id0",
  "title": null,
  "hourly_rate": null
}
```

#### Error

Represents an error encountered during a request to the Connect API.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `category` | [`String (Error Category)`](#error-category) |  | Indicates which high-level category of error has occurred during a<br>request to the Connect API. |
| `code` | [`String (Error Code)`](#error-code) |  | Indicates specific errors that can occur during a request to the<br>Connect API. |
| `detail` | `String` | Optional | A human-readable description of the error for debugging purposes. |
| `field` | `String` | Optional | The name of the field provided in the original request that the error<br>pertains to, if any. |

##### Example (as JSON)

```json
{
  "category": "INVALID_REQUEST_ERROR",
  "code": "ACCESS_TOKEN_EXPIRED",
  "detail": null,
  "field": null
}
```

#### Get Break Type Response

The response to a request to get a `BreakType`. Contains
the requested `BreakType` objects. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `break_type` | [`Break Type Hash`](#break-type) | Optional | A defined break template that sets an expectation for possible `Break` <br>instances on a `Shift`. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "break_type": {
    "id": "lA0mj_RSOprNPwMUXdYp",
    "location_id": "059SB0E0WCNWS",
    "break_name": "Lunch Break",
    "expected_duration": "PT30M",
    "is_paid": true,
    "version": 1,
    "created_at": "2019-02-21T17:50:00Z",
    "updated_at": "2019-02-21T17:50:00Z"
  }
}
```

#### Get Employee Wage Response

A response to a request to get an `EmployeeWage`. Contains
the requested `EmployeeWage` objects. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_wage` | [`Employee Wage Hash`](#employee-wage) | Optional | The hourly wage rate that an employee will earn on a `Shift` for doing the job<br>specified by the `title` property of this object. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "employee_wage": {
    "id": "pXS3qCv7BERPnEGedM4S8mhm",
    "employee_id": "33fJchumvVdJwxV0H6L9",
    "title": "Manager",
    "hourly_rate": {
      "amount": 2000,
      "currency": "USD"
    }
  }
}
```

#### Get Shift Response

A response to request to get a `Shift`. Contains
the requested `Shift` object. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `shift` | [`Shift Hash`](#shift) | Optional | A record of the hourly rate, start, and end times for a single work shift <br>for an employee. May include a record of the start and end times for breaks <br>taken during the shift. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "shift": {
    "id": "T35HMQSN89SV4",
    "employee_id": "D71KRMQof6cXGUW0aAv7",
    "location_id": "PAA1RJZZKXBFG",
    "timezone": "America/New_York",
    "start_at": "2019-02-23T18:00:00-05:00",
    "end_at": "2019-02-23T21:00:00-05:00",
    "wage": {
      "title": "Cashier",
      "hourly_rate": {
        "amount": 1457,
        "currency": "USD"
      }
    },
    "breaks": [
      {
        "id": "M9BBKEPQAQD2T",
        "start_at": "2019-02-23T19:00:00-05:00",
        "end_at": "2019-02-23T20:00:00-05:00",
        "break_type_id": "92EPDRQKJ5088",
        "name": "Lunch Break",
        "expected_duration": "PT1H",
        "is_paid": true
      }
    ],
    "status": "CLOSED",
    "version": 1,
    "created_at": "2019-02-27T00:12:12Z",
    "updated_at": "2019-02-27T00:12:12Z"
  }
}
```

#### Inventory Adjustment

Represents a change in state or quantity of product inventory at a
particular time and location.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | A unique ID generated by Square for the<br>[InventoryAdjustment](#type-inventoryadjustment). |
| `reference_id` | `String` | Optional | An optional ID provided by the application to tie the<br>[InventoryAdjustment](#type-inventoryadjustment) to an external<br>system. |
| `from_state` | [`String (Inventory State)`](#inventory-state) | Optional | Indicates the state of a tracked item quantity in the lifecycle of goods. |
| `to_state` | [`String (Inventory State)`](#inventory-state) | Optional | Indicates the state of a tracked item quantity in the lifecycle of goods. |
| `location_id` | `String` | Optional | The Square ID of the [Location](#type-location) where the related<br>quantity of items are being tracked. |
| `catalog_object_id` | `String` | Optional | The Square generated ID of the<br>[CatalogObject](#type-catalogobject) being tracked. |
| `catalog_object_type` | `String` | Optional | The [CatalogObjectType](#type-catalogobjecttype) of the<br>[CatalogObject](#type-catalogobject) being tracked. Tracking is only<br>supported for the `ITEM_VARIATION` type. |
| `quantity` | `String` | Optional | The number of items affected by the adjustment as a decimal string.<br>Can support up to 5 digits after the decimal point.<br><br>_Important_: The Point of Sale app and Dashboard do not currently support<br>decimal quantities. If a Point of Sale app or Dashboard attempts to read a<br>decimal quantity on inventory counts or adjustments, the quantity will be rounded<br>down to the nearest integer. For example, `2.5` will become `2`, and `-2.5`<br>will become `-3`.<br>Read [Decimal Quantities (BETA)](/more-apis/inventory/overview#decimal-quantities-beta) for more information. |
| `total_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `occurred_at` | `String` | Optional | A client-generated timestamp in RFC 3339 format that indicates when<br>the adjustment took place. For write actions, the `occurred_at`<br>timestamp cannot be older than 24 hours or in the future relative to the<br>time of the request. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format that indicates when Square<br>received the adjustment. |
| `source` | [`Source Application Hash`](#source-application) | Optional | Provides information about the application used to generate an inventory<br>change. |
| `employee_id` | `String` | Optional | The Square ID of the [Employee](#type-employee) responsible for the<br>inventory adjustment. |
| `transaction_id` | `String` | Optional | The read-only Square ID of the [Transaction][#type-transaction] that<br>caused the adjustment. Only relevant for payment-related state<br>transitions. |
| `refund_id` | `String` | Optional | The read-only Square ID of the [Refund][#type-refund] that<br>caused the adjustment. Only relevant for refund-related state<br>transitions. |
| `purchase_order_id` | `String` | Optional | The read-only Square ID of the purchase order that caused the<br>adjustment. Only relevant for state transitions from the Square for Retail<br>app. |
| `goods_receipt_id` | `String` | Optional | The read-only Square ID of the Square goods receipt that caused the<br>adjustment. Only relevant for state transitions from the Square for Retail<br>app. |

##### Example (as JSON)

```json
{
  "id": null,
  "reference_id": null,
  "from_state": null,
  "to_state": null,
  "location_id": null,
  "catalog_object_id": null,
  "catalog_object_type": null,
  "quantity": null,
  "total_price_money": null,
  "occurred_at": null,
  "created_at": null,
  "source": null,
  "employee_id": null,
  "transaction_id": null,
  "refund_id": null,
  "purchase_order_id": null,
  "goods_receipt_id": null
}
```

#### Inventory Change

Represents a single physical count, inventory, adjustment, or transfer
that is part of the history of inventory changes for a particular
[CatalogObject](#type-catalogobject).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `type` | [`String (Inventory Change Type)`](#inventory-change-type) | Optional | Indicates how the inventory change was applied to a tracked quantity of items. |
| `physical_count` | [`Inventory Physical Count Hash`](#inventory-physical-count) | Optional | Represents the quantity of an item variation that is physically present<br>at a specific location, verified by a seller or a seller's employee. For example,<br>a physical count might come from an employee counting the item variations on<br>hand or from syncing with an external system. |
| `adjustment` | [`Inventory Adjustment Hash`](#inventory-adjustment) | Optional | Represents a change in state or quantity of product inventory at a<br>particular time and location. |
| `transfer` | [`Inventory Transfer Hash`](#inventory-transfer) | Optional | Represents the transfer of a quantity of product inventory at a<br>particular time from one location to another. |

##### Example (as JSON)

```json
{
  "type": null,
  "physical_count": null,
  "adjustment": null,
  "transfer": null
}
```

#### Inventory Count

Represents Square's estimated quantity of items in a particular state at a
particular location based on the known history of physical counts and
inventory adjustments

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_id` | `String` | Optional | The Square generated ID of the<br>[CatalogObject](#type-catalogobject) being tracked. |
| `catalog_object_type` | `String` | Optional | The [CatalogObjectType](#type-catalogobjecttype) of the<br>[CatalogObject](#type-catalogobject) being tracked. Tracking is only<br>supported for the `ITEM_VARIATION` type. |
| `state` | [`String (Inventory State)`](#inventory-state) | Optional | Indicates the state of a tracked item quantity in the lifecycle of goods. |
| `location_id` | `String` | Optional | The Square ID of the [Location](#type-location) where the related<br>quantity of items are being tracked. |
| `quantity` | `String` | Optional | The number of items in the count as a decimal string.<br>Can support up to 5 digits after the decimal point.<br><br>_Important_: The Point of Sale app and Dashboard do not currently support<br>decimal quantities. If a Point of Sale app or Dashboard attempts to read a<br>decimal quantity on inventory counts or adjustments, the quantity will be rounded<br>down to the nearest integer. For example, `2.5` will become `2`, and `-2.5`<br>will become `-3`.<br>Read [Decimal Quantities (BETA)](/more-apis/inventory/overview#decimal-quantities-beta) for more information. |
| `calculated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format that indicates when Square<br>received the most recent physical count or adjustment that had an affect<br>on the estimated count. |

##### Example (as JSON)

```json
{
  "catalog_object_id": null,
  "catalog_object_type": null,
  "state": null,
  "location_id": null,
  "quantity": null,
  "calculated_at": null
}
```

#### Inventory Physical Count

Represents the quantity of an item variation that is physically present
at a specific location, verified by a seller or a seller's employee. For example,
a physical count might come from an employee counting the item variations on
hand or from syncing with an external system.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | A unique ID generated by Square for the<br>[InventoryPhysicalCount](#type-inventoryphysicalcount). |
| `reference_id` | `String` | Optional | An optional ID provided by the application to tie the<br>[InventoryPhysicalCount](#type-inventoryphysicalcount) to an external<br>system. |
| `catalog_object_id` | `String` | Optional | The Square generated ID of the<br>[CatalogObject](#type-catalogobject) being tracked. |
| `catalog_object_type` | `String` | Optional | The [CatalogObjectType](#type-catalogobjecttype) of the<br>[CatalogObject](#type-catalogobject) being tracked. Tracking is only<br>supported for the `ITEM_VARIATION` type. |
| `state` | [`String (Inventory State)`](#inventory-state) | Optional | Indicates the state of a tracked item quantity in the lifecycle of goods. |
| `location_id` | `String` | Optional | The Square ID of the [Location](#type-location) where the related<br>quantity of items are being tracked. |
| `quantity` | `String` | Optional | The number of items affected by the physical count as a decimal string.<br>Can support up to 5 digits after the decimal point.<br><br>_Important_: The Point of Sale app and Dashboard do not currently support<br>decimal quantities. If a Point of Sale app or Dashboard attempts to read a<br>decimal quantity on inventory counts or adjustments, the quantity will be rounded<br>down to the nearest integer. For example, `2.5` will become `2`, and `-2.5`<br>will become `-3`.<br>Read [Decimal Quantities (BETA)](/more-apis/inventory/overview#decimal-quantities-beta) for more information. |
| `source` | [`Source Application Hash`](#source-application) | Optional | Provides information about the application used to generate an inventory<br>change. |
| `employee_id` | `String` | Optional | The Square ID of the [Employee](#type-employee) responsible for the<br>physical count. |
| `occurred_at` | `String` | Optional | A client-generated timestamp in RFC 3339 format that indicates when<br>the physical count took place. For write actions, the `occurred_at`<br>timestamp cannot be older than 24 hours or in the future relative to the<br>time of the request. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format that indicates when Square<br>received the physical count. |

##### Example (as JSON)

```json
{
  "id": null,
  "reference_id": null,
  "catalog_object_id": null,
  "catalog_object_type": null,
  "state": null,
  "location_id": null,
  "quantity": null,
  "source": null,
  "employee_id": null,
  "occurred_at": null,
  "created_at": null
}
```

#### Inventory Transfer

Represents the transfer of a quantity of product inventory at a
particular time from one location to another.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | A unique ID generated by Square for the<br>[InventoryTransfer](#type-inventorytransfer). |
| `reference_id` | `String` | Optional | An optional ID provided by the application to tie the<br>[InventoryTransfer](#type-inventorytransfer) to an external system. |
| `state` | [`String (Inventory State)`](#inventory-state) | Optional | Indicates the state of a tracked item quantity in the lifecycle of goods. |
| `from_location_id` | `String` | Optional | The Square ID of the [Location](#type-location) where the related<br>quantity of items were tracked before the transfer. |
| `to_location_id` | `String` | Optional | The Square ID of the [Location](#type-location) where the related<br>quantity of items were tracked after the transfer. |
| `catalog_object_id` | `String` | Optional | The Square generated ID of the<br>[CatalogObject](#type-catalogobject) being tracked. |
| `catalog_object_type` | `String` | Optional | The [CatalogObjectType](#type-catalogobjecttype) of the<br>[CatalogObject](#type-catalogobject) being tracked.Tracking is only<br>supported for the `ITEM_VARIATION` type. |
| `quantity` | `String` | Optional | The number of items affected by the transfer as a decimal string.<br>Can support up to 5 digits after the decimal point.<br><br>_Important_: The Point of Sale app and Dashboard do not currently support<br>decimal quantities. If a Point of Sale app or Dashboard attempts to read a<br>decimal quantity on inventory counts or adjustments, the quantity will be rounded<br>down to the nearest integer. For example, `2.5` will become `2`, and `-2.5`<br>will become `-3`.<br>Read [Decimal Quantities (BETA)](/more-apis/inventory/overview#decimal-quantities-beta) for more information. |
| `occurred_at` | `String` | Optional | A client-generated timestamp in RFC 3339 format that indicates when<br>the transfer took place. For write actions, the `occurred_at` timestamp<br>cannot be older than 24 hours or in the future relative to the time of the<br>request. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format that indicates when Square<br>received the transfer request. |
| `source` | [`Source Application Hash`](#source-application) | Optional | Provides information about the application used to generate an inventory<br>change. |
| `employee_id` | `String` | Optional | The Square ID of the [Employee](#type-employee) responsible for the<br>inventory transfer. |

##### Example (as JSON)

```json
{
  "id": null,
  "reference_id": null,
  "state": null,
  "from_location_id": null,
  "to_location_id": null,
  "catalog_object_id": null,
  "catalog_object_type": null,
  "quantity": null,
  "occurred_at": null,
  "created_at": null,
  "source": null,
  "employee_id": null
}
```

#### Item Variation Location Overrides

Price and inventory alerting overrides for a [CatalogItemVariation](#type-catalogitemvariation) at a specific [location](#type-location).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | The ID of the [location](#type-location). |
| `price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `pricing_type` | [`String (Catalog Pricing Type)`](#catalog-pricing-type) | Optional | Indicates whether the price of a [CatalogItemVariation](#type-catalogitemvariation) should be entered manually at the time of sale. |
| `track_inventory` | `Boolean` | Optional | If `true`, inventory tracking is active for the [CatalogItemVariation](#type-catalogitemvariation) at this [location](#type-location). |
| `inventory_alert_type` | [`String (Inventory Alert Type)`](#inventory-alert-type) | Optional | Indicates whether Square should alert the merchant when the inventory quantity of a [CatalogItemVariation](#type-catalogitemvariation) is low. |
| `inventory_alert_threshold` | `Long` | Optional | If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type`<br>is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.<br><br>This value is always an integer. |

##### Example (as JSON)

```json
{
  "location_id": null,
  "price_money": null,
  "pricing_type": null,
  "track_inventory": null,
  "inventory_alert_type": null,
  "inventory_alert_threshold": null
}
```

#### List Additional Recipient Receivable Refunds Request

Defines the query parameters that can be included in
a request to the ListAdditionalRecipientReceivableRefunds endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_params": "?begin_time=2016-01-15T00:00:00Z&end_time=2016-01-31T00:00:00Z"
}
```

#### List Additional Recipient Receivable Refunds Response

Defines the fields that are included in the response body of
a request to the ListAdditionalRecipientReceivableRefunds endpoint.

One of `errors` or `additional_recipient_receivable_refunds` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `receivable_refunds` | [`Array<Additional Recipient Receivable Refund Hash>`](#additional-recipient-receivable-refund) | Optional | An array of AdditionalRecipientReceivableRefunds that match your query. |
| `cursor` | `String` | Optional | A pagination cursor for retrieving the next set of results,<br>if any remain. Provide this value as the `cursor` parameter in a subsequent<br>request to this endpoint.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "receivable_refunds": [
    {
      "id": "Ge2OT7KA6XAg1GC15qs5S",
      "receivable_id": "ISu5xwxJ5v0CMJTQq7RvqyMF",
      "refund_id": "b27436d1-7f8e-5610-45c6-417ef71434b4-SW",
      "transaction_location_id": "18YC4JDH91E1H",
      "amount_money": {
        "amount": 10,
        "currency": "USD"
      },
      "created_at": "2016-01-20T22:57:56Z"
    }
  ]
}
```

#### List Additional Recipient Receivables Request

Defines the query parameters that can be included in
a request to the ListAdditionalRecipientReceivables endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_params": "?begin_time=2016-01-15T00:00:00Z&end_time=2016-01-31T00:00:00Z"
}
```

#### List Additional Recipient Receivables Response

Defines the fields that are included in the response body of
a request to the ListAdditionalRecipientReceivables endpoint.

One of `errors` or `additional_recipient_receivables` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `receivables` | [`Array<Additional Recipient Receivable Hash>`](#additional-recipient-receivable) | Optional | An array of AdditionalRecipientReceivables that match your query. |
| `cursor` | `String` | Optional | A pagination cursor for retrieving the next set of results,<br>if any remain. Provide this value as the `cursor` parameter in a subsequent<br>request to this endpoint.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "receivables": [
    {
      "id": "ISu5xwxJ5v0CMJTQq7RvqyMF",
      "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
      "transaction_location_id": "18YC4JDH91E1H",
      "amount_money": {
        "amount": 20,
        "currency": "USD"
      },
      "created_at": "2016-01-19T15:12:41Z",
      "refunds": [
        {
          "id": "Ge2OT7KA6XAg1GC15qs5S",
          "receivable_id": "ISu5xwxJ5v0CMJTQq7RvqyMF",
          "refund_id": "b27436d1-7f8e-5610-45c6-417ef71434b4-SW",
          "transaction_location_id": "18YC4JDH91E1H",
          "amount_money": {
            "amount": 10,
            "currency": "USD"
          },
          "created_at": "2016-01-20T22:57:56Z"
        }
      ]
    }
  ]
}
```

#### List Break Types Request

A request for a filtered set of `BreakType` objects

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | Filter Break Types returned to only those that are associated with the<br>specified location. |
| `limit` | `Integer` | Optional | Maximum number of Break Types to return per page. Can range between 1<br>and 200. The default is the maximum at 200. |
| `cursor` | `String` | Optional | Pointer to the next page of Break Type results to fetch. |

##### Example (as JSON)

```json
{
  "request_params": "?location_id=PAA1RJZZKXBFG&limit=2&cursor=s4R0Z6ecFTzTC4jz8sUDBQTudX3KE313OT9fCt3VUgsXM4sMgED"
}
```

#### List Break Types Response

The response to a request for a set of `BreakTypes`. Contains
the requested `BreakType` objects. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `break_types` | [`Array<Break Type Hash>`](#break-type) | Optional | A page of `BreakType` results. |
| `cursor` | `String` | Optional | Value supplied in the subsequent request to fetch the next next page<br>of Break Type results. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "break_types": [
    {
      "id": "REGS1EQR1TPZ5",
      "location_id": "PAA1RJZZKXBFG",
      "break_name": "Coffee Break",
      "expected_duration": "PT5M",
      "is_paid": false,
      "version": 1,
      "created_at": "2019-01-22T20:47:37Z",
      "updated_at": "2019-01-22T20:47:37Z"
    },
    {
      "id": "92EPDRQKJ5088",
      "location_id": "PAA1RJZZKXBFG",
      "break_name": "Lunch Break",
      "expected_duration": "PT1H",
      "is_paid": true,
      "version": 3,
      "created_at": "2019-01-25T19:26:30Z",
      "updated_at": "2019-01-25T19:26:30Z"
    }
  ],
  "cursor": "2fofTniCgT0yIPAq26kmk0YyFQJZfbWkh73OOnlTHmTAx13NgED"
}
```

#### List Catalog Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Optional | The pagination cursor returned in the previous response. Leave unset for an initial request.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `types` | `String` | Optional | An optional case-insensitive, comma-separated list of object types to retrieve, for example<br>`ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.<br><br>The legal values are taken from the [CatalogObjectType](#type-catalogobjecttype)<br>enumeration, namely `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`,<br>`MODIFIER`, `MODIFIER_LIST`, or `IMAGE`. |

##### Example (as JSON)

```json
{
  "request_params": "?types=category,tax"
}
```

#### List Catalog Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset, this is the final response.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | The [CatalogObject](#type-catalogobject)s returned. |

##### Example (as JSON)

```json
{
  "objects": [
    {
      "type": "CATEGORY",
      "id": "5ZYQZZ2IECPVJ2IJ5KQPRDC3",
      "updated_at": "2017-02-21T14:50:26.495Z",
      "version": 1487688626495,
      "is_deleted": false,
      "present_at_all_locations": true,
      "category_data": {
        "name": "Beverages"
      }
    },
    {
      "type": "TAX",
      "id": "L5R47DGBZOOVKCAFIXC56AEN",
      "updated_at": "2017-02-21T14:50:26.495Z",
      "version": 1487688626495,
      "is_deleted": false,
      "present_at_all_locations": true,
      "tax_data": {
        "name": "Sales Tax",
        "calculation_phase": "TAX_SUBTOTAL_PHASE",
        "inclusion_type": "ADDITIVE",
        "percentage": "5.0",
        "enabled": true
      }
    }
  ]
}
```

#### List Customers Request

Defines the query parameters that can be provided in a request to the
ListCustomers endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |
| `sort_field` | [`String (Customer Sort Field)`](#customer-sort-field) | Optional | Indicates the sort criteria for a list of Customers. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |

##### Example (as JSON)

```json
{}
```

#### List Customers Response

Defines the fields that are included in the response body of
a request to the ListCustomers endpoint.

One of `errors` or `customers` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `customers` | [`Array<Customer Hash>`](#customer) | Optional | An array of `Customer` objects that match your query. |
| `cursor` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. This value is present only if the request<br>succeeded and additional results are available.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "customers": [
    {
      "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
      "created_at": "2016-03-23T20:21:54.859Z",
      "updated_at": "2016-03-23T20:21:55Z",
      "given_name": "Amelia",
      "family_name": "Earhart",
      "email_address": "Amelia.Earhart@example.com",
      "address": {
        "address_line_1": "500 Electric Ave",
        "address_line_2": "Suite 600",
        "locality": "New York",
        "administrative_district_level_1": "NY",
        "postal_code": "10003",
        "country": "US"
      },
      "phone_number": "1-212-555-4240",
      "reference_id": "YOUR_REFERENCE_ID",
      "note": "a customer",
      "groups": [
        {
          "id": "16894e93-96eb-4ced-b24b-f71d42bf084c",
          "name": "Aviation Enthusiasts"
        }
      ]
    }
  ]
}
```

#### List Employee Wages Request

A request for a set of `EmployeeWage` objects

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Optional | Filter wages returned to only those that are associated with the<br>specified employee. |
| `limit` | `Integer` | Optional | Maximum number of Employee Wages to return per page. Can range between<br>1 and 200. The default is the maximum at 200. |
| `cursor` | `String` | Optional | Pointer to the next page of Employee Wage results to fetch. |

##### Example (as JSON)

```json
{
  "request_params": "?employee_id=33fJchumvVdJwxV0H6L9&limit=4&cursor=s4R0Z6ecFTzTC4jz8sUDBQTudX3KE313OT9fCt3VUgsXM4sMgED"
}
```

#### List Employee Wages Response

The response to a request for a set of `EmployeeWage` objects. Contains 
a set of `EmployeeWage`.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_wages` | [`Array<Employee Wage Hash>`](#employee-wage) | Optional | A page of Employee Wage results. |
| `cursor` | `String` | Optional | Value supplied in the subsequent request to fetch the next next page<br>of Employee Wage results. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "employee_wages": [
    {
      "id": "pXS3qCv7BERPnEGedM4S8mhm",
      "employee_id": "33fJchumvVdJwxV0H6L9",
      "title": "Manager",
      "hourly_rate": {
        "amount": 3250,
        "currency": "USD"
      }
    },
    {
      "id": "rZduCkzYDUVL3ovh1sQgbue6",
      "employee_id": "33fJchumvVdJwxV0H6L9",
      "title": "Cook",
      "hourly_rate": {
        "amount": 2600,
        "currency": "USD"
      }
    },
    {
      "id": "FxLbs5KpPUHa8wyt5ctjubDX",
      "employee_id": "33fJchumvVdJwxV0H6L9",
      "title": "Barista",
      "hourly_rate": {
        "amount": 1600,
        "currency": "USD"
      }
    },
    {
      "id": "vD1wCgijMDR3cX5TPnu7VXto",
      "employee_id": "33fJchumvVdJwxV0H6L9",
      "title": "Cashier",
      "hourly_rate": {
        "amount": 1700,
        "currency": "USD"
      }
    }
  ],
  "cursor": "2fofTniCgT0yIPAq26kmk0YyFQJZfbWkh73OOnlTHmTAx13NgED"
}
```

#### List Employees Request

Retrieve a paged-list of employees for a Square account

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Optional | Filter employees returned to only those that are associated with the<br>specified location. |
| `status` | [`String (Employee Status)`](#employee-status) | Optional | The status of the Employee being retrieved. |
| `limit` | `Integer` | Optional | The number of employees to be returned on each page. |
| `cursor` | `String` | Optional | The token required to retrieve the specified page of results. |

##### Example (as JSON)

```json
{
  "location_id": null,
  "status": null,
  "limit": null,
  "cursor": null
}
```

#### List Employees Response

Defines the fields that are included in the response body of
a request to the ListEmployees endpoint.

One of `errors` or `employees` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employees` | [`Array<Employee Hash>`](#employee) | Optional | List of employees returned from the request. |
| `cursor` | `String` | Optional | The token to be used to retrieve the next page of results. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "employees": null,
  "cursor": null,
  "errors": null
}
```

#### List Locations Response

Defines the fields that are included in the response body of
a request to the ListLocations endpoint.

One of `errors` or `locations` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `locations` | [`Array<Location Hash>`](#location) | Optional | The business's locations. |

##### Example (as JSON)

```json
{
  "locations": [
    {
      "id": "18YC4JDH91E1H",
      "name": "your location name",
      "address": {
        "address_line_1": "123 Main St",
        "locality": "San Francisco",
        "administrative_district_level_1": "CA",
        "postal_code": "94114",
        "country": "US"
      },
      "timezone": "America/Los_Angeles",
      "capabilities": [
        "CREDIT_CARD_PROCESSING"
      ],
      "status": "ACTIVE",
      "created_at": "2016-09-19T17:33:12Z",
      "merchant_id": "3MYCJG5GVYQ8Q",
      "country": "US",
      "language_code": "en-US",
      "currency": "USD",
      "phone_number": "+1 650-354-7217",
      "business_name": "Pumbaa's business name",
      "business_hours": {
        "periods": [
          {
            "day_of_week": "MON",
            "start_local_time": "08:00:00",
            "end_local_time": "17:00:00"
          },
          {
            "day_of_week": "TUE",
            "start_local_time": "08:00:00",
            "end_local_time": "17:00:00"
          },
          {
            "day_of_week": "WED",
            "start_local_time": "08:00:00",
            "end_local_time": "17:00:00"
          }
        ]
      }
    }
  ]
}
```

#### List Refunds Request

Defines the query parameters that can be included in
a request to the ListRefunds endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_params": "?begin_time=2016-01-15T00:00:00Z&end_time=2016-01-31T00:00:00Z"
}
```

#### List Refunds Response

Defines the fields that are included in the response body of
a request to the ListRefunds endpoint.

One of `errors` or `refunds` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `refunds` | [`Array<Refund Hash>`](#refund) | Optional | An array of refunds that match your query. |
| `cursor` | `String` | Optional | A pagination cursor for retrieving the next set of results,<br>if any remain. Provide this value as the `cursor` parameter in a subsequent<br>request to this endpoint.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "refunds": [
    {
      "id": "b27436d1-7f8e-5610-45c6-417ef71434b4-SW",
      "location_id": "18YC4JDH91E1H",
      "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
      "tender_id": "MtZRYYdDrYNQbOvV7nbuBvMF",
      "created_at": "2016-01-20T00:28:18Z",
      "reason": "some reason",
      "amount_money": {
        "amount": 100,
        "currency": "USD"
      },
      "additional_recipients": [
        {
          "location_id": "057P5VYJ4A5X1",
          "description": "Application fees",
          "amount_money": {
            "amount": 10,
            "currency": "USD"
          }
        }
      ],
      "status": "APPROVED"
    }
  ]
}
```

#### List Transactions Request

Defines the query parameters that can be included in
a request to the ListTransactions endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in RFC 3339 format.<br><br>See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.<br><br>Default value: The current time. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_params": "?begin_time=2016-01-15T00:00:00Z&end_time=2016-01-31T00:00:00Z"
}
```

#### List Transactions Response

Defines the fields that are included in the response body of
a request to the ListTransactions endpoint.

One of `errors` or `transactions` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `transactions` | [`Array<Transaction Hash>`](#transaction) | Optional | An array of transactions that match your query. |
| `cursor` | `String` | Optional | A pagination cursor for retrieving the next set of results,<br>if any remain. Provide this value as the `cursor` parameter in a subsequent<br>request to this endpoint.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "transactions": [
    {
      "id": "KnL67ZIwXCPtzOrqj0HrkxMF",
      "location_id": "18YC4JDH91E1H",
      "created_at": "2016-01-20T22:57:56Z",
      "tenders": [
        {
          "id": "MtZRYYdDrYNQbOvV7nbuBvMF",
          "location_id": "18YC4JDH91E1H",
          "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
          "created_at": "2016-01-20T22:57:56Z",
          "note": "some optional note",
          "amount_money": {
            "amount": 5000,
            "currency": "USD"
          },
          "processing_fee_money": {
            "amount": 138,
            "currency": "USD"
          },
          "type": "CARD",
          "card_details": {
            "status": "CAPTURED",
            "card": {
              "card_brand": "VISA",
              "last_4": "1111"
            },
            "entry_method": "KEYED"
          },
          "additional_recipients": [
            {
              "location_id": "057P5VYJ4A5X1",
              "description": "Application fees",
              "amount_money": {
                "amount": 20,
                "currency": "USD"
              }
            }
          ]
        }
      ],
      "refunds": [
        {
          "id": "7a5RcVI0CxbOcJ2wMOkE",
          "location_id": "18YC4JDH91E1H",
          "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
          "tender_id": "MtZRYYdDrYNQbOvV7nbuBvMF",
          "created_at": "2016-01-20T22:59:20Z",
          "reason": "some reason why",
          "amount_money": {
            "amount": 5000,
            "currency": "USD"
          },
          "status": "APPROVED",
          "processing_fee_money": {
            "amount": 138,
            "currency": "USD"
          },
          "additional_recipients": [
            {
              "location_id": "057P5VYJ4A5X1",
              "description": "Application fees",
              "amount_money": {
                "amount": 100,
                "currency": "USD"
              }
            }
          ]
        }
      ],
      "reference_id": "some optional reference id",
      "product": "EXTERNAL_API"
    }
  ]
}
```

#### List Workweek Configs Request

A request for a set of `WorkweekConfig` objects

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `limit` | `Integer` | Optional | Maximum number of Workweek Configs to return per page. |
| `cursor` | `String` | Optional | Pointer to the next page of Workweek Config results to fetch. |

##### Example (as JSON)

```json
{
  "request_params": "?limit=1&cursor=s4R0Z6ecFTzTC4jz8sUDBQTudX3KE313OT9fCt3VUgsXM4sMgED"
}
```

#### List Workweek Configs Response

The response to a request for a set of `WorkweekConfig` objects. Contains
the requested `WorkweekConfig` objects. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `workweek_configs` | [`Array<Workweek Config Hash>`](#workweek-config) | Optional | A page of Employee Wage results. |
| `cursor` | `String` | Optional | Value supplied in the subsequent request to fetch the next page of<br>Employee Wage results. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "workweek_configs": [
    {
      "id": "FY4VCAQN700GM",
      "start_of_week": "MON",
      "start_of_day_local_time": "10:00",
      "version": 11,
      "created_at": "2016-02-04T00:58:24Z",
      "updated_at": "2019-02-28T01:04:35Z"
    }
  ],
  "cursor": "2fofTniCgT0yIPAq26kmk0YyFQJZfbWkh73OOnlTHmTAx13NgED"
}
```

#### Location

Represents one of a business's locations.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The location's unique ID. |
| `name` | `String` | Optional | The location's name. Location names are set by the account owner and displayed<br>in the dashboard as the location's nickname |
| `address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `timezone` | `String` | Optional | The [IANA Timezone Database](https://www.iana.org/time-zones)<br>identifier for the location's timezone. |
| `capabilities` | [`Array<String (Location Capability)>`](#location-capability) | Optional | Indicates which Square features are enabled for the location.<br>See [LocationCapability](#type-locationcapability) for possible values |
| `status` | [`String (Location Status)`](#location-status) | Optional | Indicates the location's status. |
| `created_at` | `String` | Optional | The time when the location was created, in RFC 3339 format. |
| `merchant_id` | `String` | Optional | The identifier of the merchant that owns the location. |
| `country` | [`String (Country)`](#country) | Optional | Indicates the country associated with another entity, such as a business.<br>Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm). |
| `language_code` | `String` | Optional | The language associated with the location in<br>[BCP 47 format](https://tools.ietf.org/html/bcp47#appendix-A). |
| `currency` | [`String (Currency)`](#currency) | Optional | Indicates the associated currency for an amount of money. Values correspond<br>to [ISO 4217](https://wikipedia.org/wiki/ISO_4217). |
| `phone_number` | `String` | Optional | The location's phone_number. |
| `business_name` | `String` | Optional | The location's business_name which is shown to its customers. For example,<br>this is the name printed on its customer's receipts. |
| `type` | [`String (Location Type)`](#location-type) | Optional | Indicates the location's type. |
| `website_url` | `String` | Optional | The location's website, as set by the account owner in the Square dashboard.<br><br>Default: none; only exists if explicitly set. |
| `business_hours` | [`Business Hours Hash`](#business-hours) | Optional | Represents the hours of operation for a business location. |
| `business_email` | `String` | Optional | The email of the location. |
| `description` | `String` | Optional | The business description of the location. |
| `twitter_username` | `String` | Optional | The Twitter username of the location without the ' |
| `instagram_username` | `String` | Optional | The Instagram username of the location without the ' |
| `facebook_url` | `String` | Optional | The Facebook profile URL of the location. The URL should begin with 'facebook.com/'. |
| `coordinates` | [`Coordinates Hash`](#coordinates) | Optional | Latitude and longitude coordinates. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "address": null,
  "timezone": null,
  "capabilities": null,
  "status": null,
  "created_at": null,
  "merchant_id": null,
  "country": null,
  "language_code": null,
  "currency": null,
  "phone_number": null,
  "business_name": null,
  "type": null,
  "website_url": null,
  "business_hours": null,
  "business_email": null,
  "description": null,
  "twitter_username": null,
  "instagram_username": null,
  "facebook_url": null,
  "coordinates": null
}
```

#### Measurement Unit

Represents a unit of measurement to use with a quantity, such as ounces
or inches. Exactly one of the following fields are required: `custom_unit`,
`area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.

The `family` field describes the type of measurement. For example,
ounces are in the weight family.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `custom_unit` | [`Measurement Unit Custom Hash`](#measurement-unit-custom) | Optional | The information needed to define a custom unit, provided by the seller. |
| `area_unit` | [`String (Measurement Unit Area)`](#measurement-unit-area) | Optional | Unit of area used to measure a quantity. |
| `length_unit` | [`String (Measurement Unit Length)`](#measurement-unit-length) | Optional | The unit of length used to measure a quantity. |
| `volume_unit` | [`String (Measurement Unit Volume)`](#measurement-unit-volume) | Optional | The unit of volume used to measure a quantity. |
| `weight_unit` | [`String (Measurement Unit Weight)`](#measurement-unit-weight) | Optional | Unit of weight used to measure a quantity. |
| `generic_unit` | [`String (Measurement Unit Generic)`](#measurement-unit-generic) | Optional | A custom unit of measurement defined by the user. |

##### Example (as JSON)

```json
{
  "custom_unit": null,
  "area_unit": null,
  "length_unit": null,
  "volume_unit": null,
  "weight_unit": null,
  "generic_unit": null
}
```

#### Measurement Unit Custom

The information needed to define a custom unit, provided by the seller.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `name` | `String` | The name of the custom unit, for example "bushel". |
| `abbreviation` | `String` | The abbreviation of the custom unit, such as "bsh" (bushel). This appears<br>in the cart for the Point of Sale app, and in reports. |

##### Example (as JSON)

```json
{
  "name": "name0",
  "abbreviation": "abbreviation2"
}
```

#### Money

Represents an amount of money.

__Important:__ Unlike version 1 of the Connect API, __all monetary amounts
returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative
if they represent money being paid _by_ a merchant, instead of money being
paid _to_ a merchant.)

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `amount` | `Long` | Optional | The amount of money, in the smallest denomination of the<br>currency indicated by `currency`. For example, when `currency` is `USD`,<br>`amount` is in cents. |
| `currency` | [`String (Currency)`](#currency) | Optional | Indicates the associated currency for an amount of money. Values correspond<br>to [ISO 4217](https://wikipedia.org/wiki/ISO_4217). |

##### Example (as JSON)

```json
{
  "amount": null,
  "currency": null
}
```

#### Obtain Token Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `client_id` | `String` |  | The Square-issued ID of your application, available from the [application dashboard](https://connect.squareup.com/apps). |
| `client_secret` | `String` |  | The Square-issued application secret for your application,<br>available from the [application dashboard](https://connect.squareup.com/apps). |
| `code` | `String` | Optional | The authorization code to exchange.<br>This is required if `grant_type` is set to `authorization_code`, to indicate that<br>the application wants to exchange an authorization code for an OAuth access token. |
| `redirect_uri` | `String` | Optional | The redirect URL assigned in the [application dashboard](https://connect.squareup.com/apps). |
| `grant_type` | `String` |  | Specifies the method to request an OAuth access token.<br>Valid values are: `authorization_code`, `refresh_token`, and `migration_token` |
| `refresh_token` | `String` | Optional | A valid refresh token for generating a new OAuth access token.<br>A valid refresh token is required if `grant_type` is set to `refresh_token` ,<br>to indicate the application wants a replacement for an expired OAuth access token. |
| `migration_token` | `String` | Optional | Legacy OAuth access token obtained using a Connect API version prior<br>to 2019-03-13. This parameter is required if `grant_type` is set to<br>`migration_token` to indicate that the application wants to get a replacement<br>OAuth access token. The response also returns a refresh token.<br>For more information, see [Migrate to Using Refresh Tokens](/authz/oauth/migration). |

##### Example (as JSON)

```json
{
  "client_id": "client_id8",
  "client_secret": "client_secret8",
  "code": null,
  "redirect_uri": null,
  "grant_type": "grant_type4",
  "refresh_token": null,
  "migration_token": null
}
```

#### Obtain Token Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `access_token` | `String` | Optional | A valid OAuth access token. OAuth access tokens are 64 bytes long.<br>Provide the access token in a header with every request to Connect API<br>endpoints. See the [Build with OAuth](/authz/oauth/build-with-the-api) guide<br>for more information. |
| `token_type` | `String` | Optional | This value is always _bearer_. |
| `expires_at` | `String` | Optional | The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format. |
| `merchant_id` | `String` | Optional | The ID of the authorizing merchant's business. |
| `subscription_id` | `String` | Optional | __LEGACY FIELD__. The ID of a subscription plan the merchant signed up<br>for. Only present if the merchant signed up for a subscription during authorization. |
| `plan_id` | `String` | Optional | __LEGACY FIELD__. The ID of the subscription plan the merchant signed<br>up for. Only present if the merchant signed up for a subscription during<br>authorization. |
| `id_token` | `String` | Optional | Then OpenID token belonging to this this person. Only present if the OPENID scope is included in the authorize request. |
| `refresh_token` | `String` | Optional | A refresh token.<br>For more information, see [OAuth access token management](/authz/oauth/how-it-works#oauth-access-token-management). |

##### Example (as JSON)

```json
{
  "access_token": "ACCESS_TOKEN",
  "token_type": "bearer",
  "expires_at": "2006-01-02T15:04:05Z",
  "merchant_id": "MERCHANT_ID"
}
```

#### Order

Contains all information related to a single order to process with Square,
including line items that specify the products to purchase. Order objects also
include information on any associated tenders, refunds, and returns.

All Connect V2 Transactions have all been converted to Orders including all associated
itemization data.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The order's unique ID.<br><br>This field is read-only. |
| `location_id` | `String` |  | The ID of the merchant location this order is associated with. |
| `reference_id` | `String` | Optional | A client specified identifier to associate an entity in another system<br>with this order. |
| `source` | [`Order Source Hash`](#order-source) | Optional | Represents the origination details of an order. |
| `customer_id` | `String` | Optional | The [Customer](#type-customer) ID of the customer associated with the order. |
| `line_items` | [`Array<Order Line Item Hash>`](#order-line-item) | Optional | The line items included in the order. |
| `taxes` | [`Array<Order Line Item Tax Hash>`](#order-line-item-tax) | Optional | A list of taxes applied to this order. On read or retrieve, this list includes both<br>order-level and item-level taxes. When creating an Order, set your order-level taxes in this<br>list. |
| `discounts` | [`Array<Order Line Item Discount Hash>`](#order-line-item-discount) | Optional | A list of discounts applied to this order. On read or retrieve, this list includes both<br>order-level and item-level discounts. When creating an Order, set your order-level discounts in<br>this list. |
| `service_charges` | [`Array<Order Service Charge Hash>`](#order-service-charge) | Optional | A list of service charges applied to the order. |
| `fulfillments` | [`Array<Order Fulfillment Hash>`](#order-fulfillment) | Optional | Details on order fulfillment.<br><br>Orders can only be created with at most one fulfillment. However, orders returned<br>by the API may contain multiple fulfillments. |
| `returns` | [`Array<Order Return Hash>`](#order-return) | Optional | Collection of items from sale Orders being returned in this one. Normally part of an<br>Itemized Return or Exchange.  There will be exactly one `Return` object per sale Order being<br>referenced.<br><br>This field is read-only. |
| `return_amounts` | [`Order Money Amounts Hash`](#order-money-amounts) | Optional | A collection of various money amounts. |
| `net_amounts` | [`Order Money Amounts Hash`](#order-money-amounts) | Optional | A collection of various money amounts. |
| `rounding_adjustment` | [`Order Rounding Adjustment Hash`](#order-rounding-adjustment) | Optional | A rounding adjustment of the money being returned. Commonly used to apply Cash Rounding<br>when the minimum unit of account is smaller than the lowest physical denomination of currency. |
| `tenders` | [`Array<Tender Hash>`](#tender) | Optional | The Tenders which were used to pay for the Order. This field is read-only. |
| `refunds` | [`Array<Refund Hash>`](#refund) | Optional | The Refunds that are part of this Order. This field is read-only. |
| `created_at` | `String` | Optional | Timestamp for when the order was created. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".<br><br>This field is read-only. |
| `updated_at` | `String` | Optional | Timestamp for when the order was last updated. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".<br><br>This field is read-only. |
| `closed_at` | `String` | Optional | Timestamp for when the order was closed. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".<br><br>This field is read-only. |
| `state` | [`String (Order State)`](#order-state) | Optional | The state of the order. |
| `total_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_tax_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_discount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_service_charge_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "id": null,
  "location_id": "location_id4",
  "reference_id": null,
  "source": null,
  "customer_id": null,
  "line_items": null,
  "taxes": null,
  "discounts": null,
  "service_charges": null,
  "fulfillments": null,
  "returns": null,
  "return_amounts": null,
  "net_amounts": null,
  "rounding_adjustment": null,
  "tenders": null,
  "refunds": null,
  "created_at": null,
  "updated_at": null,
  "closed_at": null,
  "state": null,
  "total_money": null,
  "total_tax_money": null,
  "total_discount_money": null,
  "total_service_charge_money": null
}
```

#### Order Entry

A lightweight description of an [Order](#type-order) that is returned when `returned_entries` is true on a
[SearchOrderRequest](#type-searchorderrequest)

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order_id` | `String` | Optional | The id of the Order |
| `location_id` | `String` | Optional | The location id the Order belongs to. |

##### Example (as JSON)

```json
{
  "order_id": null,
  "location_id": null
}
```

#### Order Fulfillment

Contains details on how to fulfill this order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `type` | [`String (Order Fulfillment Type)`](#order-fulfillment-type) | Optional | The type of fulfillment. |
| `state` | [`String (Order Fulfillment State)`](#order-fulfillment-state) | Optional | The state of the fulfillment. |
| `pickup_details` | [`Order Fulfillment Pickup Details Hash`](#order-fulfillment-pickup-details) | Optional | Contains details necessary to fulfill a pickup order. |

##### Example (as JSON)

```json
{
  "type": null,
  "state": null,
  "pickup_details": null
}
```

#### Order Fulfillment Pickup Details

Contains details necessary to fulfill a pickup order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `recipient` | [`Order Fulfillment Recipient Hash`](#order-fulfillment-recipient) | Optional | The recipient of a fulfillment. |
| `expires_at` | `String` | Optional | The expiry [timestamp](#workingwithdates) in RFC 3339 format, e.g.,<br>"2016-09-04T23:59:33.123Z". This timestamp indicates when the pickup fulfillment will<br>expire if it is not accepted by the merchant. Expiration time can only be set up to 7 days in<br>the future. If not set, this pickup fulfillment will be automatically accepted when placed. |
| `auto_complete_duration` | `String` | Optional | The auto completion duration in RFC3339 duration format, e.g., "P1W3D". If set, an open<br>and accepted pickup fulfillment will automatically move to the `COMPLETED` state after this<br>period of time. If not set, this pickup fulfillment will remain accepted until it is canceled<br>or completed. |
| `schedule_type` | [`String (Order Fulfillment Pickup Details Schedule Type)`](#order-fulfillment-pickup-details-schedule-type) | Optional | The schedule type of the pickup fulfillment. |
| `pickup_at` | `String` | Optional | The pickup [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".<br>For fulfillments with the schedule type `ASAP`, this is automatically set to the current time<br>plus the expected duration to prepare the fulfillment. This represents the start of the<br>pickup window. |
| `pickup_window_duration` | `String` | Optional | The pickup window duration in RFC3339 duration format, e.g., "P1W3D". This duration<br>represents the window of time for which the order should be picked up after the `pickup_at`<br>time. Can be used as an informational guideline for merchants. |
| `prep_time_duration` | `String` | Optional | The preparation time duration in RFC3339 duration format, e.g., "P1W3D". This duration<br>indicates how long it takes the merchant to prepare this fulfillment. |
| `note` | `String` | Optional | A general note about the pickup fulfillment.<br><br>Notes are useful for providing additional instructions and are displayed in Square apps. |
| `placed_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the fulfillment was placed. |
| `accepted_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the fulfillment was accepted by the merchant. |
| `rejected_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the fulfillment was rejected. |
| `ready_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the merchant set the fulfillment as ready for pickup. |
| `expired_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the fulfillment expired. |
| `picked_up_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the fulfillment was picked up by the recipient. |
| `canceled_at` | `String` | Optional | The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z",<br>indicating when the fulfillment was canceled by the merchant or buyer. |
| `cancel_reason` | `String` | Optional | A description of why the pickup was canceled. Max length is 100 characters. |

##### Example (as JSON)

```json
{
  "recipient": null,
  "expires_at": null,
  "auto_complete_duration": null,
  "schedule_type": null,
  "pickup_at": null,
  "pickup_window_duration": null,
  "prep_time_duration": null,
  "note": null,
  "placed_at": null,
  "accepted_at": null,
  "rejected_at": null,
  "ready_at": null,
  "expired_at": null,
  "picked_up_at": null,
  "canceled_at": null,
  "cancel_reason": null
}
```

#### Order Fulfillment Recipient

The recipient of a fulfillment.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_id` | `String` | Optional | The Customer ID of the customer associated with the fulfillment.<br><br>If customer_id is provided, the corresponding recipient information fields<br>(`display_name`, `email_address`, and `phone_number`) are automatically populated from the relevant<br>customer profile. If the targeted profile information does not contain the necessary required<br>information, the request will result in an error. |
| `display_name` | `String` | Optional | The display name of the fulfillment recipient.<br><br>If provided, overrides the value from customer profile indicated by customer_id. |
| `email_address` | `String` | Optional | The email address of the fulfillment recipient.<br><br>If provided, overrides the value from customer profile indicated by customer_id. |
| `phone_number` | `String` | Optional | The phone number of the fulfillment recipient.<br><br>If provided, overrides the value from customer profile indicated by customer_id. |

##### Example (as JSON)

```json
{
  "customer_id": null,
  "display_name": null,
  "email_address": null,
  "phone_number": null
}
```

#### Order Line Item

Represents a line item in an order. Each line item describes a different
product to purchase, with its own quantity and price details.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the line item only within this order.<br><br>This field is read-only. |
| `name` | `String` | Optional | The name of the line item. |
| `quantity` | `String` |  | The quantity purchased, formatted as a decimal number.<br>For example: `"3"`.<br><br>Line items with a `quantity_unit` can have non-integer quantities.<br>For example: `"1.70000"`.<br><br>Orders Hub and older versions of Connect do not support non-integer quantities.<br>See [Decimal quantities with Orders hub and older versions of Connect](/more-apis/orders/overview#decimal-quantities). |
| `quantity_unit` | [`Order Quantity Unit Hash`](#order-quantity-unit) | Optional | Contains the measurement unit for a quantity and a precision which<br>specifies the number of digits after the decimal point for decimal quantities. |
| `note` | `String` | Optional | The note of the line item. |
| `catalog_object_id` | `String` | Optional | The [CatalogItemVariation](#type-catalogitemvariation) id applied to this line item. |
| `variation_name` | `String` | Optional | The name of the variation applied to this line item. |
| `modifiers` | [`Array<Order Line Item Modifier Hash>`](#order-line-item-modifier) | Optional | The [CatalogModifier](#type-catalogmodifier)s applied to this line item. |
| `taxes` | [`Array<Order Line Item Tax Hash>`](#order-line-item-tax) | Optional | A list of taxes applied to this line item. On read or retrieve, this list includes both<br>item-level taxes and any order-level taxes apportioned to this item. When creating an Order,<br>set your item-level taxes in this list. |
| `discounts` | [`Array<Order Line Item Discount Hash>`](#order-line-item-discount) | Optional | A list of discounts applied to this line item. On read or retrieve, this list includes<br>both item-level discounts and any order-level discounts apportioned to this item. When<br>creating an Order, set your item-level discounts in this list. |
| `base_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `variation_total_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `gross_sales_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_tax_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_discount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "uid": null,
  "name": null,
  "quantity": "quantity6",
  "quantity_unit": null,
  "note": null,
  "catalog_object_id": null,
  "variation_name": null,
  "modifiers": null,
  "taxes": null,
  "discounts": null,
  "base_price_money": null,
  "variation_total_price_money": null,
  "gross_sales_money": null,
  "total_tax_money": null,
  "total_discount_money": null,
  "total_money": null
}
```

#### Order Line Item Discount

Represents a discount that applies to one or more line items in an
order.

Fixed-amount, order-level discounts are distributed across all non-zero line item totals.
The amount distributed to each line item is relative to that item’s contribution to the order subtotal.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the discount only within this order.<br><br>This field is read-only. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogDiscount](#type-catalogdiscount). |
| `name` | `String` | Optional | The discount's name. |
| `type` | [`String (Order Line Item Discount Type)`](#order-line-item-discount-type) | Optional | Indicates how the discount is applied to the associated line item or order. |
| `percentage` | `String` | Optional | The percentage of the discount, as a string representation of a decimal number.<br>A value of `7.25` corresponds to a percentage of 7.25%.<br><br>The percentage won't be set for an amount-based discount. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `applied_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `scope` | [`String (Order Line Item Discount Scope)`](#order-line-item-discount-scope) | Optional | Indicates whether this is a line item or order level discount. |

##### Example (as JSON)

```json
{
  "uid": null,
  "catalog_object_id": null,
  "name": null,
  "type": null,
  "percentage": null,
  "amount_money": null,
  "applied_money": null,
  "scope": null
}
```

#### Order Line Item Modifier

A [CatalogModifier](#type-catalogmodifier).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the modifier only within this order.<br><br>This field is read-only. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogModifier](#type-catalogmodifier). |
| `name` | `String` | Optional | The name of the item modifier. |
| `base_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "uid": null,
  "catalog_object_id": null,
  "name": null,
  "base_price_money": null,
  "total_price_money": null
}
```

#### Order Line Item Tax

Represents a tax that applies to one or more line items in an order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the tax only within this order.<br><br>This field is read-only. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogTax](#type-catalogtax). |
| `name` | `String` | Optional | The tax's name. |
| `type` | [`String (Order Line Item Tax Type)`](#order-line-item-tax-type) | Optional | Indicates how the tax is applied to the associated line item or order. |
| `percentage` | `String` | Optional | The percentage of the tax, as a string representation of a decimal number.<br><br>A value of `7.25` corresponds to a percentage of 7.25%. |
| `applied_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `scope` | [`String (Order Line Item Tax Scope)`](#order-line-item-tax-scope) | Optional | Indicates whether this is a line item or order level tax. |

##### Example (as JSON)

```json
{
  "uid": null,
  "catalog_object_id": null,
  "name": null,
  "type": null,
  "percentage": null,
  "applied_money": null,
  "scope": null
}
```

#### Order Money Amounts

A collection of various money amounts.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `total_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `tax_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `discount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `tip_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `service_charge_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "total_money": null,
  "tax_money": null,
  "discount_money": null,
  "tip_money": null,
  "service_charge_money": null
}
```

#### Order Quantity Unit

Contains the measurement unit for a quantity and a precision which
specifies the number of digits after the decimal point for decimal quantities.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `measurement_unit` | [`Measurement Unit Hash`](#measurement-unit) | Optional | Represents a unit of measurement to use with a quantity, such as ounces<br>or inches. Exactly one of the following fields are required: `custom_unit`,<br>`area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.<br><br>The `family` field describes the type of measurement. For example,<br>ounces are in the weight family. |
| `precision` | `Integer` | Optional | For non-integer quantities, represents the number of digits after the decimal point that are<br>recorded for this quantity.<br><br>For example, a precision of 1 allows quantities like `"1.0"` and `"1.1"`, but not `"1.01"`.<br><br>Min: 0. Max: 5.<br><br>Orders Hub and older versions of Connect do not support non-integer quantities.<br>See [Decimal quantities with Orders hub and older versions of Connect](/more-apis/orders/overview#decimal-quantities). |

##### Example (as JSON)

```json
{
  "measurement_unit": null,
  "precision": null
}
```

#### Order Return

The set of line items, service charges, taxes, discounts, tips, etc. being returned in an Order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return only within this order.<br><br>This field is read-only. |
| `source_order_id` | `String` | Optional | Order which contains the original sale of these returned line items. This will be unset<br>for unlinked returns. |
| `return_line_items` | [`Array<Order Return Line Item Hash>`](#order-return-line-item) | Optional | Collection of line items which are being returned. |
| `return_service_charges` | [`Array<Order Return Service Charge Hash>`](#order-return-service-charge) | Optional | Collection of service charges which are being returned.<br><br>This field is read-only. |
| `return_taxes` | [`Array<Order Return Tax Hash>`](#order-return-tax) | Optional | Collection of taxes which are being returned. |
| `return_discounts` | [`Array<Order Return Discount Hash>`](#order-return-discount) | Optional | Collection of discounts which are being returned. |
| `rounding_adjustment` | [`Order Rounding Adjustment Hash`](#order-rounding-adjustment) | Optional | A rounding adjustment of the money being returned. Commonly used to apply Cash Rounding<br>when the minimum unit of account is smaller than the lowest physical denomination of currency. |
| `return_amounts` | [`Order Money Amounts Hash`](#order-money-amounts) | Optional | A collection of various money amounts. |

##### Example (as JSON)

```json
{
  "uid": null,
  "source_order_id": null,
  "return_line_items": null,
  "return_service_charges": null,
  "return_taxes": null,
  "return_discounts": null,
  "rounding_adjustment": null,
  "return_amounts": null
}
```

#### Order Return Discount

The line item discount being returned.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return discount only within this order.<br><br>This field is read-only. |
| `source_discount_uid` | `String` | Optional | `uid` of the Discount from the Order which contains the original application of this discount. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogDiscount](#type-catalogdiscount). |
| `name` | `String` | Optional | The discount's name. |
| `type` | [`String (Order Line Item Discount Type)`](#order-line-item-discount-type) | Optional | Indicates how the discount is applied to the associated line item or order. |
| `percentage` | `String` | Optional | The percentage of the tax, as a string representation of a decimal number.<br>A value of `7.25` corresponds to a percentage of 7.25%.<br><br>The percentage won't be set for an amount-based discount. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `applied_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `scope` | [`String (Order Line Item Discount Scope)`](#order-line-item-discount-scope) | Optional | Indicates whether this is a line item or order level discount. |

##### Example (as JSON)

```json
{
  "uid": null,
  "source_discount_uid": null,
  "catalog_object_id": null,
  "name": null,
  "type": null,
  "percentage": null,
  "amount_money": null,
  "applied_money": null,
  "scope": null
}
```

#### Order Return Line Item

The line item being returned in an Order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique identifier for this return line item entry. This is a read-only field. |
| `source_line_item_uid` | `String` | Optional | `uid` of the LineItem in the original sale Order. |
| `name` | `String` | Optional | The name of the line item. |
| `quantity` | `String` |  | The quantity returned, formatted as a decimal number.<br>For example: `"3"`.<br><br>Line items with a `quantity_unit` can have non-integer quantities.<br>For example: `"1.70000"`. |
| `quantity_unit` | [`Order Quantity Unit Hash`](#order-quantity-unit) | Optional | Contains the measurement unit for a quantity and a precision which<br>specifies the number of digits after the decimal point for decimal quantities. |
| `note` | `String` | Optional | The note of the returned line item. |
| `catalog_object_id` | `String` | Optional | The [CatalogItemVariation](#type-catalogitemvariation) id applied to this returned line item. |
| `variation_name` | `String` | Optional | The name of the variation applied to this returned line item. |
| `return_modifiers` | [`Array<Order Return Line Item Modifier Hash>`](#order-return-line-item-modifier) | Optional | The [CatalogModifier](#type-catalogmodifier)s applied to this line item. |
| `return_taxes` | [`Array<Order Return Tax Hash>`](#order-return-tax) | Optional | A list of taxes applied to this line item. On read or retrieve, this list includes both<br>item-level taxes and any return-level taxes apportioned to this item. |
| `return_discounts` | [`Array<Order Return Discount Hash>`](#order-return-discount) | Optional | A list of discounts applied to this line item. On read or retrieve, this list includes<br>both item-level discounts and any return-level discounts apportioned to this item. |
| `base_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `variation_total_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `gross_return_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_tax_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_discount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "uid": null,
  "source_line_item_uid": null,
  "name": null,
  "quantity": "quantity6",
  "quantity_unit": null,
  "note": null,
  "catalog_object_id": null,
  "variation_name": null,
  "return_modifiers": null,
  "return_taxes": null,
  "return_discounts": null,
  "base_price_money": null,
  "variation_total_price_money": null,
  "gross_return_money": null,
  "total_tax_money": null,
  "total_discount_money": null,
  "total_money": null
}
```

#### Order Return Line Item Modifier

A line item modifier being returned.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return modifier only within this order.<br><br>This field is read-only. |
| `source_modifier_uid` | `String` | Optional | `uid` of the Modifier from the LineItem from the Order which contains the<br>original sale of this line item modifier. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogModifier](#type-catalogmodifier). |
| `name` | `String` | Optional | The name of the item modifier. |
| `base_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_price_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "uid": null,
  "source_modifier_uid": null,
  "catalog_object_id": null,
  "name": null,
  "base_price_money": null,
  "total_price_money": null
}
```

#### Order Return Service Charge

The service charge applied to the original order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return service charge only within this order.<br><br>This field is read-only. |
| `source_service_charge_uid` | `String` | Optional | `uid` of the Service Charge from the Order which contains the original charge of this service charge,<br>null for unlinked returns. |
| `name` | `String` | Optional | The name of the service charge. |
| `catalog_object_id` | `String` | Optional | The ID referencing the service charge [CatalogObject](#type-catalogobject) |
| `percentage` | `String` | Optional | The percentage of the service charge, as a string representation of a decimal number.<br><br>A value of `7.25` corresponds to a percentage of 7.25%.<br><br>Exactly one of percentage or amount_money should be set. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `applied_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_tax_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `calculation_phase` | [`String (Order Service Charge Calculation Phase)`](#order-service-charge-calculation-phase) | Optional | Represents a phase in the process of calculating order totals. Service charges will<br>be applied after the phase indicated.<br><br>[Read more about how order totals are calculated.](/orders-api/how-it-works#how-totals-are-calculated) |
| `taxable` | `Boolean` | Optional | Indicates whether the surcharge can be taxed. Service charges calculated in the<br>`TOTAL_PHASE` cannot be marked as taxable. |
| `return_taxes` | [`Array<Order Return Tax Hash>`](#order-return-tax) | Optional | The taxes which apply to the service charge. Return-level taxes apply by default to<br>service charge calculated in the `SUBTOTAL_PHASE` if the service charge is<br>marked as taxable. |

##### Example (as JSON)

```json
{
  "uid": null,
  "source_service_charge_uid": null,
  "name": null,
  "catalog_object_id": null,
  "percentage": null,
  "amount_money": null,
  "applied_money": null,
  "total_money": null,
  "total_tax_money": null,
  "calculation_phase": null,
  "taxable": null,
  "return_taxes": null
}
```

#### Order Return Tax

The line item tax being returned.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the return tax only within this order.<br><br>This field is read-only. |
| `source_tax_uid` | `String` | Optional | `uid` of the Tax from the Order which contains the original charge of this tax. |
| `catalog_object_id` | `String` | Optional | The catalog object id referencing [CatalogTax](#type-catalogtax). |
| `name` | `String` | Optional | The tax's name. |
| `type` | [`String (Order Line Item Tax Type)`](#order-line-item-tax-type) | Optional | Indicates how the tax is applied to the associated line item or order. |
| `percentage` | `String` | Optional | The percentage of the tax, as a string representation of a decimal number.<br><br>A value of `7.25` corresponds to a percentage of 7.25%. |
| `applied_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `scope` | [`String (Order Line Item Tax Scope)`](#order-line-item-tax-scope) | Optional | Indicates whether this is a line item or order level tax. |

##### Example (as JSON)

```json
{
  "uid": null,
  "source_tax_uid": null,
  "catalog_object_id": null,
  "name": null,
  "type": null,
  "percentage": null,
  "applied_money": null,
  "scope": null
}
```

#### Order Rounding Adjustment

A rounding adjustment of the money being returned. Commonly used to apply Cash Rounding
when the minimum unit of account is smaller than the lowest physical denomination of currency.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the rounding adjustment only within this order.<br><br>This field is read-only. |
| `name` | `String` | Optional | The name of the rounding adjustment from the original sale Order. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "uid": null,
  "name": null,
  "amount_money": null
}
```

#### Order Service Charge

Represents a service charge applied to an order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `uid` | `String` | Optional | Unique ID that identifies the service charge only within this order.<br><br>This field is read-only. |
| `name` | `String` | Optional | The name of the service charge. |
| `catalog_object_id` | `String` | Optional | The catalog object ID referencing the service charge [CatalogObject](#type-catalogobject). |
| `percentage` | `String` | Optional | The service charge percentage, as a string representation of a decimal number.<br><br>For example, `7.25` indicates 7.25%<br><br>Exactly one of `percentage` or `amount_money` should be set. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `applied_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `total_tax_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `calculation_phase` | [`String (Order Service Charge Calculation Phase)`](#order-service-charge-calculation-phase) | Optional | Represents a phase in the process of calculating order totals. Service charges will<br>be applied after the phase indicated.<br><br>[Read more about how order totals are calculated.](/orders-api/how-it-works#how-totals-are-calculated) |
| `taxable` | `Boolean` | Optional | Indicates whether the service charge can be taxed. If set to `true`, any order-level<br>taxes will automatically apply to this service charge. Note that service charges calculated<br>in the `TOTAL_PHASE` cannot be marked as taxable. |
| `taxes` | [`Array<Order Line Item Tax Hash>`](#order-line-item-tax) | Optional | Taxes applied to the service charge. By default, order-level taxes apply to service<br>charges calculated in the `SUBTOTAL_PHASE` if `taxable` is set to `true`. |

##### Example (as JSON)

```json
{
  "uid": null,
  "name": null,
  "catalog_object_id": null,
  "percentage": null,
  "amount_money": null,
  "applied_money": null,
  "total_money": null,
  "total_tax_money": null,
  "calculation_phase": null,
  "taxable": null,
  "taxes": null
}
```

#### Order Source

Represents the origination details of an order.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The name used to identify the place (physical or digital) that an order originates.<br>If unset, the name defaults to the name of the application that created the order. |

##### Example (as JSON)

```json
{
  "name": null
}
```

#### Refund

Represents a refund processed for a Square transaction.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` |  | The refund's unique ID. |
| `location_id` | `String` |  | The ID of the refund's associated location. |
| `transaction_id` | `String` |  | The ID of the transaction that the refunded tender is part of. |
| `tender_id` | `String` |  | The ID of the refunded tender. |
| `created_at` | `String` | Optional | The time when the refund was created, in RFC 3339 format. |
| `reason` | `String` |  | The reason for the refund being issued. |
| `amount_money` | [`Money Hash`](#money) |  | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `status` | [`String (Refund Status)`](#refund-status) |  | Indicates a refund's current status. |
| `processing_fee_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `additional_recipients` | [`Array<Additional Recipient Hash>`](#additional-recipient) | Optional | Additional recipients (other than the merchant) receiving a portion of this refund.<br>For example, fees assessed on a refund of a purchase by a third party integration. |

##### Example (as JSON)

```json
{
  "id": "id0",
  "location_id": "location_id4",
  "transaction_id": "transaction_id8",
  "tender_id": "tender_id8",
  "created_at": null,
  "reason": "reason4",
  "amount_money": {
    "amount": null,
    "currency": null
  },
  "status": "PENDING",
  "processing_fee_money": null,
  "additional_recipients": null
}
```

#### Register Domain Request

Defines the parameters that can be included in the body of
a request to the RegisterDomain endpoint.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `domain_name` | `String` | A domain name as described in RFC-1034 that will be registered with ApplePay |

##### Example (as JSON)

```json
{
  "domain_name": "domain_name6"
}
```

#### Register Domain Response

Defines the fields that are included in the response body of
a request to the RegisterDomain endpoint.

Either `errors` or `status` will be present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `status` | [`String (Register Domain Response Status)`](#register-domain-response-status) | Optional | The status of domain registration. |

##### Example (as JSON)

```json
{
  "status": "VERIFIED"
}
```

#### Renew Token Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `access_token` | `String` | Optional | The token you want to renew. |

##### Example (as JSON)

```json
{
  "request_url": "/oauth2/clients/{client_id}/access-token/renew",
  "request_body": {
    "access_token": "ACCESS_TOKEN"
  }
}
```

#### Renew Token Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `access_token` | `String` | Optional | The renewed access token.<br>This value might be different from the `access_token` you provided in your request.<br>You provide this token in a header with every request to Connect API endpoints.<br>See [Request and response headers](https://docs.connect.squareup.com/api/connect/v2/#requestandresponseheaders) for the format of this header. |
| `token_type` | `String` | Optional | This value is always _bearer_. |
| `expires_at` | `String` | Optional | The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format. |
| `merchant_id` | `String` | Optional | The ID of the authorizing merchant's business. |
| `subscription_id` | `String` | Optional | __LEGACY FIELD__. The ID of the merchant subscription associated with<br>the authorization. Only present if the merchant signed up for a subscription<br>during authorization. |
| `plan_id` | `String` | Optional | __LEGACY FIELD__. The ID of the subscription plan the merchant signed<br>up for. Only present if the merchant signed up for a subscription during<br>authorization. |

##### Example (as JSON)

```json
{
  "access_token": "ACCESS_TOKEN",
  "token_type": "bearer",
  "expires_at": "2006-01-02T15:04:05Z",
  "merchant_id": "MERCHANT_ID"
}
```

#### Retrieve Catalog Object Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `include_related_objects` | `Boolean` | Optional | If `true`, the response will include additional objects that are related to the<br>requested object, as follows:<br><br>If the `object` field of the response contains a [CatalogItem](#type-catalogitem),<br>its associated [CatalogCategory](#type-catalogcategory), [CatalogTax](#type-catalogtax)es,<br>[CatalogImage](#type-catalogimage)s and [CatalogModifierList](#type-catalogmodifierlist)s<br>will be returned in the `related_objects` field of the response. If the `object`<br>field of the response contains a [CatalogItemVariation](#type-catalogitemvariation),<br>its parent [CatalogItem](#type-catalogitem) will be returned in the `related_objects` field of <br>the response.<br><br>Default value: `false` |

##### Example (as JSON)

```json
{
  "request_params": "?include_related_objects=true"
}
```

#### Retrieve Catalog Object Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `object` | [`Catalog Object Hash`](#catalog-object) | Optional | - |
| `related_objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | A list of [CatalogObject](#type-catalogobject)s referenced by the object in the `object` field. |

##### Example (as JSON)

```json
{
  "object": {
    "type": "ITEM",
    "id": "W62UWFY35CWMYGVWK6TWJDNI",
    "updated_at": "2016-11-16T22:25:24.878Z",
    "version": 1479335124878,
    "is_deleted": false,
    "present_at_all_locations": true,
    "item_data": {
      "name": "Tea",
      "description": "Hot Leaf Juice",
      "category_id": "BJNQCF2FJ6S6UIDT65ABHLRX",
      "tax_ids": [
        "HURXQOOAIC4IZSI2BEXQRYFY"
      ],
      "variations": [
        {
          "type": "ITEM_VARIATION",
          "id": "2TZFAOHWGG7PAK2QEXWYPZSP",
          "updated_at": "2016-11-16T22:25:24.878Z",
          "version": 1479335124878,
          "is_deleted": false,
          "present_at_all_locations": true,
          "item_variation_data": {
            "item_id": "W62UWFY35CWMYGVWK6TWJDNI",
            "name": "Mug",
            "ordinal": 0,
            "pricing_type": "FIXED_PRICING",
            "price_money": {
              "amount": 150,
              "currency": "USD"
            }
          }
        }
      ]
    }
  },
  "related_objects": [
    {
      "type": "CATEGORY",
      "id": "BJNQCF2FJ6S6UIDT65ABHLRX",
      "updated_at": "2016-11-16T22:25:24.878Z",
      "version": 1479335124878,
      "is_deleted": false,
      "present_at_all_locations": true,
      "category_data": {
        "name": "Beverages"
      }
    },
    {
      "type": "TAX",
      "id": "HURXQOOAIC4IZSI2BEXQRYFY",
      "updated_at": "2016-11-16T22:25:24.878Z",
      "version": 1479335124878,
      "is_deleted": false,
      "present_at_all_locations": true,
      "tax_data": {
        "name": "Sales Tax",
        "calculation_phase": "TAX_SUBTOTAL_PHASE",
        "inclusion_type": "ADDITIVE",
        "percentage": "5.0",
        "enabled": true
      }
    }
  ]
}
```

#### Retrieve Customer Response

Defines the fields that are included in the response body of
a request to the RetrieveCustomer endpoint.

One of `errors` or `customer` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `customer` | [`Customer Hash`](#customer) | Optional | Represents one of a business's customers, which can have one or more<br>cards on file associated with it. |

##### Example (as JSON)

```json
{
  "customer": {
    "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
    "created_at": "2016-03-23T20:21:54.859Z",
    "updated_at": "2016-03-23T20:21:54.859Z",
    "given_name": "Amelia",
    "family_name": "Earhart",
    "email_address": "Amelia.Earhart@example.com",
    "address": {
      "address_line_1": "500 Electric Ave",
      "address_line_2": "Suite 600",
      "locality": "New York",
      "administrative_district_level_1": "NY",
      "postal_code": "10003",
      "country": "US"
    },
    "phone_number": "1-212-555-4240",
    "reference_id": "YOUR_REFERENCE_ID",
    "note": "a customer",
    "groups": [
      {
        "id": "16894e93-96eb-4ced-b24b-f71d42bf084c",
        "name": "Aviation Enthusiasts"
      }
    ]
  }
}
```

#### Retrieve Employee Response

Defines the fields that are included in the response body of
a request to the RetrieveEmployee endpoint.

One of `errors` or `employee` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee` | [`Employee Hash`](#employee) | Optional | An employee created in the **Square Dashboard** account of a business. <br>Used by the Labor API. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "employee": null,
  "errors": null
}
```

#### Retrieve Inventory Adjustment Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `adjustment` | [`Inventory Adjustment Hash`](#inventory-adjustment) | Optional | Represents a change in state or quantity of product inventory at a<br>particular time and location. |

##### Example (as JSON)

```json
{
  "errors": [],
  "adjustment": {
    "id": "UDMOEO78BG6GYWA2XDRYX3KB",
    "reference_id": "4a366069-4096-47a2-99a5-0084ac879509",
    "from_state": "IN_STOCK",
    "to_state": "SOLD",
    "location_id": "C6W5YS5QM06F5",
    "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
    "catalog_object_type": "ITEM_VARIATION",
    "quantity": "7",
    "total_price_money": {
      "amount": 4550,
      "currency": "USD"
    },
    "occurred_at": "2016-11-16T25:44:22.837Z",
    "created_at": "2016-11-17T13:02:15.142Z",
    "source": {
      "product": "SQUARE_POS",
      "application_id": "416ff29c-86c4-4feb-b58c-9705f21f3ea0",
      "name": "Square Point of Sale 4.37"
    },
    "employee_id": "LRK57NSQ5X7PUD05"
  }
}
```

#### Retrieve Inventory Changes Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_ids` | `String` | Optional | The [Location](#type-location) IDs to look up as a comma-separated<br>list. An empty list queries all locations. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_params": "?location_ids=&cursor="
}
```

#### Retrieve Inventory Changes Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `changes` | [`Array<Inventory Change Hash>`](#inventory-change) | Optional | The set of inventory changes for the requested object and locations. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset,<br>this is the final response.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "errors": [],
  "changes": [
    {
      "type": "ADJUSTMENT",
      "adjustment": {
        "id": "OJKJIUANKLMLQANZADNPLKAD",
        "reference_id": "d8207693-168f-4b44-a2fd-a7ff533ddd26",
        "from_state": "IN_STOCK",
        "to_state": "SOLD",
        "location_id": "C6W5YS5QM06F5",
        "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
        "catalog_object_type": "ITEM_VARIATION",
        "quantity": "3",
        "total_price_money": {
          "amount": 5000,
          "currency": "USD"
        },
        "occurred_at": "2016-11-16T22:25:24.878Z",
        "created_at": "2016-11-16T22:25:24.878Z",
        "source": {
          "product": "SQUARE_POS",
          "application_id": "416ff29c-86c4-4feb-b58c-9705f21f3ea0",
          "name": "Square Point of Sale 4.37"
        },
        "employee_id": "AV7YRCGI2H1J5NQ8E1XIZCNA",
        "transaction_id": "5APV6JYK1SNCZD11AND2RX1Z"
      }
    }
  ]
}
```

#### Retrieve Inventory Count Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_ids` | `String` | Optional | The [Location](#type-location) IDs to look up as a comma-separated<br>list. An empty list queries all locations. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "request_params": "?location_ids=C6W5YS5QM06F5&cursor="
}
```

#### Retrieve Inventory Count Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `counts` | [`Array<Inventory Count Hash>`](#inventory-count) | Optional | The current calculated inventory counts for the requested object and<br>locations. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset,<br>this is the final response.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "errors": [],
  "counts": [
    {
      "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
      "catalog_object_type": "ITEM_VARIATION",
      "state": "IN_STOCK",
      "location_id": "C6W5YS5QM06F5",
      "quantity": "22",
      "calculated_at": "2016-11-16T22:28:01.223Z"
    }
  ]
}
```

#### Retrieve Inventory Physical Count Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `count` | [`Inventory Physical Count Hash`](#inventory-physical-count) | Optional | Represents the quantity of an item variation that is physically present<br>at a specific location, verified by a seller or a seller's employee. For example,<br>a physical count might come from an employee counting the item variations on<br>hand or from syncing with an external system. |

##### Example (as JSON)

```json
{
  "errors": [],
  "count": {
    "id": "ANZADNPLKADOJKJIUANKLMLQ",
    "reference_id": "f857ec37-f9a0-4458-8e23-5b5e0bea4e53",
    "catalog_object_id": "W62UWFY35CWMYGVWK6TWJDNI",
    "catalog_object_type": "ITEM_VARIATION",
    "state": "IN_STOCK",
    "location_id": "C6W5YS5QM06F5",
    "quantity": "15",
    "source": {
      "product": "SQUARE_POS",
      "application_id": "416ff29c-86c4-4feb-b58c-9705f21f3ea0",
      "name": "Square Point of Sale 4.37"
    },
    "employee_id": "LRK57NSQ5X7PUD05",
    "occurred_at": "2016-11-16T22:25:24.878Z",
    "created_at": "2016-11-16T22:25:24.878Z"
  }
}
```

#### Retrieve Transaction Response

Defines the fields that are included in the response body of
a request to the RetrieveTransaction endpoint.

One of `errors` or `transaction` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `transaction` | [`Transaction Hash`](#transaction) | Optional | Represents a transaction processed with Square, either with the<br>Connect API or with Square Point of Sale.<br><br>The `tenders` field of this object lists all methods of payment used to pay in<br>the transaction. |

##### Example (as JSON)

```json
{
  "transaction": {
    "id": "KnL67ZIwXCPtzOrqj0HrkxMF",
    "location_id": "18YC4JDH91E1H",
    "created_at": "2016-03-10T22:57:56Z",
    "tenders": [
      {
        "id": "MtZRYYdDrYNQbOvV7nbuBvMF",
        "location_id": "18YC4JDH91E1H",
        "transaction_id": "KnL67ZIwXCPtzOrqj0HrkxMF",
        "created_at": "2016-03-10T22:57:56Z",
        "note": "some optional note",
        "amount_money": {
          "amount": 5000,
          "currency": "USD"
        },
        "processing_fee_money": {
          "amount": 138,
          "currency": "USD"
        },
        "type": "CARD",
        "card_details": {
          "status": "CAPTURED",
          "card": {
            "card_brand": "VISA",
            "last_4": "1111"
          },
          "entry_method": "KEYED"
        },
        "additional_recipients": [
          {
            "location_id": "057P5VYJ4A5X1",
            "description": "Application fees",
            "amount_money": {
              "amount": 20,
              "currency": "USD"
            }
          }
        ]
      }
    ],
    "reference_id": "some optional reference id",
    "product": "EXTERNAL_API"
  }
}
```

#### Revoke Token Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `client_id` | `String` | Optional | Your application's ID, available from the [application dashboard](https://connect.squareup.com/apps). |
| `access_token` | `String` | Optional | The access token of the merchant whose token you want to revoke.<br>Do not provide a value for merchant_id if you provide this parameter. |
| `merchant_id` | `String` | Optional | The ID of the merchant whose token you want to revoke.<br>Do not provide a value for access_token if you provide this parameter. |

##### Example (as JSON)

```json
{
  "request_url": "/oauth2/revoke",
  "request_body": {
    "access_token": "ACCESS_TOKEN",
    "client_id": "CLIENT_ID"
  }
}
```

#### Revoke Token Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `success` | `Boolean` | Optional | If the request is successful, this is true. |

##### Example (as JSON)

```json
{
  "success": true
}
```

#### Search Catalog Objects Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Optional | The pagination cursor returned in the previous response. Leave unset for an initial request.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `object_types` | [`Array<String (Catalog Object Type)>`](#catalog-object-type) | Optional | The desired set of object types to appear in the search results. The legal values are taken from the<br>[CatalogObjectType](#type-catalogobjecttype) enumeration, namely `"ITEM"`, `"ITEM_VARIATION"`, `"CATEGORY"`,<br>`"DISCOUNT"`, `"TAX"`, `"MODIFIER"`, or `"MODIFIER_LIST"`.<br>See [CatalogObjectType](#type-catalogobjecttype) for possible values |
| `include_deleted_objects` | `Boolean` | Optional | If `true`, deleted objects will be included in the results. Deleted objects will have their<br>`is_deleted` field set to `true`. |
| `include_related_objects` | `Boolean` | Optional | If `true`, the response will include additional objects that are related to the<br>requested object, as follows:<br><br>If a [CatalogItem](#type-catalogitem) is returned in the object field of the response,<br>its associated [CatalogCategory](#type-catalogcategory), [CatalogTax](#type-catalogtax)es,<br>[CatalogImage](#type-catalogimage)s and [CatalogModifierList](#type-catalogmodifierlist)s<br>will be included in the `related_objects` field of the response.<br><br>If a [CatalogItemVariation](#type-catalogitemvariation) is returned in the object field of the<br>response, its parent [CatalogItem](#type-catalogitem) will be included in the `related_objects` field of<br>the response. |
| `begin_time` | `String` | Optional | Return objects modified after this [timestamp](#workingwithdates), in RFC 3339<br>format, e.g., "2016-09-04T23:59:33.123Z". The timestamp is exclusive - objects with a<br>timestamp equal to `begin_time` will not be included in the response. |
| `query` | [`Catalog Query Hash`](#catalog-query) | Optional | A query to be applied to a [SearchCatalogObjectsRequest](#type-searchcatalogobjectsrequest).<br>Only one query field may be present.<br><br>Where an attribute name is required, it should be specified as the name of any field<br>marked "searchable" from the structured data types for the desired result object type(s)<br>([CatalogItem](#type-catalogitem), [CatalogItemVariation](#type-catalogitemvariation),<br>[CatalogCategory](#type-catalogcategory), [CatalogTax](#type-catalogtax),<br>[CatalogDiscount](#type-catalogdiscount), [CatalogModifierList](#type-catalogmodifierlist),<br>[CatalogModifier](#type-catalogmodifier)).<br><br>For example, a query that should return Items may specify attribute names from<br>any of the searchable fields of the [CatalogItem](#type-catalogitem) data type, namely<br>`"name"`, `"description"`, and `"abbreviation"`. |
| `limit` | `Integer` | Optional | A limit on the number of results to be returned in a single page. The limit is advisory -<br>the implementation may return more or fewer results. If the supplied limit is negative, zero, or<br>is higher than the maximum limit of 1,000, it will be ignored. |

##### Example (as JSON)

```json
{
  "request_body": {
    "object_types": [
      "ITEM"
    ],
    "query": {
      "prefix_query": {
        "attribute_name": "name",
        "attribute_prefix": "tea"
      }
    },
    "limit": 100
  }
}
```

#### Search Catalog Objects Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset, this is the final response.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | The [CatalogObject](#type-catalogobject)s returned. |
| `related_objects` | [`Array<Catalog Object Hash>`](#catalog-object) | Optional | A list of [CatalogObject](#type-catalogobject)s referenced by the objects in the `objects` field. |

##### Example (as JSON)

```json
{
  "objects": [
    {
      "type": "ITEM",
      "id": "X5DZ5NWWAQ44CKBLKIFQGOWK",
      "updated_at": "2017-10-26T15:41:32.337Z",
      "version": 1509032492337,
      "is_deleted": false,
      "present_at_all_locations": true,
      "item_data": {
        "name": "Tea - Black",
        "description": "A delicious blend of black tea.",
        "category_id": "E7CLE5RZZ744BHWVQQEAHI2C",
        "product_type": "REGULAR",
        "tax_ids": [
          "ZXITPM6RWHZ7GZ7EIP3YKECM"
        ],
        "variations": [
          {
            "type": "ITEM_VARIATION",
            "id": "5GSZPX6EU7MM75S57OONG3V5",
            "updated_at": "2017-10-26T15:27:31.626Z",
            "version": 1509031651626,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "X5DZ5NWWAQ44CKBLKIFQGOWK",
              "name": "Regular",
              "ordinal": 1,
              "price_money": {
                "amount": 150,
                "currency": "USD"
              },
              "pricing_type": "FIXED_PRICING"
            }
          },
          {
            "type": "ITEM_VARIATION",
            "id": "XVLBN7DU6JTWHJTG5F265B43",
            "updated_at": "2017-10-26T15:27:31.626Z",
            "version": 1509031651626,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "X5DZ5NWWAQ44CKBLKIFQGOWK",
              "name": "Large",
              "ordinal": 2,
              "price_money": {
                "amount": 225,
                "currency": "USD"
              },
              "pricing_type": "FIXED_PRICING"
            }
          }
        ],
        "visibility": "PRIVATE"
      }
    },
    {
      "type": "ITEM",
      "id": "NNNEM3LA656Q46NXLWCNI7S5",
      "updated_at": "2017-10-26T15:41:23.232Z",
      "version": 1509032483232,
      "is_deleted": false,
      "present_at_all_locations": true,
      "item_data": {
        "name": "Tea - Green",
        "description": "Relaxing green herbal tea.",
        "category_id": "E7CLE5RZZ744BHWVQQEAHI2C",
        "product_type": "REGULAR",
        "tax_ids": [
          "ZXITPM6RWHZ7GZ7EIP3YKECM"
        ],
        "variations": [
          {
            "type": "ITEM_VARIATION",
            "id": "FHYBVIA6NVBCSOVETA62WEA4",
            "updated_at": "2017-10-26T15:29:00.524Z",
            "version": 1509031740524,
            "is_deleted": false,
            "present_at_all_locations": true,
            "item_variation_data": {
              "item_id": "NNNEM3LA656Q46NXLWCNI7S5",
              "name": "Regular",
              "ordinal": 1,
              "price_money": {
                "amount": 150,
                "currency": "USD"
              },
              "pricing_type": "FIXED_PRICING"
            }
          }
        ],
        "visibility": "PRIVATE"
      }
    }
  ]
}
```

#### Search Customers Request

Defines the fields included in the request body for the
SearchCustomers endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Optional | Include the pagination cursor in subsequent calls to this endpoint to retrieve<br>the next set of results associated with the original query.<br><br>See [Pagination](/basics/api101/pagination) for more information. |
| `limit` | `Long` | Optional | A limit on the number of results to be returned in a single page.<br>The limit is advisory - the implementation may return more or fewer results.<br>If the supplied limit is negative, zero, or is higher than the maximum limit<br>of 1,000, it will be ignored. |
| `query` | [`Customer Query Hash`](#customer-query) | Optional | Represents a query (filtering and sorting criteria) used to search<br>for customer profiles. |

##### Example (as JSON)

```json
{
  "request_body": {
    "query": {
      "filter": {
        "creation_source": {
          "values": [
            "THIRD_PARTY"
          ],
          "rule": "INCLUDE"
        },
        "created_at": {
          "start_at": "2018-01-01T00:00:00-00:00",
          "end_at": "2018-02-01T00:00:00-00:00"
        }
      },
      "sort": {
        "field": "CREATED_AT",
        "order": "ASC"
      }
    },
    "limit": 2
  }
}
```

#### Search Customers Response

Defines the fields that are included in the response body of
a request to the SearchCustomers endpoint.

One of `errors` or `customers` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `customers` | [`Array<Customer Hash>`](#customer) | Optional | An array of `Customer` objects that match a query. |
| `cursor` | `String` | Optional | A pagination cursor that can be used during subsequent calls<br>to SearchCustomers to retrieve the next set of results associated<br>with the original query. Pagination cursors are only present when<br>a request succeeds and additional results are available.<br><br>See [Pagination](/basics/api101/pagination) for more information. |

##### Example (as JSON)

```json
{
  "customers": [
    {
      "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
      "created_at": "2018-01-23T20:21:54.859Z",
      "updated_at": "2018-04-20T10:02:43.083Z",
      "given_name": "James",
      "family_name": "Bond",
      "email_address": "james.bond@example.com",
      "address": {
        "address_line_1": "505 Electric Ave",
        "address_line_2": "Suite 600",
        "locality": "New York",
        "administrative_district_level_1": "NY",
        "postal_code": "10003",
        "country": "US"
      },
      "phone_number": "1-212-555-4250",
      "reference_id": "YOUR_REFERENCE_ID_2",
      "creation_source": "THIRD_PARTY"
    },
    {
      "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
      "created_at": "2018-01-30T14:10:54.859Z",
      "updated_at": "2018-03-08T18:25:54.859Z",
      "given_name": "Amelia",
      "family_name": "Earhart",
      "email_address": "amelia.earhart@example.com",
      "address": {
        "address_line_1": "500 Electric Ave",
        "address_line_2": "Suite 600",
        "locality": "New York",
        "administrative_district_level_1": "NY",
        "postal_code": "10003",
        "country": "US"
      },
      "phone_number": "1-212-555-4240",
      "reference_id": "YOUR_REFERENCE_ID_1",
      "note": "a customer",
      "creation_source": "THIRD_PARTY"
    }
  ],
  "cursor": "9dpS093Uy12AzeE"
}
```

#### Search Orders Customer Filter

Filter based on Order `customer_id` and any Tender `customer_id`
associated with the Order. Does not filter based on the
[FulfillmentRecipient](#type-orderfulfillmentrecipient) `customer_id`.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `customer_ids` | `Array<String>` | Optional | Filter by orders with any of the listed `customer_id`s.<br><br>Max: 10 `customer_id`s. |

##### Example (as JSON)

```json
{
  "customer_ids": null
}
```

#### Search Orders Date Time Filter

Filter for `Order` objects based on whether their `CREATED_AT`,
`CLOSED_AT` or `UPDATED_AT` timestamps fall within a specified time range.
You can specify the time range and which timestamp to filter for. You can filter
for only one time range at a time.

For each time range, the start time and end time are inclusive. If the end time
is absent, it defaults to the time of the first request for the cursor.

__Important:__ If you use the DateTimeFilter to filter for `CLOSED_AT` or `UPDATED_AT`,
you must also set the [OrdersSort](#type-searchorderordersort).
The TimeRange used in DateTimeFilter must correspond to the `sort_field` in
the [OrdersSort](#type-searchorderordersort) object.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `created_at` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |
| `updated_at` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |
| `closed_at` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |

##### Example (as JSON)

```json
{
  "created_at": null,
  "updated_at": null,
  "closed_at": null
}
```

#### Search Orders Filter

Filter options to use for a query. Multiple filters will be ANDed together.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `state_filter` | [`Search Orders State Filter Hash`](#search-orders-state-filter) | Optional | Filter by current Order `state`. |
| `date_time_filter` | [`Search Orders Date Time Filter Hash`](#search-orders-date-time-filter) | Optional | Filter for `Order` objects based on whether their `CREATED_AT`,<br>`CLOSED_AT` or `UPDATED_AT` timestamps fall within a specified time range.<br>You can specify the time range and which timestamp to filter for. You can filter<br>for only one time range at a time.<br><br>For each time range, the start time and end time are inclusive. If the end time<br>is absent, it defaults to the time of the first request for the cursor.<br><br>__Important:__ If you use the DateTimeFilter to filter for `CLOSED_AT` or `UPDATED_AT`,<br>you must also set the [OrdersSort](#type-searchorderordersort).<br>The TimeRange used in DateTimeFilter must correspond to the `sort_field` in<br>the [OrdersSort](#type-searchorderordersort) object. |
| `fulfillment_filter` | [`Search Orders Fulfillment Filter Hash`](#search-orders-fulfillment-filter) | Optional | Filter based on [Order Fulfillment](#type-orderfulfillment) information. |
| `source_filter` | [`Search Orders Source Filter Hash`](#search-orders-source-filter) | Optional | Filter based on Order `source` information. |
| `customer_filter` | [`Search Orders Customer Filter Hash`](#search-orders-customer-filter) | Optional | Filter based on Order `customer_id` and any Tender `customer_id`<br>associated with the Order. Does not filter based on the<br>[FulfillmentRecipient](#type-orderfulfillmentrecipient) `customer_id`. |

##### Example (as JSON)

```json
{
  "state_filter": null,
  "date_time_filter": null,
  "fulfillment_filter": null,
  "source_filter": null,
  "customer_filter": null
}
```

#### Search Orders Fulfillment Filter

Filter based on [Order Fulfillment](#type-orderfulfillment) information.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `fulfillment_types` | [`Array<String (Order Fulfillment Type)>`](#order-fulfillment-type) |  | List of [fulfillment types](#type-orderfulfillmenttype) to filter<br>for. Will return orders if any of its fulfillments match any of the fulfillment types<br>listed in this field.<br>See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values |
| `fulfillment_states` | [`Array<String (Order Fulfillment State)>`](#order-fulfillment-state) | Optional | List of [fulfillment states](#type-orderfulfillmentstate) to filter<br>for. Will return orders if any of its fulfillments match any of the<br>fulfillment states listed in this field.<br>See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values |

##### Example (as JSON)

```json
{
  "fulfillment_types": [
    "PICKUP",
    "PICKUP"
  ],
  "fulfillment_states": null
}
```

#### Search Orders Query

Contains query criteria for the search.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `filter` | [`Search Orders Filter Hash`](#search-orders-filter) | Optional | Filter options to use for a query. Multiple filters will be ANDed together. |
| `sort` | [`Search Orders Sort Hash`](#search-orders-sort) | Optional | Sorting options for a query. Returned Orders will always be sorted on a timestamp. |

##### Example (as JSON)

```json
{
  "filter": null,
  "sort": null
}
```

#### Search Orders Request

The request does not have any required fields. When given no query criteria,
SearchOrders will return all results for all of the merchant’s locations. When fetching additional
pages using a `cursor`, the `query` must be equal to the `query` used to fetch the first page of
results.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_ids` | `Array<String>` | Optional | The location IDs for the orders to query. The caller must have access to<br>all provided locations.<br><br>Min: 1 `location_ids`.<br>Max: 10 `location_ids`. |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for your original query.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `query` | [`Search Orders Query Hash`](#search-orders-query) | Optional | Contains query criteria for the search. |
| `limit` | `Integer` | Optional | Number of results to be returned in a single page. SearchOrders may<br>use a smaller limit than specified depending on server load. If the response<br>includes a `cursor` field, you can use it to retrieve the next set of results.<br>Default: `500` |
| `return_entries` | `Boolean` | Optional | If set to `true`, SearchOrders will return [`OrderEntry`](#type-orderentry)<br>objects instead of `Order` objects. `OrderEntry` objects are lightweight<br>descriptions of orders that include `order_id`s.<br><br>Default: `false`. |

##### Example (as JSON)

```json
{
  "request_body": {
    "return_entries": true,
    "limit": 3,
    "location_ids": [
      "057P5VYJ4A5X1",
      "18YC4JDH91E1H"
    ],
    "query": {
      "filter": {
        "date_time_filter": {
          "closed_at": {
            "start_at": "2018-03-03T20:00:00+00:00",
            "end_at": "2019-03-04T21:54:45+00:00"
          }
        },
        "state_filter": {
          "states": [
            "COMPLETED"
          ]
        }
      },
      "sort": {
        "sort_field": "CLOSED_AT",
        "sort_order": "DESC"
      }
    }
  }
}
```

#### Search Orders Response

Only one of `order_entries` or `orders` fields will be set, depending on whether
`return_entries` was set on the [SearchOrdersRequest](#type-searchorderrequest).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order_entries` | [`Array<Order Entry Hash>`](#order-entry) | Optional | List of [OrderEntries](#type-orderentry) that fit the query<br>conditions.  Populated only if `order_entries` was set to `true` in the request. |
| `orders` | [`Array<Order Hash>`](#order) | Optional | List of<br>[Orders](#type-order) that match query conditions. Populated only if<br>`return_entries` in the request is set to `false`. |
| `cursor` | `String` | Optional | The pagination cursor to be used in a subsequent request. If unset,<br>this is the final response.<br>See [Pagination](/basics/api101/pagination) for more information. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | [Errors](#type-error) encountered during the search. |
| `unconvertible_transaction_ids` | `Array<String>` | Optional | List of transaction IDs identifying transactions that could not be<br>converted to an `Order`. Empty if `return_entries` is true, however, attempts<br>to retrieve those orders may encounter subsequent `unconvertible_transcation_ids`<br>Note that this field will not be present after SearchOrders moves from BETA<br>to GA. |

##### Example (as JSON)

```json
{
  "order_entries": [
    {
      "id": "CAISEM82RcpmcFBM0TfOyiHV3es",
      "location_id": "057P5VYJ4A5X1"
    },
    {
      "id": "CAISENgvlJ6jLWAzERDzjyHVybY",
      "location_id": "18YC4JDH91E1H"
    },
    {
      "id": "CAISEM52YcpmcWAzERDOyiWS3ty",
      "location_id": "057P5VYJ4A5X1"
    }
  ],
  "cursor": "123"
}
```

#### Search Orders Sort

Sorting options for a query. Returned Orders will always be sorted on a timestamp.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `sort_field` | [`String (Search Orders Sort Field)`](#search-orders-sort-field) |  | Specifies which timestamp to use to sort SearchOrder results. |
| `sort_order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |

##### Example (as JSON)

```json
{
  "sort_field": "CLOSED_AT",
  "sort_order": null
}
```

#### Search Orders Source Filter

Filter based on Order `source` information.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_names` | `Array<String>` | Optional | Filters by [Source](#type-ordersource) `name`. Will return any orders<br>with with `source.name`s that match any of the listed source names.<br><br>Max: 10 `source_names`. |

##### Example (as JSON)

```json
{
  "source_names": null
}
```

#### Search Orders State Filter

Filter by current Order `state`.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `states` | [`Array<String (Order State)>`](#order-state) | States to filter for.<br>See [OrderState](#type-orderstate) for possible values |

##### Example (as JSON)

```json
{
  "states": [
    "CANCELED",
    "OPEN"
  ]
}
```

#### Search Shifts Request

A request for a filtered and sorted set of `Shift` objects.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `query` | [`Shift Query Hash`](#shift-query) | Optional | The parameters of a `Shift` search query. Includes filter and sort options. |
| `limit` | `Integer` | Optional | number of resources in a page (200 by default). |
| `cursor` | `String` | Optional | opaque cursor for fetching the next page. |

##### Example (as JSON)

```json
{
  "request_body": {
    "query": {
      "filter": {
        "workday": {
          "date_range": {
            "start_date": "2019-01-20",
            "end_date": "2019-02-03"
          },
          "match_shifts_by": "START_AT",
          "default_timezone": "America/Los_Angeles"
        }
      }
    },
    "limit": 100
  }
}
```

#### Search Shifts Response

The response to a request for `Shift` objects. Contains
the requested `Shift` objects. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `shifts` | [`Array<Shift Hash>`](#shift) | Optional | Shifts |
| `cursor` | `String` | Optional | Opaque cursor for fetching the next page. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "shifts": [
    {
      "id": "X714F3HA6D1PT",
      "employee_id": "ormj0jJJZ5OZIzxrZYJI",
      "location_id": "PAA1RJZZKXBFG",
      "timezone": "America/New_York",
      "start_at": "2019-01-21T03:11:00-05:00",
      "end_at": "2019-01-21T13:11:00-05:00",
      "wage": {
        "title": "Barista",
        "hourly_rate": {
          "amount": 1100,
          "currency": "USD"
        }
      },
      "breaks": [
        {
          "id": "SJW7X6AKEJQ65",
          "start_at": "2019-01-21T06:11:00-05:00",
          "end_at": "2019-01-21T06:11:00-05:00",
          "break_type_id": "REGS1EQR1TPZ5",
          "name": "Tea Break",
          "expected_duration": "PT10M",
          "is_paid": true
        }
      ],
      "status": "CLOSED",
      "version": 6,
      "created_at": "2019-01-24T01:12:03Z",
      "updated_at": "2019-02-07T22:21:08Z"
    },
    {
      "id": "GDHYBZYWK0P2V",
      "employee_id": "33fJchumvVdJwxV0H6L9",
      "location_id": "PAA1RJZZKXBFG",
      "timezone": "America/New_York",
      "start_at": "2019-01-22T12:02:00-05:00",
      "end_at": "2019-01-22T13:02:00-05:00",
      "wage": {
        "title": "Cook",
        "hourly_rate": {
          "amount": 1600,
          "currency": "USD"
        }
      },
      "breaks": [
        {
          "id": "BKS6VR7WR748A",
          "start_at": "2019-01-23T14:30:00-05:00",
          "end_at": "2019-01-23T14:40:00-05:00",
          "break_type_id": "WQX00VR99F53J",
          "name": "Tea Break",
          "expected_duration": "PT10M",
          "is_paid": true
        },
        {
          "id": "BQFEZSHFZSC51",
          "start_at": "2019-01-22T12:30:00-05:00",
          "end_at": "2019-01-22T12:44:00-05:00",
          "break_type_id": "P6Q468ZFRN1AC",
          "name": "Coffee Break",
          "expected_duration": "PT15M",
          "is_paid": false
        }
      ],
      "status": "CLOSED",
      "version": 16,
      "created_at": "2019-01-23T23:32:45Z",
      "updated_at": "2019-01-24T00:56:25Z"
    }
  ]
}
```

#### Shift

A record of the hourly rate, start, and end times for a single work shift 
for an employee. May include a record of the start and end times for breaks 
taken during the shift.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object |
| `employee_id` | `String` |  | The ID of the employee this shift belongs to. |
| `location_id` | `String` | Optional | The ID of the location this shift occurred at. Should be based on<br>where the employee clocked in. |
| `timezone` | `String` | Optional | Read-only convenience value that is calculated from the location based<br>on `location_id`. Format: the IANA Timezone Database identifier for the<br>location timezone. |
| `start_at` | `String` |  | RFC 3339; shifted to location timezone + offset. Precision up to the<br>minute is respected; seconds are truncated. |
| `end_at` | `String` | Optional | RFC 3339; shifted to timezone + offset. Precision up to the minute is<br>respected; seconds are truncated. The `end_at` minute is not<br>counted when the shift length is calculated. For example, a shift from `00:00`<br>to `08:01` is considered an 8 hour shift (midnight to 8am). |
| `wage` | [`Shift Wage Hash`](#shift-wage) | Optional | The hourly wage rate used to compensate an employee for this shift. |
| `breaks` | [`Array<Break Hash>`](#break) | Optional | A list of any paid or unpaid breaks that were taken during this shift. |
| `status` | [`String (Shift Status)`](#shift-status) | Optional | Enumerates the possible status of a `Shift` |
| `version` | `Integer` | Optional | Used for resolving concurrency issues; request will fail if version<br>provided does not match server version at time of request. If not provided,<br>Square executes a blind write; potentially overwriting data from another<br>write. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format; presented in UTC. |
| `updated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format; presented in UTC. |

##### Example (as JSON)

```json
{
  "id": null,
  "employee_id": "employee_id0",
  "location_id": null,
  "timezone": null,
  "start_at": "start_at2",
  "end_at": null,
  "wage": null,
  "breaks": null,
  "status": null,
  "version": null,
  "created_at": null,
  "updated_at": null
}
```

#### Shift Filter

Defines a filter used in a search for `Shift` records. `AND` logic is
used by Square's servers to apply each filter property specified.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `Array<String>` | Optional | Fetch shifts for the specified location. |
| `employee_id` | `Array<String>` | Optional | Fetch shifts for the specified employee. |
| `status` | [`String (Shift Filter Status)`](#shift-filter-status) | Optional | Specifies the `status` of `Shift` records to be returned. |
| `start` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |
| `end` | [`Time Range Hash`](#time-range) | Optional | Represents a generic time range. The start and end values are<br>represented in RFC-3339 format. Time ranges are customized to be<br>inclusive or exclusive based on the needs of a particular endpoint.<br>Refer to the relevent endpoint-specific documentation to determine<br>how time ranges are handled. |
| `workday` | [`Shift Workday Hash`](#shift-workday) | Optional | A `Shift` search query filter parameter that sets a range of days that <br>a `Shift` must start or end in before passing the filter condition. |

##### Example (as JSON)

```json
{
  "location_id": null,
  "employee_id": null,
  "status": null,
  "start": null,
  "end": null,
  "workday": null
}
```

#### Shift Query

The parameters of a `Shift` search query. Includes filter and sort options.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `filter` | [`Shift Filter Hash`](#shift-filter) | Optional | Defines a filter used in a search for `Shift` records. `AND` logic is<br>used by Square's servers to apply each filter property specified. |
| `sort` | [`Shift Sort Hash`](#shift-sort) | Optional | Sets the sort order of search results. |

##### Example (as JSON)

```json
{
  "filter": null,
  "sort": null
}
```

#### Shift Sort

Sets the sort order of search results.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | [`String (Shift Sort Field)`](#shift-sort-field) | Optional | Enumerates the `Shift` fields to sort on. |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |

##### Example (as JSON)

```json
{
  "field": null,
  "order": null
}
```

#### Shift Wage

The hourly wage rate used to compensate an employee for this shift.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `title` | `String` | Optional | The name of the job performed during this shift. Square<br>labor-reporting UIs may group shifts together by title. |
| `hourly_rate` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "title": null,
  "hourly_rate": null
}
```

#### Shift Workday

A `Shift` search query filter parameter that sets a range of days that 
a `Shift` must start or end in before passing the filter condition.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `date_range` | [`Date Range Hash`](#date-range) | Optional | A range defined by two dates. Used for filtering a query for Connect v2 <br>objects that have date properties. |
| `match_shifts_by` | [`String (Shift Workday Matcher)`](#shift-workday-matcher) | Optional | Defines the logic used to apply a workday filter. |
| `default_timezone` | `String` | Optional | Location-specific timezones convert workdays to datetime filters.<br>Every location included in the query must have a timezone, or this field<br>must be provided as a fallback. Format: the IANA timezone database<br>identifier for the relevant timezone. |

##### Example (as JSON)

```json
{
  "date_range": null,
  "match_shifts_by": null,
  "default_timezone": null
}
```

#### Source Application

Provides information about the application used to generate an inventory
change.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `product` | [`String (Product)`](#product) | Optional | Indicates the Square product used to generate an inventory change. |
| `application_id` | `String` | Optional | Read-only Square ID assigned to the application. Only used for<br>[Product](#type-product) type `EXTERNAL_API`. |
| `name` | `String` | Optional | Read-only display name assigned to the application<br>(e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`). |

##### Example (as JSON)

```json
{
  "product": null,
  "application_id": null,
  "name": null
}
```

#### Standard Unit Description

Contains the name and abbreviation for standard measurement unit.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `unit` | [`Measurement Unit Hash`](#measurement-unit) | Optional | Represents a unit of measurement to use with a quantity, such as ounces<br>or inches. Exactly one of the following fields are required: `custom_unit`,<br>`area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.<br><br>The `family` field describes the type of measurement. For example,<br>ounces are in the weight family. |
| `name` | `String` | Optional | Display name of the measurement unit. For example, 'Pound'. |
| `abbreviation` | `String` | Optional | Abbreviation for the measurement unit. For example, 'lb'. |

##### Example (as JSON)

```json
{
  "unit": null,
  "name": null,
  "abbreviation": null
}
```

#### Standard Unit Description Group

Group of standard measurement units.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `standard_unit_descriptions` | [`Array<Standard Unit Description Hash>`](#standard-unit-description) | Optional | List of measurement units in this description group. |
| `language_code` | `String` | Optional | IETF language tag. |

##### Example (as JSON)

```json
{
  "standard_unit_descriptions": null,
  "language_code": null
}
```

#### Tender

Represents a tender (i.e., a method of payment) used in a Square transaction.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The tender's unique ID. |
| `location_id` | `String` | Optional | The ID of the transaction's associated location. |
| `transaction_id` | `String` | Optional | The ID of the tender's associated transaction. |
| `created_at` | `String` | Optional | The time when the tender was created, in RFC 3339 format. |
| `note` | `String` | Optional | An optional note associated with the tender at the time of payment. |
| `amount_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `tip_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `processing_fee_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `customer_id` | `String` | Optional | If the tender is associated with a customer or represents a customer's card on file,<br>this is the ID of the associated customer. |
| `type` | [`String (Tender Type)`](#tender-type) |  | Indicates a tender's type. |
| `card_details` | [`Tender Card Details Hash`](#tender-card-details) | Optional | Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD` |
| `cash_details` | [`Tender Cash Details Hash`](#tender-cash-details) | Optional | Represents the details of a tender with `type` `CASH`. |
| `additional_recipients` | [`Array<Additional Recipient Hash>`](#additional-recipient) | Optional | Additional recipients (other than the merchant) receiving a portion of this tender.<br>For example, fees assessed on the purchase by a third party integration. |

##### Example (as JSON)

```json
{
  "id": null,
  "location_id": null,
  "transaction_id": null,
  "created_at": null,
  "note": null,
  "amount_money": null,
  "tip_money": null,
  "processing_fee_money": null,
  "customer_id": null,
  "type": "THIRD_PARTY_CARD",
  "card_details": null,
  "cash_details": null,
  "additional_recipients": null
}
```

#### Tender Card Details

Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `status` | [`String (Tender Card Details Status)`](#tender-card-details-status) | Optional | Indicates the card transaction's current status. |
| `card` | [`Card Hash`](#card) | Optional | Represents the payment details of a card to be used for payments. These<br>details are determined by the `card_nonce` generated by `SqPaymentForm`. |
| `entry_method` | [`String (Tender Card Details Entry Method)`](#tender-card-details-entry-method) | Optional | Indicates the method used to enter the card's details. |

##### Example (as JSON)

```json
{
  "status": null,
  "card": null,
  "entry_method": null
}
```

#### Tender Cash Details

Represents the details of a tender with `type` `CASH`.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `buyer_tendered_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |
| `change_back_money` | [`Money Hash`](#money) | Optional | Represents an amount of money.<br><br>__Important:__ Unlike version 1 of the Connect API, __all monetary amounts<br>returned by v2 endpoints are positive.__ (In v1, monetary amounts are negative<br>if they represent money being paid _by_ a merchant, instead of money being<br>paid _to_ a merchant.) |

##### Example (as JSON)

```json
{
  "buyer_tendered_money": null,
  "change_back_money": null
}
```

#### Time Range

Represents a generic time range. The start and end values are
represented in RFC-3339 format. Time ranges are customized to be
inclusive or exclusive based on the needs of a particular endpoint.
Refer to the relevent endpoint-specific documentation to determine
how time ranges are handled.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `start_at` | `String` | Optional | A datetime value in RFC-3339 format indicating when the time range<br>starts. |
| `end_at` | `String` | Optional | A datetime value in RFC-3339 format indicating when the time range<br>ends. |

##### Example (as JSON)

```json
{
  "start_at": null,
  "end_at": null
}
```

#### Transaction

Represents a transaction processed with Square, either with the
Connect API or with Square Point of Sale.

The `tenders` field of this object lists all methods of payment used to pay in
the transaction.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The transaction's unique ID, issued by Square payments servers. |
| `location_id` | `String` | Optional | The ID of the transaction's associated location. |
| `created_at` | `String` | Optional | The time when the transaction was created, in RFC 3339 format. |
| `tenders` | [`Array<Tender Hash>`](#tender) | Optional | The tenders used to pay in the transaction. |
| `refunds` | [`Array<Refund Hash>`](#refund) | Optional | Refunds that have been applied to any tender in the transaction. |
| `reference_id` | `String` | Optional | If the transaction was created with the [Charge](#endpoint-transactions-charge)<br>endpoint, this value is the same as the value provided for the `reference_id`<br>parameter in the request to that endpoint. Otherwise, it is not set. |
| `product` | [`String (Transaction Product)`](#transaction-product) | Optional | Indicates the Square product used to process a transaction. |
| `client_id` | `String` | Optional | If the transaction was created in the Square Point of Sale app, this value<br>is the ID generated for the transaction by Square Point of Sale.<br><br>This ID has no relationship to the transaction's canonical `id`, which is<br>generated by Square's backend servers. This value is generated for bookkeeping<br>purposes, in case the transaction cannot immediately be completed (for example,<br>if the transaction is processed in offline mode).<br><br>It is not currently possible with the Connect API to perform a transaction<br>lookup by this value. |
| `shipping_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `order_id` | `String` | Optional | The order_id is an identifier for the order associated with this transaction, if any. |

##### Example (as JSON)

```json
{
  "id": null,
  "location_id": null,
  "created_at": null,
  "tenders": null,
  "refunds": null,
  "reference_id": null,
  "product": null,
  "client_id": null,
  "shipping_address": null,
  "order_id": null
}
```

#### Update Break Type Request

A request to update a `BreakType`

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `break_type` | [`Break Type Hash`](#break-type) | Optional | A defined break template that sets an expectation for possible `Break` <br>instances on a `Shift`. |

##### Example (as JSON)

```json
{
  "request_body": {
    "break_type": {
      "location_id": "26M7H24AZ9N6R",
      "break_name": "Lunch",
      "expected_duration": "PT50M",
      "is_paid": true,
      "version": 1
    }
  }
}
```

#### Update Break Type Response

A response to a request to update a `BreakType`. Contains
the requested `BreakType` objects. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `break_type` | [`Break Type Hash`](#break-type) | Optional | A defined break template that sets an expectation for possible `Break` <br>instances on a `Shift`. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "break_type": {
    "id": "Q6JSJS6D4DBCH",
    "location_id": "26M7H24AZ9N6R",
    "break_name": "Lunch",
    "expected_duration": "PT50M",
    "is_paid": true,
    "version": 2,
    "created_at": "2018-06-12T20:19:12Z",
    "updated_at": "2019-02-26T23:12:59Z"
  }
}
```

#### Update Customer Request

Defines the body parameters that can be provided in a request to the
UpdateCustomer endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `given_name` | `String` | Optional | The customer's given (i.e., first) name. |
| `family_name` | `String` | Optional | The customer's family (i.e., last) name. |
| `company_name` | `String` | Optional | The name of the customer's company. |
| `nickname` | `String` | Optional | A nickname for the customer. |
| `email_address` | `String` | Optional | The customer's email address. |
| `address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `phone_number` | `String` | Optional | The customer's phone number. |
| `reference_id` | `String` | Optional | An optional second ID you can set to associate the customer with an<br>entity in another system. |
| `note` | `String` | Optional | An optional note to associate with the customer. |
| `birthday` | `String` | Optional | The customer birthday in RFC-3339 format. Year is optional,<br>timezone and times are not allowed. Example: `0000-09-01T00:00:00-00:00`<br>for a birthday on September 1st. `1998-09-01T00:00:00-00:00` for a birthday<br>on September 1st 1998. |

##### Example (as JSON)

```json
{
  "request_body": {
    "phone_number": "",
    "email_address": "New.Amelia.Earhart@example.com",
    "note": "updated customer note"
  }
}
```

#### Update Customer Response

Defines the fields that are included in the response body of
a request to the UpdateCustomer endpoint.

One of `errors` or `customer` is present in a given response (never both).

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `customer` | [`Customer Hash`](#customer) | Optional | Represents one of a business's customers, which can have one or more<br>cards on file associated with it. |

##### Example (as JSON)

```json
{
  "customer": {
    "id": "JDKYHBWT1D4F8MFH63DBMEN8Y4",
    "created_at": "2016-03-23T20:21:54.859Z",
    "updated_at": "2016-03-25T20:21:55Z",
    "given_name": "Amelia",
    "family_name": "Earhart",
    "email_address": "New.Amelia.Earhart@example.com",
    "address": {
      "address_line_1": "500 Electric Ave",
      "address_line_2": "Suite 600",
      "locality": "New York",
      "administrative_district_level_1": "NY",
      "postal_code": "10003",
      "country": "US"
    },
    "reference_id": "YOUR_REFERENCE_ID",
    "note": "updated customer note",
    "groups": [
      {
        "id": "16894e93-96eb-4ced-b24b-f71d42bf084c",
        "name": "Aviation Enthusiasts"
      }
    ]
  }
}
```

#### Update Item Modifier Lists Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `item_ids` | `Array<String>` |  | The [CatalogItem](#type-catalogitem)s whose [CatalogModifierList](#type-catalogmodifierlist)s are being updated. |
| `modifier_lists_to_enable` | `Array<String>` | Optional | The set of [CatalogModifierList](#type-catalogmodifierlist)s (referenced by ID) to enable for the [CatalogItem](#type-catalogitem). |
| `modifier_lists_to_disable` | `Array<String>` | Optional | The set of [CatalogModifierList](#type-catalogmodifierlist)s (referenced by ID) to disable for the [CatalogItem](#type-catalogitem). |

##### Example (as JSON)

```json
{
  "item_ids": [
    "item_ids4"
  ],
  "modifier_lists_to_enable": null,
  "modifier_lists_to_disable": null
}
```

#### Update Item Modifier Lists Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `updated_at` | `String` | Optional | The database [timestamp](#workingwithdates) of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z". |

##### Example (as JSON)

```json
{
  "updated_at": "2016-11-16T22:25:24.878Z"
}
```

#### Update Item Taxes Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `item_ids` | `Array<String>` |  | The [CatalogItem](#type-catalogitem)s whose enabled/disabled [CatalogTax](#type-catalogtax)es are being updated. |
| `taxes_to_enable` | `Array<String>` | Optional | The set of [CatalogTax](#type-catalogtax)es (referenced by ID) to enable for the [CatalogItem](#type-catalogitem). |
| `taxes_to_disable` | `Array<String>` | Optional | The set of [CatalogTax](#type-catalogtax)es (referenced by ID) to disable for the [CatalogItem](#type-catalogitem). |

##### Example (as JSON)

```json
{
  "item_ids": [
    "item_ids4"
  ],
  "taxes_to_enable": null,
  "taxes_to_disable": null
}
```

#### Update Item Taxes Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `updated_at` | `String` | Optional | The database [timestamp](#workingwithdates) of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z". |

##### Example (as JSON)

```json
{
  "updated_at": "2016-11-16T22:25:24.878Z"
}
```

#### Update Shift Request

A request to update a `Shift` object.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `shift` | [`Shift Hash`](#shift) | A record of the hourly rate, start, and end times for a single work shift <br>for an employee. May include a record of the start and end times for breaks <br>taken during the shift. |

##### Example (as JSON)

```json
{
  "shift": {
    "id": null,
    "employee_id": "employee_id4",
    "location_id": null,
    "timezone": null,
    "start_at": "start_at6",
    "end_at": null,
    "wage": null,
    "breaks": null,
    "status": null,
    "version": null,
    "created_at": null,
    "updated_at": null
  }
}
```

#### Update Shift Response

The response to a request to update a `Shift`. Contains
the updated `Shift` object. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `shift` | [`Shift Hash`](#shift) | Optional | A record of the hourly rate, start, and end times for a single work shift <br>for an employee. May include a record of the start and end times for breaks <br>taken during the shift. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "shift": {
    "id": "K0YH4CV5462JB",
    "employee_id": "ormj0jJJZ5OZIzxrZYJI",
    "location_id": "PAA1RJZZKXBFG",
    "timezone": "America/New_York",
    "start_at": "2019-01-25T03:11:00-05:00",
    "end_at": "2019-01-25T13:11:00-05:00",
    "wage": {
      "title": "Bartender",
      "hourly_rate": {
        "amount": 1500,
        "currency": "USD"
      }
    },
    "breaks": [
      {
        "id": "X7GAQYVVRRG6P",
        "start_at": "2019-01-25T06:11:00-05:00",
        "end_at": "2019-01-25T06:16:00-05:00",
        "break_type_id": "REGS1EQR1TPZ5",
        "name": "Tea Break",
        "expected_duration": "PT5M",
        "is_paid": true
      }
    ],
    "status": "CLOSED",
    "version": 2,
    "created_at": "2019-02-28T00:39:02Z",
    "updated_at": "2019-02-28T00:42:41Z"
  }
}
```

#### Update Workweek Config Request

A request to update a `WorkweekConfig` object

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `workweek_config` | [`Workweek Config Hash`](#workweek-config) | Optional | Sets the Day of the week and hour of the day that a business starts a <br>work week. Used for the calculation of overtime pay. |

##### Example (as JSON)

```json
{
  "request_body": {
    "workweek_config": {
      "start_of_week": "MON",
      "start_of_day_local_time": "10:00",
      "version": 10
    }
  }
}
```

#### Update Workweek Config Response

The response to a request to update a `WorkweekConfig` object. Contains
the updated `WorkweekConfig` object. May contain a set of `Error` objects if
the request resulted in errors.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `workweek_config` | [`Workweek Config Hash`](#workweek-config) | Optional | Sets the Day of the week and hour of the day that a business starts a <br>work week. Used for the calculation of overtime pay. |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{
  "workweek_config": {
    "id": "FY4VCAQN700GM",
    "start_of_week": "MON",
    "start_of_day_local_time": "10:00",
    "version": 11,
    "created_at": "2016-02-04T00:58:24Z",
    "updated_at": "2019-02-28T01:04:35Z"
  }
}
```

#### Upsert Catalog Object Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `idempotency_key` | `String` | A value you specify that uniquely identifies this<br>request among all your requests. A common way to create<br>a valid idempotency key is to use a Universally unique<br>identifier (UUID).<br><br>If you're unsure whether a particular request was successful,<br>you can reattempt it with the same idempotency key without<br>worrying about creating duplicate objects.<br><br>See [Idempotency](/basics/api101/idempotency) for more information. |
| `object` | [`Catalog Object Hash`](#catalog-object) | - |

##### Example (as JSON)

```json
{
  "idempotency_key": "idempotency_key6",
  "object": {
    "type": "MODIFIER",
    "id": "id2",
    "updated_at": null,
    "version": null,
    "is_deleted": null,
    "catalog_v1_ids": null,
    "present_at_all_locations": null,
    "present_at_location_ids": null,
    "absent_at_location_ids": null,
    "image_id": null,
    "item_data": null,
    "category_data": null,
    "item_variation_data": null,
    "tax_data": null,
    "discount_data": null,
    "modifier_list_data": null,
    "modifier_data": null,
    "image_data": null,
    "measurement_unit_data": null
  }
}
```

#### Upsert Catalog Object Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | The set of [Error](#type-error)s encountered. |
| `catalog_object` | [`Catalog Object Hash`](#catalog-object) | Optional | - |
| `id_mappings` | [`Array<Catalog Id Mapping Hash>`](#catalog-id-mapping) | Optional | The mapping between client and server IDs for this Upsert. |

##### Example (as JSON)

```json
{
  "catalog_object": {
    "type": "ITEM",
    "id": "7SB3ZQYJ5GDMVFL7JK46JCHT",
    "updated_at": "2016-11-16T22:32:42.996Z",
    "version": 1479335562996,
    "is_deleted": false,
    "item_data": {
      "name": "Cocoa",
      "description": "Hot chocolate",
      "abbreviation": "Ch"
    }
  },
  "id_mappings": [
    {
      "client_object_id": "#Cocoa",
      "object_id": "7SB3ZQYJ5GDMVFL7JK46JCHT"
    }
  ]
}
```

#### V1 Adjust Inventory Request

V1AdjustInventoryRequest

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `quantity_delta` | `Float` | Optional | The number to adjust the variation's quantity by. |
| `adjustment_type` | [`String (V1 Adjust Inventory Request Adjustment Type)`](#v1-adjust-inventory-request-adjustment-type) | Optional | - |
| `memo` | `String` | Optional | A note about the inventory adjustment. |

##### Example (as JSON)

```json
{
  "quantity_delta": null,
  "adjustment_type": null,
  "memo": null
}
```

#### V1 Bank Account

V1BankAccount

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The bank account's Square-issued ID. |
| `merchant_id` | `String` | Optional | The Square-issued ID of the merchant associated with the bank account. |
| `bank_name` | `String` | Optional | The name of the bank that manages the account. |
| `name` | `String` | Optional | The name associated with the bank account. |
| `routing_number` | `String` | Optional | The bank account's routing number. |
| `account_number_suffix` | `String` | Optional | The last few digits of the bank account number. |
| `currency_code` | `String` | Optional | The currency code of the currency associated with the bank account, in ISO 4217 format. For example, the currency code for US dollars is USD. |
| `type` | [`String (V1 Bank Account Type)`](#v1-bank-account-type) | Optional | - |

##### Example (as JSON)

```json
{
  "id": null,
  "merchant_id": null,
  "bank_name": null,
  "name": null,
  "routing_number": null,
  "account_number_suffix": null,
  "currency_code": null,
  "type": null
}
```

#### V1 Cash Drawer Event

V1CashDrawerEvent

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The event's unique ID. |
| `employee_id` | `String` | Optional | The ID of the employee that created the event. |
| `event_type` | [`String (V1 Cash Drawer Event Event Type)`](#v1-cash-drawer-event-event-type) | Optional | - |
| `event_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `created_at` | `String` | Optional | The time when the event occurred, in ISO 8601 format. |
| `description` | `String` | Optional | An optional description of the event, entered by the employee that created it. |

##### Example (as JSON)

```json
{
  "id": null,
  "employee_id": null,
  "event_type": null,
  "event_money": null,
  "created_at": null,
  "description": null
}
```

#### V1 Cash Drawer Shift

V1CashDrawerShift

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The shift's unique ID. |
| `event_type` | [`String (V1 Cash Drawer Shift Event Type)`](#v1-cash-drawer-shift-event-type) | Optional | - |
| `opened_at` | `String` | Optional | The time when the shift began, in ISO 8601 format. |
| `ended_at` | `String` | Optional | The time when the shift ended, in ISO 8601 format. |
| `closed_at` | `String` | Optional | The time when the shift was closed, in ISO 8601 format. |
| `employee_ids` | `Array<String>` | Optional | The IDs of all employees that were logged into Square Register at some point during the cash drawer shift. |
| `opening_employee_id` | `String` | Optional | The ID of the employee that started the cash drawer shift. |
| `ending_employee_id` | `String` | Optional | The ID of the employee that ended the cash drawer shift. |
| `closing_employee_id` | `String` | Optional | The ID of the employee that closed the cash drawer shift by auditing the cash drawer's contents. |
| `description` | `String` | Optional | The time when the timecard was created, in ISO 8601 format. |
| `starting_cash_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `cash_payment_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `cash_refunds_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `cash_paid_in_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `cash_paid_out_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `expected_cash_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `closed_cash_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `device` | [`Device Hash`](#device) | Optional | - |
| `events` | [`Array<V1 Cash Drawer Event Hash>`](#v1-cash-drawer-event) | Optional | All of the events (payments, refunds, and so on) that involved the cash drawer during the shift. |

##### Example (as JSON)

```json
{
  "id": null,
  "event_type": null,
  "opened_at": null,
  "ended_at": null,
  "closed_at": null,
  "employee_ids": null,
  "opening_employee_id": null,
  "ending_employee_id": null,
  "closing_employee_id": null,
  "description": null,
  "starting_cash_money": null,
  "cash_payment_money": null,
  "cash_refunds_money": null,
  "cash_paid_in_money": null,
  "cash_paid_out_money": null,
  "expected_cash_money": null,
  "closed_cash_money": null,
  "device": null,
  "events": null
}
```

#### V1 Category

V1Category

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The category's unique ID. |
| `name` | `String` | Optional | The category's name. |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "v2_id": null
}
```

#### V1 Create Category Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Category Hash`](#v1-category) | Optional | V1Category |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Discount Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Discount Hash`](#v1-discount) | Optional | V1Discount |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Employee Role Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_role` | [`V1 Employee Role Hash`](#v1-employee-role) | Optional | V1EmployeeRole |

##### Example (as JSON)

```json
{
  "employee_role": null
}
```

#### V1 Create Fee Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Fee Hash`](#v1-fee) | Optional | V1Fee |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Item Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Item Hash`](#v1-item) | Optional | V1Item |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Modifier List Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Modifier List Hash`](#v1-modifier-list) | Optional | V1ModifierList |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Modifier Option Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Modifier Option Hash`](#v1-modifier-option) | Optional | V1ModifierOption |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Page Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Page Hash`](#v1-page) | Optional | V1Page |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Create Refund Request

V1CreateRefundRequest

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payment_id` | `String` |  | The ID of the payment to refund. If you are creating a `PARTIAL`<br>refund for a split tender payment, instead provide the id of the<br>particular tender you want to refund. |
| `type` | [`String (V1 Create Refund Request Type)`](#v1-create-refund-request-type) |  | - |
| `reason` | `String` |  | The reason for the refund. |
| `refunded_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `request_idempotence_key` | `String` | Optional | An optional key to ensure idempotence if you issue the same PARTIAL refund request more than once. |

##### Example (as JSON)

```json
{
  "payment_id": "payment_id0",
  "type": "FULL",
  "reason": "reason4",
  "refunded_money": null,
  "request_idempotence_key": null
}
```

#### V1 Create Variation Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Variation Hash`](#v1-variation) | Optional | V1Variation |

##### Example (as JSON)

```json
{
  "body": null
}
```

#### V1 Delete Page Cell Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `row` | `String` | Optional | The row of the cell to clear. Always an integer between 0 and 4, inclusive. Row 0 is the top row. |
| `column` | `String` | Optional | The column of the cell to clear. Always an integer between 0 and 4, inclusive. Column 0 is the leftmost column. |

##### Example (as JSON)

```json
{
  "row": null,
  "column": null
}
```

#### V1 Discount

V1Discount

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The discount's unique ID. |
| `name` | `String` | Optional | The discount's name. |
| `rate` | `String` | Optional | The rate of the discount, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%. This rate is 0 if discount_type is VARIABLE_PERCENTAGE. |
| `amount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `discount_type` | [`String (V1 Discount Discount Type)`](#v1-discount-discount-type) | Optional | - |
| `pin_required` | `Boolean` | Optional | Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment. |
| `color` | [`String (V1 Discount Color)`](#v1-discount-color) | Optional | - |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "rate": null,
  "amount_money": null,
  "discount_type": null,
  "pin_required": null,
  "color": null,
  "v2_id": null
}
```

#### V1 Employee

Represents one of a business's employees.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The employee's unique ID. |
| `first_name` | `String` |  | The employee's first name. |
| `last_name` | `String` |  | The employee's last name. |
| `role_ids` | `Array<String>` | Optional | The ids of the employee's associated roles. Currently, you can specify only one or zero roles per employee. |
| `authorized_location_ids` | `Array<String>` | Optional | The IDs of the locations the employee is allowed to clock in at. |
| `email` | `String` | Optional | The employee's email address. |
| `status` | [`String (V1 Employee Status)`](#v1-employee-status) | Optional | - |
| `external_id` | `String` | Optional | An ID the merchant can set to associate the employee with an entity in another system. |
| `created_at` | `String` | Optional | The time when the employee entity was created, in ISO 8601 format. |
| `updated_at` | `String` | Optional | The time when the employee entity was most recently updated, in ISO 8601 format. |

##### Example (as JSON)

```json
{
  "id": null,
  "first_name": "first_name0",
  "last_name": "last_name8",
  "role_ids": null,
  "authorized_location_ids": null,
  "email": null,
  "status": null,
  "external_id": null,
  "created_at": null,
  "updated_at": null
}
```

#### V1 Employee Role

V1EmployeeRole

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The role's unique ID, Can only be set by Square. |
| `name` | `String` |  | The role's merchant-defined name. |
| `permissions` | [`Array<String (V1 Employee Role Permissions)>`](#v1-employee-role-permissions) |  | The role's permissions.<br>See [V1EmployeeRolePermissions](#type-v1employeerolepermissions) for possible values |
| `is_owner` | `Boolean` | Optional | If true, employees with this role have all permissions, regardless of the values indicated in permissions. |
| `created_at` | `String` | Optional | The time when the employee entity was created, in ISO 8601 format. Is set by Square when the Role is created. |
| `updated_at` | `String` | Optional | The time when the employee entity was most recently updated, in ISO 8601 format. Is set by Square when the Role updated. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": "name0",
  "permissions": [
    "REGISTER_OPEN_CASH_DRAWER_OUTSIDE_SALE",
    "REGISTER_VIEW_SUMMARY_REPORTS"
  ],
  "is_owner": null,
  "created_at": null,
  "updated_at": null
}
```

#### V1 Fee

V1Fee

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The fee's unique ID. |
| `name` | `String` | Optional | The fee's name. |
| `rate` | `String` | Optional | The rate of the fee, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%. |
| `calculation_phase` | [`String (V1 Fee Calculation Phase)`](#v1-fee-calculation-phase) | Optional | - |
| `adjustment_type` | [`String (V1 Fee Adjustment Type)`](#v1-fee-adjustment-type) | Optional | - |
| `applies_to_custom_amounts` | `Boolean` | Optional | If true, the fee applies to custom amounts entered into Square Register that are not associated with a particular item. |
| `enabled` | `Boolean` | Optional | If true, the fee is applied to all appropriate items. If false, the fee is not applied at all. |
| `inclusion_type` | [`String (V1 Fee Inclusion Type)`](#v1-fee-inclusion-type) | Optional | - |
| `type` | [`String (V1 Fee Type)`](#v1-fee-type) | Optional | - |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "rate": null,
  "calculation_phase": null,
  "adjustment_type": null,
  "applies_to_custom_amounts": null,
  "enabled": null,
  "inclusion_type": null,
  "type": null,
  "v2_id": null
}
```

#### V1 Inventory Entry

V1InventoryEntry

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `variation_id` | `String` | Optional | The variation that the entry corresponds to. |
| `quantity_on_hand` | `Float` | Optional | The current available quantity of the item variation. |

##### Example (as JSON)

```json
{
  "variation_id": null,
  "quantity_on_hand": null
}
```

#### V1 Item

V1Item

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The item's ID. Must be unique among all entity IDs ever provided on behalf of the merchant. You can never reuse an ID. This value can include alphanumeric characters, dashes (-), and underscores (_). |
| `name` | `String` | Optional | The item's name. |
| `description` | `String` | Optional | The item's description. |
| `type` | [`String (V1 Item Type)`](#v1-item-type) | Optional | - |
| `color` | [`String (V1 Discount Color)`](#v1-discount-color) | Optional | - |
| `abbreviation` | `String` | Optional | The text of the item's display label in Square Register. Only up to the first five characters of the string are used. |
| `visibility` | [`String (V1 Item Visibility)`](#v1-item-visibility) | Optional | - |
| `available_online` | `Boolean` | Optional | If true, the item can be added to shipping orders from the merchant's online store. |
| `master_image` | [`V1 Item Image Hash`](#v1-item-image) | Optional | V1ItemImage |
| `category` | [`V1 Category Hash`](#v1-category) | Optional | V1Category |
| `variations` | [`Array<V1 Variation Hash>`](#v1-variation) | Optional | The item's variations. You must specify at least one variation. |
| `modifier_lists` | [`Array<V1 Modifier List Hash>`](#v1-modifier-list) | Optional | The modifier lists that apply to the item, if any. |
| `fees` | [`Array<V1 Fee Hash>`](#v1-fee) | Optional | The fees that apply to the item, if any. |
| `taxable` | `Boolean` | Optional | Deprecated. This field is not used. |
| `category_id` | `String` | Optional | The ID of the item's category, if any. |
| `available_for_pickup` | `Boolean` | Optional | If true, the item can be added to pickup orders from the merchant's online store. Default value: false |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "description": null,
  "type": null,
  "color": null,
  "abbreviation": null,
  "visibility": null,
  "available_online": null,
  "master_image": null,
  "category": null,
  "variations": null,
  "modifier_lists": null,
  "fees": null,
  "taxable": null,
  "category_id": null,
  "available_for_pickup": null,
  "v2_id": null
}
```

#### V1 Item Image

V1ItemImage

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The image's unique ID. |
| `url` | `String` | Optional | The image's publicly accessible URL. |

##### Example (as JSON)

```json
{
  "id": null,
  "url": null
}
```

#### V1 List Bank Accounts Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Bank Account Hash>`](#v1-bank-account) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Cash Drawer Shifts Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time minus 90 days. |
| `end_time` | `String` | Optional | The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time. |

##### Example (as JSON)

```json
{
  "order": null,
  "begin_time": null,
  "end_time": null
}
```

#### V1 List Cash Drawer Shifts Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Cash Drawer Shift Hash>`](#v1-cash-drawer-shift) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Categories Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Category Hash>`](#v1-category) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Discounts Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Discount Hash>`](#v1-discount) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Employee Roles Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `limit` | `Integer` | Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "order": null,
  "limit": null,
  "batch_token": null
}
```

#### V1 List Employee Roles Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Employee Role Hash>`](#v1-employee-role) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Employees Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `begin_updated_at` | `String` | Optional | If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format |
| `end_updated_at` | `String` | Optional | If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_created_at` | `String` | Optional | If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_created_at` | `String` | Optional | If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format. |
| `status` | [`String (V1 Employee Status)`](#v1-employee-status) | Optional | - |
| `external_id` | `String` | Optional | If provided, the endpoint returns only employee entities with the specified external_id. |
| `limit` | `Integer` | Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "order": null,
  "begin_updated_at": null,
  "end_updated_at": null,
  "begin_created_at": null,
  "end_created_at": null,
  "status": null,
  "external_id": null,
  "limit": null,
  "batch_token": null
}
```

#### V1 List Employees Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Employee Hash>`](#v1-employee) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Fees Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Fee Hash>`](#v1-fee) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Inventory Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `limit` | `Integer` | Optional | The maximum number of inventory entries to return in a single response. This value cannot exceed 1000. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "limit": null,
  "batch_token": null
}
```

#### V1 List Inventory Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Inventory Entry Hash>`](#v1-inventory-entry) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Items Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "batch_token": null
}
```

#### V1 List Items Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Item Hash>`](#v1-item) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Locations Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Merchant Hash>`](#v1-merchant) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Modifier Lists Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Modifier List Hash>`](#v1-modifier-list) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Orders Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `limit` | `Integer` | Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "order": null,
  "limit": null,
  "batch_token": null
}
```

#### V1 List Orders Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Order Hash>`](#v1-order) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Pages Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Page Hash>`](#v1-page) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Payments Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |
| `include_partial` | `Boolean` | Optional | Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed. |

##### Example (as JSON)

```json
{
  "order": null,
  "begin_time": null,
  "end_time": null,
  "limit": null,
  "batch_token": null,
  "include_partial": null
}
```

#### V1 List Payments Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Payment Hash>`](#v1-payment) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Refunds Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Optional | The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "order": null,
  "begin_time": null,
  "end_time": null,
  "limit": null,
  "batch_token": null
}
```

#### V1 List Refunds Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Refund Hash>`](#v1-refund) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Settlements Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `begin_time` | `String` | Optional | The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year. |
| `end_time` | `String` | Optional | The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time. |
| `limit` | `Integer` | Optional | The maximum number of payments to return in a single response. This value cannot exceed 200. |
| `status` | [`String (V1 List Settlements Request Status)`](#v1-list-settlements-request-status) | Optional | - |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "order": null,
  "begin_time": null,
  "end_time": null,
  "limit": null,
  "status": null,
  "batch_token": null
}
```

#### V1 List Settlements Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Settlement Hash>`](#v1-settlement) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Timecard Events Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Timecard Event Hash>`](#v1-timecard-event) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 List Timecards Request

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](#sort-order) | Optional | The order (e.g., chronological or alphabetical) in which results from a request are returned. |
| `employee_id` | `String` | Optional | If provided, the endpoint returns only timecards for the employee with the specified ID. |
| `begin_clockin_time` | `String` | Optional | If filtering results by their clockin_time field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_clockin_time` | `String` | Optional | If filtering results by their clockin_time field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_clockout_time` | `String` | Optional | If filtering results by their clockout_time field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_clockout_time` | `String` | Optional | If filtering results by their clockout_time field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_updated_at` | `String` | Optional | If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_updated_at` | `String` | Optional | If filtering results by their updated_at field, the end of the requested reporting period, in ISO 8601 format. |
| `deleted` | `Boolean` | Optional | If true, only deleted timecards are returned. If false, only valid timecards are returned.If you don't provide this parameter, both valid and deleted timecards are returned. |
| `limit` | `Integer` | Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

##### Example (as JSON)

```json
{
  "order": null,
  "employee_id": null,
  "begin_clockin_time": null,
  "end_clockin_time": null,
  "begin_clockout_time": null,
  "end_clockout_time": null,
  "begin_updated_at": null,
  "end_updated_at": null,
  "deleted": null,
  "limit": null,
  "batch_token": null
}
```

#### V1 List Timecards Response

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | [`Array<V1 Timecard Hash>`](#v1-timecard) | Optional | - |

##### Example (as JSON)

```json
{
  "items": null
}
```

#### V1 Merchant

Defines the fields that are included in the response body of
a request to the **RetrieveBusiness** endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The merchant account's unique identifier. |
| `name` | `String` | Optional | The name associated with the merchant account. |
| `email` | `String` | Optional | The email address associated with the merchant account. |
| `account_type` | [`String (V1 Merchant Account Type)`](#v1-merchant-account-type) | Optional | - |
| `account_capabilities` | `Array<String>` | Optional | Capabilities that are enabled for the merchant's Square account. Capabilities that are not listed in this array are not enabled for the account. |
| `country_code` | `String` | Optional | The country associated with the merchant account, in ISO 3166-1-alpha-2 format. |
| `language_code` | `String` | Optional | The language associated with the merchant account, in BCP 47 format. |
| `currency_code` | `String` | Optional | The currency associated with the merchant account, in ISO 4217 format. For example, the currency code for US dollars is USD. |
| `business_name` | `String` | Optional | The name of the merchant's business. |
| `business_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `business_phone` | [`V1 Phone Number Hash`](#v1-phone-number) | Optional | Represents a phone number. |
| `business_type` | [`String (V1 Merchant Business Type)`](#v1-merchant-business-type) | Optional | - |
| `shipping_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `location_details` | [`V1 Merchant Location Details Hash`](#v1-merchant-location-details) | Optional | Additional information for a single-location account specified by its associated business account, if it has one. |
| `market_url` | `String` | Optional | The URL of the merchant's online store. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "email": null,
  "account_type": null,
  "account_capabilities": null,
  "country_code": null,
  "language_code": null,
  "currency_code": null,
  "business_name": null,
  "business_address": null,
  "business_phone": null,
  "business_type": null,
  "shipping_address": null,
  "location_details": null,
  "market_url": null
}
```

#### V1 Merchant Location Details

Additional information for a single-location account specified by its associated business account, if it has one.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `nickname` | `String` | Optional | The nickname assigned to the single-location account by the parent business. This value appears in the parent business's multi-location dashboard. |

##### Example (as JSON)

```json
{
  "nickname": null
}
```

#### V1 Modifier List

V1ModifierList

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The modifier list's unique ID. |
| `name` | `String` | Optional | The modifier list's name. |
| `selection_type` | [`String (V1 Modifier List Selection Type)`](#v1-modifier-list-selection-type) | Optional | - |
| `modifier_options` | [`Array<V1 Modifier Option Hash>`](#v1-modifier-option) | Optional | The options included in the modifier list. |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "selection_type": null,
  "modifier_options": null,
  "v2_id": null
}
```

#### V1 Modifier Option

V1ModifierOption

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The modifier option's unique ID. |
| `name` | `String` | Optional | The modifier option's name. |
| `price_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `on_by_default` | `Boolean` | Optional | If true, the modifier option is the default option in a modifier list for which selection_type is SINGLE. |
| `ordinal` | `Integer` | Optional | Indicates the modifier option's list position when displayed in Square Register and the merchant dashboard. If more than one modifier option in the same modifier list has the same ordinal value, those options are displayed in alphabetical order. |
| `modifier_list_id` | `String` | Optional | The ID of the modifier list the option belongs to. |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "price_money": null,
  "on_by_default": null,
  "ordinal": null,
  "modifier_list_id": null,
  "v2_id": null
}
```

#### V1 Money

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `amount` | `Integer` | Optional | Amount in the lowest denominated value of this Currency. E.g. in USD<br>these are cents, in JPY they are Yen (which do not have a 'cent' concept). |
| `currency_code` | [`String (Currency)`](#currency) | Optional | Indicates the associated currency for an amount of money. Values correspond<br>to [ISO 4217](https://wikipedia.org/wiki/ISO_4217). |

##### Example (as JSON)

```json
{
  "amount": null,
  "currency_code": null
}
```

#### V1 Order

V1Order

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `id` | `String` | Optional | The order's unique identifier. |
| `buyer_email` | `String` | Optional | The email address of the order's buyer. |
| `recipient_name` | `String` | Optional | The name of the order's buyer. |
| `recipient_phone_number` | `String` | Optional | The phone number to use for the order's delivery. |
| `state` | [`String (V1 Order State)`](#v1-order-state) | Optional | - |
| `shipping_address` | [`Address Hash`](#address) | Optional | Represents a physical address. |
| `subtotal_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `total_shipping_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `total_tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `total_price_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `total_discount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `created_at` | `String` | Optional | The time when the order was created, in ISO 8601 format. |
| `updated_at` | `String` | Optional | The time when the order was last modified, in ISO 8601 format. |
| `expires_at` | `String` | Optional | The time when the order expires if no action is taken, in ISO 8601 format. |
| `payment_id` | `String` | Optional | The unique identifier of the payment associated with the order. |
| `buyer_note` | `String` | Optional | A note provided by the buyer when the order was created, if any. |
| `completed_note` | `String` | Optional | A note provided by the merchant when the order's state was set to COMPLETED, if any |
| `refunded_note` | `String` | Optional | A note provided by the merchant when the order's state was set to REFUNDED, if any. |
| `canceled_note` | `String` | Optional | A note provided by the merchant when the order's state was set to CANCELED, if any. |
| `tender` | [`V1 Tender Hash`](#v1-tender) | Optional | A tender represents a discrete monetary exchange. Square represents this<br>exchange as a money object with a specific currency and amount, where the<br>amount is given in the smallest denomination of the given currency.<br><br>Square POS can accept more than one form of tender for a single payment (such<br>as by splitting a bill between a credit card and a gift card). The `tender`<br>field of the Payment object lists all forms of tender used for the payment.<br><br>Split tender payments behave slightly differently from single tender payments:<br><br>The receipt_url for a split tender corresponds only to the first tender listed<br>in the tender field. To get the receipt URLs for the remaining tenders, use<br>the receipt_url fields of the corresponding Tender objects.<br><br>*A note on gift cards**: when a customer purchases a Square gift card from a<br>merchant, the merchant receives the full amount of the gift card in the<br>associated payment.<br><br>When that gift card is used as a tender, the balance of the gift card is<br>reduced and the merchant receives no funds. A `Tender` object with a type of<br>`SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the<br>associated payment. |
| `order_history` | [`Array<V1 Order History Entry Hash>`](#v1-order-history-entry) | Optional | The history of actions associated with the order. |
| `promo_code` | `String` | Optional | The promo code provided by the buyer, if any. |
| `btc_receive_address` | `String` | Optional | For Bitcoin transactions, the address that the buyer sent Bitcoin to. |
| `btc_price_satoshi` | `Float` | Optional | For Bitcoin transactions, the price of the buyer's order in satoshi (100 million satoshi equals 1 BTC). |

##### Example (as JSON)

```json
{
  "errors": null,
  "id": null,
  "buyer_email": null,
  "recipient_name": null,
  "recipient_phone_number": null,
  "state": null,
  "shipping_address": null,
  "subtotal_money": null,
  "total_shipping_money": null,
  "total_tax_money": null,
  "total_price_money": null,
  "total_discount_money": null,
  "created_at": null,
  "updated_at": null,
  "expires_at": null,
  "payment_id": null,
  "buyer_note": null,
  "completed_note": null,
  "refunded_note": null,
  "canceled_note": null,
  "tender": null,
  "order_history": null,
  "promo_code": null,
  "btc_receive_address": null,
  "btc_price_satoshi": null
}
```

#### V1 Order History Entry

V1OrderHistoryEntry

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `action` | [`String (V1 Order History Entry Action)`](#v1-order-history-entry-action) | Optional | - |
| `created_at` | `String` | Optional | The time when the action was performed, in ISO 8601 format. |

##### Example (as JSON)

```json
{
  "action": null,
  "created_at": null
}
```

#### V1 Page

V1Page

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The page's unique identifier. |
| `name` | `String` | Optional | The page's name, if any. |
| `page_index` | `Integer` | Optional | The page's position in the merchant's list of pages. Always an integer between 0 and 6, inclusive. |
| `cells` | [`Array<V1 Page Cell Hash>`](#v1-page-cell) | Optional | The cells included on the page. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "page_index": null,
  "cells": null
}
```

#### V1 Page Cell

V1PageCell

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `page_id` | `String` | Optional | The unique identifier of the page the cell is included on. |
| `row` | `Integer` | Optional | The row of the cell. Always an integer between 0 and 4, inclusive. |
| `column` | `Integer` | Optional | The column of the cell. Always an integer between 0 and 4, inclusive. |
| `object_type` | [`String (V1 Page Cell Object Type)`](#v1-page-cell-object-type) | Optional | - |
| `object_id` | `String` | Optional | The unique identifier of the entity represented in the cell. Not present for cells with an object_type of PLACEHOLDER. |
| `placeholder_type` | [`String (V1 Page Cell Placeholder Type)`](#v1-page-cell-placeholder-type) | Optional | - |

##### Example (as JSON)

```json
{
  "page_id": null,
  "row": null,
  "column": null,
  "object_type": null,
  "object_id": null,
  "placeholder_type": null
}
```

#### V1 Payment

A payment represents a paid transaction between a Square merchant and a
customer. Payment details are usually available from Connect API endpoints
within a few minutes after the transaction completes.

Each Payment object includes several fields that end in `_money`. These fields
describe the various amounts of money that contribute to the payment total:

<ul>
<li>
Monetary values are <b>positive</b> if they represent an
<em>increase</em> in the amount of money the merchant receives (e.g.,
<code>tax_money</code>, <code>tip_money</code>).
</li>
<li>
Monetary values are <b>negative</b> if they represent an
<em>decrease</em> in the amount of money the merchant receives (e.g.,
<code>discount_money</code>, <code>refunded_money</code>).
</li>
</ul>

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The payment's unique identifier. |
| `merchant_id` | `String` | Optional | The unique identifier of the merchant that took the payment. |
| `created_at` | `String` | Optional | The time when the payment was created, in ISO 8601 format. Reflects the time of the first payment if the object represents an incomplete partial payment, and the time of the last or complete payment otherwise. |
| `creator_id` | `String` | Optional | The unique identifier of the Square account that took the payment. |
| `device` | [`Device Hash`](#device) | Optional | - |
| `payment_url` | `String` | Optional | The URL of the payment's detail page in the merchant dashboard. The merchant must be signed in to the merchant dashboard to view this page. |
| `receipt_url` | `String` | Optional | The URL of the receipt for the payment. Note that for split tender<br>payments, this URL corresponds to the receipt for the first tender<br>listed in the payment's tender field. Each Tender object has its own<br>receipt_url field you can use to get the other receipts associated with<br>a split tender payment. |
| `inclusive_tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `additive_tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `tip_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `discount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `total_collected_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `processing_fee_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `net_total_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `swedish_rounding_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `gross_sales_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `net_sales_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `inclusive_tax` | [`Array<V1 Payment Tax Hash>`](#v1-payment-tax) | Optional | All of the inclusive taxes associated with the payment. |
| `additive_tax` | [`Array<V1 Payment Tax Hash>`](#v1-payment-tax) | Optional | All of the additive taxes associated with the payment. |
| `tender` | [`Array<V1 Tender Hash>`](#v1-tender) | Optional | All of the tenders associated with the payment. |
| `refunds` | [`Array<V1 Refund Hash>`](#v1-refund) | Optional | All of the refunds applied to the payment. Note that the value of all refunds on a payment can exceed the value of all tenders if a merchant chooses to refund money to a tender after previously accepting returned goods as part of an exchange. |
| `itemizations` | [`Array<V1 Payment Itemization Hash>`](#v1-payment-itemization) | Optional | The items purchased in the payment. |
| `surcharge_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `surcharges` | [`Array<V1 Payment Surcharge Hash>`](#v1-payment-surcharge) | Optional | A list of all surcharges associated with the payment. |
| `is_partial` | `Boolean` | Optional | Indicates whether or not the payment is only partially paid for.<br>If true, this payment will have the tenders collected so far, but the<br>itemizations will be empty until the payment is completed. |

##### Example (as JSON)

```json
{
  "id": null,
  "merchant_id": null,
  "created_at": null,
  "creator_id": null,
  "device": null,
  "payment_url": null,
  "receipt_url": null,
  "inclusive_tax_money": null,
  "additive_tax_money": null,
  "tax_money": null,
  "tip_money": null,
  "discount_money": null,
  "total_collected_money": null,
  "processing_fee_money": null,
  "net_total_money": null,
  "refunded_money": null,
  "swedish_rounding_money": null,
  "gross_sales_money": null,
  "net_sales_money": null,
  "inclusive_tax": null,
  "additive_tax": null,
  "tender": null,
  "refunds": null,
  "itemizations": null,
  "surcharge_money": null,
  "surcharges": null,
  "is_partial": null
}
```

#### V1 Payment Discount

V1PaymentDiscount

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The discount's name. |
| `applied_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `discount_id` | `String` | Optional | The ID of the applied discount, if available. Discounts applied in older versions of Square Register might not have an ID. |

##### Example (as JSON)

```json
{
  "name": null,
  "applied_money": null,
  "discount_id": null
}
```

#### V1 Payment Item Detail

V1PaymentItemDetail

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `category_name` | `String` | Optional | The name of the item's merchant-defined category, if any. |
| `sku` | `String` | Optional | The item's merchant-defined SKU, if any. |
| `item_id` | `String` | Optional | The unique ID of the item purchased, if any. |
| `item_variation_id` | `String` | Optional | The unique ID of the item variation purchased, if any. |

##### Example (as JSON)

```json
{
  "category_name": null,
  "sku": null,
  "item_id": null,
  "item_variation_id": null
}
```

#### V1 Payment Itemization

Payment include an` itemizations` field that lists the items purchased,
along with associated fees, modifiers, and discounts. Each itemization has an
`itemization_type` field that indicates which of the following the itemization
represents:

<ul>
<li>An item variation from the merchant's item library</li>
<li>A custom monetary amount</li>
<li>
An action performed on a Square gift card, such as activating or
reloading it.
</li>
</ul>

*Note**: itemization information included in a `Payment` object reflects
details collected **at the time of the payment**. Details such as the name or
price of items might have changed since the payment was processed.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The item's name. |
| `quantity` | `Float` | Optional | The quantity of the item purchased. This can be a decimal value. |
| `itemization_type` | [`String (V1 Payment Itemization Itemization Type)`](#v1-payment-itemization-itemization-type) | Optional | - |
| `item_detail` | [`V1 Payment Item Detail Hash`](#v1-payment-item-detail) | Optional | V1PaymentItemDetail |
| `notes` | `String` | Optional | Notes entered by the merchant about the item at the time of payment, if any. |
| `item_variation_name` | `String` | Optional | The name of the item variation purchased, if any. |
| `total_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `single_quantity_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `gross_sales_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `discount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `net_sales_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `taxes` | [`Array<V1 Payment Tax Hash>`](#v1-payment-tax) | Optional | All taxes applied to this itemization. |
| `discounts` | [`Array<V1 Payment Discount Hash>`](#v1-payment-discount) | Optional | All discounts applied to this itemization. |
| `modifiers` | [`Array<V1 Payment Modifier Hash>`](#v1-payment-modifier) | Optional | All modifier options applied to this itemization. |

##### Example (as JSON)

```json
{
  "name": null,
  "quantity": null,
  "itemization_type": null,
  "item_detail": null,
  "notes": null,
  "item_variation_name": null,
  "total_money": null,
  "single_quantity_money": null,
  "gross_sales_money": null,
  "discount_money": null,
  "net_sales_money": null,
  "taxes": null,
  "discounts": null,
  "modifiers": null
}
```

#### V1 Payment Modifier

V1PaymentModifier

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The modifier option's name. |
| `applied_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `modifier_option_id` | `String` | Optional | TThe ID of the applied modifier option, if available. Modifier options applied in older versions of Square Register might not have an ID. |

##### Example (as JSON)

```json
{
  "name": null,
  "applied_money": null,
  "modifier_option_id": null
}
```

#### V1 Payment Surcharge

V1PaymentSurcharge

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The name of the surcharge. |
| `applied_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `rate` | `String` | Optional | The amount of the surcharge as a percentage. The percentage is provided as a string representing the decimal equivalent of the percentage. For example, "0.7" corresponds to a 7% surcharge. Exactly one of rate or amount_money should be set. |
| `amount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `type` | [`String (V1 Payment Surcharge Type)`](#v1-payment-surcharge-type) | Optional | - |
| `taxable` | `Boolean` | Optional | Indicates whether the surcharge is taxable. |
| `taxes` | [`Array<V1 Payment Tax Hash>`](#v1-payment-tax) | Optional | The list of taxes that should be applied to the surcharge. |
| `surcharge_id` | `String` | Optional | A Square-issued unique identifier associated with the surcharge. |

##### Example (as JSON)

```json
{
  "name": null,
  "applied_money": null,
  "rate": null,
  "amount_money": null,
  "type": null,
  "taxable": null,
  "taxes": null,
  "surcharge_id": null
}
```

#### V1 Payment Tax

V1PaymentTax

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |
| `name` | `String` | Optional | The merchant-defined name of the tax. |
| `applied_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `rate` | `String` | Optional | The rate of the tax, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%. |
| `inclusion_type` | [`String (V1 Fee Inclusion Type)`](#v1-fee-inclusion-type) | Optional | - |
| `fee_id` | `String` | Optional | The ID of the tax, if available. Taxes applied in older versions of Square Register might not have an ID. |

##### Example (as JSON)

```json
{
  "errors": null,
  "name": null,
  "applied_money": null,
  "rate": null,
  "inclusion_type": null,
  "fee_id": null
}
```

#### V1 Phone Number

Represents a phone number.

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `calling_code` | `String` | The phone number's international calling code. For US phone numbers, this value is +1. |
| `number` | `String` | The phone number. |

##### Example (as JSON)

```json
{
  "calling_code": "calling_code4",
  "number": "number2"
}
```

#### V1 Refund

V1Refund

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `type` | [`String (V1 Create Refund Request Type)`](#v1-create-refund-request-type) | Optional | - |
| `reason` | `String` | Optional | The merchant-specified reason for the refund. |
| `refunded_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_processing_fee_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_additive_tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_additive_tax` | [`Array<V1 Payment Tax Hash>`](#v1-payment-tax) | Optional | All of the additive taxes associated with the refund. |
| `refunded_inclusive_tax_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_inclusive_tax` | [`Array<V1 Payment Tax Hash>`](#v1-payment-tax) | Optional | All of the inclusive taxes associated with the refund. |
| `refunded_tip_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_discount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_surcharge_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_surcharges` | [`Array<V1 Payment Surcharge Hash>`](#v1-payment-surcharge) | Optional | A list of all surcharges associated with the refund. |
| `created_at` | `String` | Optional | The time when the merchant initiated the refund for Square to process, in ISO 8601 format. |
| `processed_at` | `String` | Optional | The time when Square processed the refund on behalf of the merchant, in ISO 8601 format. |
| `payment_id` | `String` | Optional | A Square-issued ID associated with the refund. For single-tender refunds, payment_id is the ID of the original payment ID. For split-tender refunds, payment_id is the ID of the original tender. For exchange-based refunds (is_exchange == true), payment_id is the ID of the original payment ID even if the payment includes other tenders. |
| `merchant_id` | `String` | Optional | - |
| `is_exchange` | `Boolean` | Optional | Indicates whether or not the refund is associated with an exchange. If is_exchange is true, the refund reflects the value of goods returned in the exchange not the total money refunded. |

##### Example (as JSON)

```json
{
  "type": null,
  "reason": null,
  "refunded_money": null,
  "refunded_processing_fee_money": null,
  "refunded_tax_money": null,
  "refunded_additive_tax_money": null,
  "refunded_additive_tax": null,
  "refunded_inclusive_tax_money": null,
  "refunded_inclusive_tax": null,
  "refunded_tip_money": null,
  "refunded_discount_money": null,
  "refunded_surcharge_money": null,
  "refunded_surcharges": null,
  "created_at": null,
  "processed_at": null,
  "payment_id": null,
  "merchant_id": null,
  "is_exchange": null
}
```

#### V1 Settlement

V1Settlement

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The settlement's unique identifier. |
| `status` | [`String (V1 List Settlements Request Status)`](#v1-list-settlements-request-status) | Optional | - |
| `total_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `initiated_at` | `String` | Optional | The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format. |
| `bank_account_id` | `String` | Optional | The Square-issued unique identifier for the bank account associated with the settlement. |
| `entries` | [`Array<V1 Settlement Entry Hash>`](#v1-settlement-entry) | Optional | The entries included in this settlement. |

##### Example (as JSON)

```json
{
  "id": null,
  "status": null,
  "total_money": null,
  "initiated_at": null,
  "bank_account_id": null,
  "entries": null
}
```

#### V1 Settlement Entry

V1SettlementEntry

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payment_id` | `String` | Optional | The settlement's unique identifier. |
| `type` | [`String (V1 Settlement Entry Type)`](#v1-settlement-entry-type) | Optional | - |
| `amount_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `fee_money` | [`V1 Money Hash`](#v1-money) | Optional | - |

##### Example (as JSON)

```json
{
  "payment_id": null,
  "type": null,
  "amount_money": null,
  "fee_money": null
}
```

#### V1 Tender

A tender represents a discrete monetary exchange. Square represents this
exchange as a money object with a specific currency and amount, where the
amount is given in the smallest denomination of the given currency.

Square POS can accept more than one form of tender for a single payment (such
as by splitting a bill between a credit card and a gift card). The `tender`
field of the Payment object lists all forms of tender used for the payment.

Split tender payments behave slightly differently from single tender payments:

The receipt_url for a split tender corresponds only to the first tender listed
in the tender field. To get the receipt URLs for the remaining tenders, use
the receipt_url fields of the corresponding Tender objects.

*A note on gift cards**: when a customer purchases a Square gift card from a
merchant, the merchant receives the full amount of the gift card in the
associated payment.

When that gift card is used as a tender, the balance of the gift card is
reduced and the merchant receives no funds. A `Tender` object with a type of
`SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the
associated payment.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The tender's unique ID. |
| `type` | [`String (V1 Tender Type)`](#v1-tender-type) | Optional | - |
| `name` | `String` | Optional | A human-readable description of the tender. |
| `employee_id` | `String` | Optional | The ID of the employee that processed the tender. |
| `receipt_url` | `String` | Optional | The URL of the receipt for the tender. |
| `card_brand` | [`String (V1 Tender Card Brand)`](#v1-tender-card-brand) | Optional | The brand of a credit card. |
| `pan_suffix` | `String` | Optional | The last four digits of the provided credit card's account number. |
| `entry_method` | [`String (V1 Tender Entry Method)`](#v1-tender-entry-method) | Optional | - |
| `payment_note` | `String` | Optional | Notes entered by the merchant about the tender at the time of payment, if any. Typically only present for tender with the type: OTHER. |
| `total_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `tendered_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `tendered_at` | `String` | Optional | The time when the tender was created, in ISO 8601 format. |
| `settled_at` | `String` | Optional | The time when the tender was settled, in ISO 8601 format. |
| `change_back_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `refunded_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `is_exchange` | `Boolean` | Optional | Indicates whether or not the tender is associated with an exchange. If is_exchange is true, the tender represents the value of goods returned in an exchange not the actual money paid. The exchange value reduces the tender amounts needed to pay for items purchased in the exchange. |

##### Example (as JSON)

```json
{
  "id": null,
  "type": null,
  "name": null,
  "employee_id": null,
  "receipt_url": null,
  "card_brand": null,
  "pan_suffix": null,
  "entry_method": null,
  "payment_note": null,
  "total_money": null,
  "tendered_money": null,
  "tendered_at": null,
  "settled_at": null,
  "change_back_money": null,
  "refunded_money": null,
  "is_exchange": null
}
```

#### V1 Timecard

Represents a timecard for an employee.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The timecard's unique ID. |
| `employee_id` | `String` |  | The ID of the employee the timecard is associated with. |
| `deleted` | `Boolean` | Optional | If true, the timecard was deleted by the merchant, and it is no longer valid. |
| `clockin_time` | `String` | Optional | The clock-in time for the timecard, in ISO 8601 format. |
| `clockout_time` | `String` | Optional | The clock-out time for the timecard, in ISO 8601 format. Provide this value only if importing timecard information from another system. |
| `clockin_location_id` | `String` | Optional | The ID of the location the employee clocked in from. We strongly reccomend providing a clockin_location_id. Square uses the clockin_location_id to determine a timecard’s timezone and overtime rules. |
| `clockout_location_id` | `String` | Optional | The ID of the location the employee clocked out from. Provide this value only if importing timecard information from another system. |
| `created_at` | `String` | Optional | The time when the timecard was created, in ISO 8601 format. |
| `updated_at` | `String` | Optional | The time when the timecard was most recently updated, in ISO 8601 format. |
| `regular_seconds_worked` | `Float` | Optional | The total number of regular (non-overtime) seconds worked in the timecard. |
| `overtime_seconds_worked` | `Float` | Optional | The total number of overtime seconds worked in the timecard. |
| `doubletime_seconds_worked` | `Float` | Optional | The total number of doubletime seconds worked in the timecard. |

##### Example (as JSON)

```json
{
  "id": null,
  "employee_id": "employee_id0",
  "deleted": null,
  "clockin_time": null,
  "clockout_time": null,
  "clockin_location_id": null,
  "clockout_location_id": null,
  "created_at": null,
  "updated_at": null,
  "regular_seconds_worked": null,
  "overtime_seconds_worked": null,
  "doubletime_seconds_worked": null
}
```

#### V1 Timecard Event

V1TimecardEvent

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The event's unique ID. |
| `event_type` | [`String (V1 Timecard Event Event Type)`](#v1-timecard-event-event-type) | Optional | Actions that resulted in a change to a timecard. All timecard<br>events created with the Connect API have an event type that begins with<br>`API`. |
| `clockin_time` | `String` | Optional | The time the employee clocked in, in ISO 8601 format. |
| `clockout_time` | `String` | Optional | The time the employee clocked out, in ISO 8601 format. |
| `created_at` | `String` | Optional | The time when the event was created, in ISO 8601 format. |

##### Example (as JSON)

```json
{
  "id": null,
  "event_type": null,
  "clockin_time": null,
  "clockout_time": null,
  "created_at": null
}
```

#### V1 Update Category Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Category Hash`](#v1-category) | V1Category |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "v2_id": null
  }
}
```

#### V1 Update Discount Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Discount Hash`](#v1-discount) | V1Discount |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "rate": null,
    "amount_money": null,
    "discount_type": null,
    "pin_required": null,
    "color": null,
    "v2_id": null
  }
}
```

#### V1 Update Employee Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Employee Hash`](#v1-employee) | Represents one of a business's employees. |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "first_name": "first_name6",
    "last_name": "last_name4",
    "role_ids": null,
    "authorized_location_ids": null,
    "email": null,
    "status": null,
    "external_id": null,
    "created_at": null,
    "updated_at": null
  }
}
```

#### V1 Update Employee Role Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Employee Role Hash`](#v1-employee-role) | V1EmployeeRole |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": "name6",
    "permissions": [
      "REGISTER_APPLY_RESTRICTED_DISCOUNTS",
      "REGISTER_CHANGE_SETTINGS",
      "REGISTER_EDIT_ITEM"
    ],
    "is_owner": null,
    "created_at": null,
    "updated_at": null
  }
}
```

#### V1 Update Fee Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Fee Hash`](#v1-fee) | V1Fee |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "rate": null,
    "calculation_phase": null,
    "adjustment_type": null,
    "applies_to_custom_amounts": null,
    "enabled": null,
    "inclusion_type": null,
    "type": null,
    "v2_id": null
  }
}
```

#### V1 Update Item Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Item Hash`](#v1-item) | V1Item |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "description": null,
    "type": null,
    "color": null,
    "abbreviation": null,
    "visibility": null,
    "available_online": null,
    "master_image": null,
    "category": null,
    "variations": null,
    "modifier_lists": null,
    "fees": null,
    "taxable": null,
    "category_id": null,
    "available_for_pickup": null,
    "v2_id": null
  }
}
```

#### V1 Update Modifier List Request

V1UpdateModifierListRequest

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `name` | `String` | Optional | The modifier list's name. |
| `selection_type` | [`String (V1 Modifier List Selection Type)`](#v1-modifier-list-selection-type) | Optional | - |

##### Example (as JSON)

```json
{
  "name": null,
  "selection_type": null
}
```

#### V1 Update Modifier Option Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Modifier Option Hash`](#v1-modifier-option) | V1ModifierOption |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "price_money": null,
    "on_by_default": null,
    "ordinal": null,
    "modifier_list_id": null,
    "v2_id": null
  }
}
```

#### V1 Update Order Request

V1UpdateOrderRequest

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `action` | [`String (V1 Update Order Request Action)`](#v1-update-order-request-action) |  | - |
| `shipped_tracking_number` | `String` | Optional | The tracking number of the shipment associated with the order. Only valid if action is COMPLETE. |
| `completed_note` | `String` | Optional | A merchant-specified note about the completion of the order. Only valid if action is COMPLETE. |
| `refunded_note` | `String` | Optional | A merchant-specified note about the refunding of the order. Only valid if action is REFUND. |
| `canceled_note` | `String` | Optional | A merchant-specified note about the canceling of the order. Only valid if action is CANCEL. |

##### Example (as JSON)

```json
{
  "action": "COMPLETE",
  "shipped_tracking_number": null,
  "completed_note": null,
  "refunded_note": null,
  "canceled_note": null
}
```

#### V1 Update Page Cell Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Page Cell Hash`](#v1-page-cell) | V1PageCell |

##### Example (as JSON)

```json
{
  "body": {
    "page_id": null,
    "row": null,
    "column": null,
    "object_type": null,
    "object_id": null,
    "placeholder_type": null
  }
}
```

#### V1 Update Page Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Page Hash`](#v1-page) | V1Page |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "page_index": null,
    "cells": null
  }
}
```

#### V1 Update Timecard Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Timecard Hash`](#v1-timecard) | Represents a timecard for an employee. |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "employee_id": "employee_id4",
    "deleted": null,
    "clockin_time": null,
    "clockout_time": null,
    "clockin_location_id": null,
    "clockout_location_id": null,
    "created_at": null,
    "updated_at": null,
    "regular_seconds_worked": null,
    "overtime_seconds_worked": null,
    "doubletime_seconds_worked": null
  }
}
```

#### V1 Update Variation Request

##### Fields

| Name | Type | Description |
|  --- | --- | --- |
| `body` | [`V1 Variation Hash`](#v1-variation) | V1Variation |

##### Example (as JSON)

```json
{
  "body": {
    "id": null,
    "name": null,
    "item_id": null,
    "ordinal": null,
    "pricing_type": null,
    "price_money": null,
    "sku": null,
    "track_inventory": null,
    "inventory_alert_type": null,
    "inventory_alert_threshold": null,
    "user_data": null,
    "v2_id": null
  }
}
```

#### V1 Variation

V1Variation

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | The item variation's unique ID. |
| `name` | `String` | Optional | The item variation's name. |
| `item_id` | `String` | Optional | The ID of the variation's associated item. |
| `ordinal` | `Integer` | Optional | Indicates the variation's list position when displayed in Square Register and the merchant dashboard. If more than one variation for the same item has the same ordinal value, those variations are displayed in alphabetical order |
| `pricing_type` | [`String (V1 Variation Pricing Type)`](#v1-variation-pricing-type) | Optional | - |
| `price_money` | [`V1 Money Hash`](#v1-money) | Optional | - |
| `sku` | `String` | Optional | The item variation's SKU, if any. |
| `track_inventory` | `Boolean` | Optional | If true, inventory tracking is active for the variation. |
| `inventory_alert_type` | [`String (V1 Variation Inventory Alert Type)`](#v1-variation-inventory-alert-type) | Optional | - |
| `inventory_alert_threshold` | `Integer` | Optional | If the inventory quantity for the variation is less than or equal to this value and inventory_alert_type is LOW_QUANTITY, the variation displays an alert in the merchant dashboard. |
| `user_data` | `String` | Optional | Arbitrary metadata associated with the variation. Cannot exceed 255 characters. |
| `v2_id` | `String` | Optional | The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID. |

##### Example (as JSON)

```json
{
  "id": null,
  "name": null,
  "item_id": null,
  "ordinal": null,
  "pricing_type": null,
  "price_money": null,
  "sku": null,
  "track_inventory": null,
  "inventory_alert_type": null,
  "inventory_alert_threshold": null,
  "user_data": null,
  "v2_id": null
}
```

#### Void Transaction Response

Defines the fields that are included in the response body of
a request to the VoidTransaction endpoint.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `errors` | [`Array<Error Hash>`](#error) | Optional | Any errors that occurred during the request. |

##### Example (as JSON)

```json
{}
```

#### Workweek Config

Sets the Day of the week and hour of the day that a business starts a 
work week. Used for the calculation of overtime pay.

##### Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Optional | UUID for this object |
| `start_of_week` | [`String (Weekday)`](#weekday) |  | The days of the week. |
| `start_of_day_local_time` | `String` |  | The local time at which a business week cuts over. Represented as a<br>string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are<br>truncated). |
| `version` | `Integer` | Optional | Used for resolving concurrency issues; request will fail if version<br>provided does not match server version at time of request. If not provided,<br>Square executes a blind write; potentially overwriting data from another<br>write. |
| `created_at` | `String` | Optional | A read-only timestamp in RFC 3339 format; presented in UTC |
| `updated_at` | `String` | Optional | A read-only timestamp in RFC 3339 format; presented in UTC |

##### Example (as JSON)

```json
{
  "id": null,
  "start_of_week": "MON",
  "start_of_day_local_time": "start_of_day_local_time6",
  "version": null,
  "created_at": null,
  "updated_at": null
}
```
