# V1 Employees

```ruby
v1_employees_api = client.v1_employees
```

## Class Name

`V1EmployeesApi`

## Methods

* [List Employees](/doc/v1-employees.md#list-employees)
* [Create Employee](/doc/v1-employees.md#create-employee)
* [Retrieve Employee](/doc/v1-employees.md#retrieve-employee)
* [Update Employee](/doc/v1-employees.md#update-employee)
* [List Employee Roles](/doc/v1-employees.md#list-employee-roles)
* [Create Employee Role](/doc/v1-employees.md#create-employee-role)
* [Retrieve Employee Role](/doc/v1-employees.md#retrieve-employee-role)
* [Update Employee Role](/doc/v1-employees.md#update-employee-role)
* [List Timecards](/doc/v1-employees.md#list-timecards)
* [Create Timecard](/doc/v1-employees.md#create-timecard)
* [Delete Timecard](/doc/v1-employees.md#delete-timecard)
* [Retrieve Timecard](/doc/v1-employees.md#retrieve-timecard)
* [Update Timecard](/doc/v1-employees.md#update-timecard)
* [List Timecard Events](/doc/v1-employees.md#list-timecard-events)
* [List Cash Drawer Shifts](/doc/v1-employees.md#list-cash-drawer-shifts)
* [Retrieve Cash Drawer Shift](/doc/v1-employees.md#retrieve-cash-drawer-shift)

## List Employees

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

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which employees are listed in the response, based on their created_at field.      Default value: ASC |
| `begin_updated_at` | `String` | Query, Optional | If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format |
| `end_updated_at` | `String` | Query, Optional | If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format. |
| `begin_created_at` | `String` | Query, Optional | If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format. |
| `end_created_at` | `String` | Query, Optional | If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format. |
| `status` | [`String (V1 List Employees Request Status)`](/doc/models/v1-list-employees-request-status.md) | Query, Optional | If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE). |
| `external_id` | `String` | Query, Optional | If provided, the endpoint returns only employee entities with the specified external_id. |
| `limit` | `Integer` | Query, Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Employee Hash>`](/doc/models/v1-employee.md)

### Example Usage

```ruby
order = 'DESC'
begin_updated_at = 'begin_updated_at6'
end_updated_at = 'end_updated_at4'
begin_created_at = 'begin_created_at6'
end_created_at = 'end_created_at8'
status = 'ACTIVE'
external_id = 'external_id6'
limit = 172
batch_token = 'batch_token2'

result = v1_employees_api.list_employees(order: order, begin_updated_at: begin_updated_at, end_updated_at: end_updated_at, begin_created_at: begin_created_at, end_created_at: end_created_at, status: status, external_id: external_id, limit: limit, batch_token: batch_token)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Employee

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

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Employee Hash`](/doc/models/v1-employee.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Employee Hash`](/doc/models/v1-employee.md)

### Example Usage

```ruby
body = {}
body[:id] = 'id6'
body[:first_name] = 'first_name6'
body[:last_name] = 'last_name4'
body[:role_ids] = ['role_ids0', 'role_ids1']
body[:authorized_location_ids] = ['authorized_location_ids7', 'authorized_location_ids8']
body[:email] = 'email0'
body[:status] = 'ACTIVE'

result = v1_employees_api.create_employee(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Employee

Provides the details for a single employee.

```ruby
def retrieve_employee(employee_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Template, Required | The employee's ID. |

### Response Type

[`V1 Employee Hash`](/doc/models/v1-employee.md)

### Example Usage

```ruby
employee_id = 'employee_id0'

result = v1_employees_api.retrieve_employee(employee_id: employee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Employee

UpdateEmployee

```ruby
def update_employee(employee_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Template, Required | The ID of the role to modify. |
| `body` | [`V1 Employee Hash`](/doc/models/v1-employee.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Employee Hash`](/doc/models/v1-employee.md)

### Example Usage

```ruby
employee_id = 'employee_id0'
body = {}
body[:id] = 'id6'
body[:first_name] = 'first_name6'
body[:last_name] = 'last_name4'
body[:role_ids] = ['role_ids0', 'role_ids1']
body[:authorized_location_ids] = ['authorized_location_ids7', 'authorized_location_ids8']
body[:email] = 'email0'
body[:status] = 'ACTIVE'

result = v1_employees_api.update_employee(employee_id: employee_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Employee Roles

Provides summary information for all of a business's employee roles.

```ruby
def list_employee_roles(order: nil,
                        limit: nil,
                        batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which employees are listed in the response, based on their created_at field.Default value: ASC |
| `limit` | `Integer` | Query, Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

### Response Type

[`Array<V1 Employee Role Hash>`](/doc/models/v1-employee-role.md)

### Example Usage

```ruby
order = 'DESC'
limit = 172
batch_token = 'batch_token2'

result = v1_employees_api.list_employee_roles(order: order, limit: limit, batch_token: batch_token)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Employee Role

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

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Employee Role Hash`](/doc/models/v1-employee-role.md) | Body, Required | An EmployeeRole object with a name and permissions, and an optional owner flag. |

### Response Type

[`V1 Employee Role Hash`](/doc/models/v1-employee-role.md)

### Example Usage

```ruby
body = {}
body[:id] = 'id6'
body[:name] = 'name6'
body[:permissions] = ['REGISTER_APPLY_RESTRICTED_DISCOUNTS', 'REGISTER_CHANGE_SETTINGS', 'REGISTER_EDIT_ITEM']
body[:is_owner] = false
body[:created_at] = 'created_at4'
body[:updated_at] = 'updated_at8'

result = v1_employees_api.create_employee_role(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Employee Role

Provides the details for a single employee role.

```ruby
def retrieve_employee_role(role_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `role_id` | `String` | Template, Required | The role's ID. |

### Response Type

[`V1 Employee Role Hash`](/doc/models/v1-employee-role.md)

### Example Usage

```ruby
role_id = 'role_id6'

result = v1_employees_api.retrieve_employee_role(role_id: role_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Employee Role

Modifies the details of an employee role.

```ruby
def update_employee_role(role_id:,
                         body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `role_id` | `String` | Template, Required | The ID of the role to modify. |
| `body` | [`V1 Employee Role Hash`](/doc/models/v1-employee-role.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Employee Role Hash`](/doc/models/v1-employee-role.md)

### Example Usage

```ruby
role_id = 'role_id6'
body = {}
body[:id] = 'id6'
body[:name] = 'name6'
body[:permissions] = ['REGISTER_APPLY_RESTRICTED_DISCOUNTS', 'REGISTER_CHANGE_SETTINGS', 'REGISTER_EDIT_ITEM']
body[:is_owner] = false
body[:created_at] = 'created_at4'
body[:updated_at] = 'updated_at8'

result = v1_employees_api.update_employee_role(role_id: role_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Timecards

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
                   deleted: false,
                   limit: nil,
                   batch_token: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which timecards are listed in the response, based on their created_at field. |
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

### Response Type

[`Array<V1 Timecard Hash>`](/doc/models/v1-timecard.md)

### Example Usage

```ruby
order = 'DESC'
employee_id = 'employee_id0'
begin_clockin_time = 'begin_clockin_time8'
end_clockin_time = 'end_clockin_time2'
begin_clockout_time = 'begin_clockout_time0'
end_clockout_time = 'end_clockout_time2'
begin_updated_at = 'begin_updated_at6'
end_updated_at = 'end_updated_at4'
deleted = false
limit = 172
batch_token = 'batch_token2'

result = v1_employees_api.list_timecards(order: order, employee_id: employee_id, begin_clockin_time: begin_clockin_time, end_clockin_time: end_clockin_time, begin_clockout_time: begin_clockout_time, end_clockout_time: end_clockout_time, begin_updated_at: begin_updated_at, end_updated_at: end_updated_at, deleted: deleted, limit: limit, batch_token: batch_token)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Create Timecard

Creates a timecard for an employee and clocks them in with an
`API_CREATE` event and a `clockin_time` set to the current time unless
the request provides a different value.

To import timecards from another
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

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Timecard Hash`](/doc/models/v1-timecard.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

### Response Type

[`V1 Timecard Hash`](/doc/models/v1-timecard.md)

### Example Usage

```ruby
body = {}
body[:id] = 'id6'
body[:employee_id] = 'employee_id4'
body[:deleted] = false
body[:clockin_time] = 'clockin_time2'
body[:clockout_time] = 'clockout_time2'
body[:clockin_location_id] = 'clockin_location_id4'

result = v1_employees_api.create_timecard(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Delete Timecard

Deletes a timecard. Timecards can also be deleted through the
Square Dashboard. Deleted timecards are still accessible through
Connect API endpoints, but cannot be modified. The `deleted` field of
the `Timecard` object indicates whether the timecard has been deleted.


__Note__: By default, deleted timecards appear alongside valid timecards in
results returned by the [ListTimecards](#endpoint-v1employees-listtimecards)
endpoint. To filter deleted timecards, include the `deleted` query
parameter in the list request.

Only approved accounts can manage their employees with Square.
Unapproved accounts cannot use employee management features with the
API.

```ruby
def delete_timecard(timecard_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | The ID of the timecard to delete. |

### Response Type

`Object`

### Example Usage

```ruby
timecard_id = 'timecard_id0'

result = v1_employees_api.delete_timecard(timecard_id: timecard_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Timecard

Provides the details for a single timecard.


<aside>
Only approved accounts can manage their employees with Square.
Unapproved accounts cannot use employee management features with the
API.
</aside>

```ruby
def retrieve_timecard(timecard_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | The timecard's ID. |

### Response Type

[`V1 Timecard Hash`](/doc/models/v1-timecard.md)

### Example Usage

```ruby
timecard_id = 'timecard_id0'

result = v1_employees_api.retrieve_timecard(timecard_id: timecard_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Update Timecard

Modifies the details of a timecard with an `API_EDIT` event for
the timecard. Updating an active timecard with a `clockout_time`
clocks the employee out.

```ruby
def update_timecard(timecard_id:,
                    body:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | TThe ID of the timecard to modify. |
| `body` | [`V1 Timecard Hash`](/doc/models/v1-timecard.md) | Body, Required | An object containing the fields to POST for the request.<br>See the corresponding object definition for field details. |

### Response Type

[`V1 Timecard Hash`](/doc/models/v1-timecard.md)

### Example Usage

```ruby
timecard_id = 'timecard_id0'
body = {}
body[:id] = 'id6'
body[:employee_id] = 'employee_id4'
body[:deleted] = false
body[:clockin_time] = 'clockin_time2'
body[:clockout_time] = 'clockout_time2'
body[:clockin_location_id] = 'clockin_location_id4'

result = v1_employees_api.update_timecard(timecard_id: timecard_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Timecard Events

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

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timecard_id` | `String` | Template, Required | The ID of the timecard to list events for. |

### Response Type

[`Array<V1 Timecard Event Hash>`](/doc/models/v1-timecard-event.md)

### Example Usage

```ruby
timecard_id = 'timecard_id0'

result = v1_employees_api.list_timecard_events(timecard_id: timecard_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## List Cash Drawer Shifts

Provides the details for all of a location's cash drawer shifts during a date range. The date range you specify cannot exceed 90 days.

```ruby
def list_cash_drawer_shifts(location_id:,
                            order: nil,
                            begin_time: nil,
                            end_time: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list cash drawer shifts for. |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which cash drawer shifts are listed in the response, based on their created_at field. Default value: ASC |
| `begin_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time minus 90 days. |
| `end_time` | `String` | Query, Optional | The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time. |

### Response Type

[`Array<V1 Cash Drawer Shift Hash>`](/doc/models/v1-cash-drawer-shift.md)

### Example Usage

```ruby
location_id = 'location_id4'
order = 'DESC'
begin_time = 'begin_time2'
end_time = 'end_time2'

result = v1_employees_api.list_cash_drawer_shifts(location_id: location_id, order: order, begin_time: begin_time, end_time: end_time)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

## Retrieve Cash Drawer Shift

Provides the details for a single cash drawer shift, including all events that occurred during the shift.

```ruby
def retrieve_cash_drawer_shift(location_id:,
                               shift_id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to list cash drawer shifts for. |
| `shift_id` | `String` | Template, Required | The shift's ID. |

### Response Type

[`V1 Cash Drawer Shift Hash`](/doc/models/v1-cash-drawer-shift.md)

### Example Usage

```ruby
location_id = 'location_id4'
shift_id = 'shift_id0'

result = v1_employees_api.retrieve_cash_drawer_shift(location_id: location_id, shift_id: shift_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```

