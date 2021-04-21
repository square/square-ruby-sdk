# V1 Employees

```ruby
v1_employees_api = client.v1_employees
```

## Class Name

`V1EmployeesApi`

## Methods

* [List Employees](/doc/api/v1-employees.md#list-employees)
* [Create Employee](/doc/api/v1-employees.md#create-employee)
* [Retrieve Employee](/doc/api/v1-employees.md#retrieve-employee)
* [Update Employee](/doc/api/v1-employees.md#update-employee)
* [List Employee Roles](/doc/api/v1-employees.md#list-employee-roles)
* [Create Employee Role](/doc/api/v1-employees.md#create-employee-role)
* [Retrieve Employee Role](/doc/api/v1-employees.md#retrieve-employee-role)
* [Update Employee Role](/doc/api/v1-employees.md#update-employee-role)


# List Employees

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

## Parameters

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

## Response Type

[`Array<V1 Employee Hash>`](/doc/models/v1-employee.md)

## Example Usage

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


# Create Employee

Use the CreateEmployee endpoint to add an employee to a Square
account. Employees created with the Connect API have an initial status
of `INACTIVE`. Inactive employees cannot sign in to Square Point of Sale
until they are activated from the Square Dashboard. Employee status
cannot be changed with the Connect API.

Employee entities cannot be deleted. To disable employee profiles,
set the employee's status to <code>INACTIVE</code>

```ruby
def create_employee(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Employee Hash`](/doc/models/v1-employee.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`V1 Employee Hash`](/doc/models/v1-employee.md)

## Example Usage

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


# Retrieve Employee

Provides the details for a single employee.

```ruby
def retrieve_employee(employee_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Template, Required | The employee's ID. |

## Response Type

[`V1 Employee Hash`](/doc/models/v1-employee.md)

## Example Usage

```ruby
employee_id = 'employee_id0'

result = v1_employees_api.retrieve_employee(employee_id: employee_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```


# Update Employee

UpdateEmployee

```ruby
def update_employee(employee_id:,
                    body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `employee_id` | `String` | Template, Required | The ID of the role to modify. |
| `body` | [`V1 Employee Hash`](/doc/models/v1-employee.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`V1 Employee Hash`](/doc/models/v1-employee.md)

## Example Usage

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


# List Employee Roles

Provides summary information for all of a business's employee roles.

```ruby
def list_employee_roles(order: nil,
                        limit: nil,
                        batch_token: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `order` | [`String (Sort Order)`](/doc/models/sort-order.md) | Query, Optional | The order in which employees are listed in the response, based on their created_at field.Default value: ASC |
| `limit` | `Integer` | Query, Optional | The maximum integer number of employee entities to return in a single response. Default 100, maximum 200. |
| `batch_token` | `String` | Query, Optional | A pagination cursor to retrieve the next set of results for your<br>original query to the endpoint. |

## Response Type

[`Array<V1 Employee Role Hash>`](/doc/models/v1-employee-role.md)

## Example Usage

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


# Create Employee Role

Creates an employee role you can then assign to employees.

Square accounts can include any number of roles that can be assigned to
employees. These roles define the actions and permissions granted to an
employee with that role. For example, an employee with a "Shift Manager"
role might be able to issue refunds in Square Point of Sale, whereas an
employee with a "Clerk" role might not.

Roles are assigned with the [V1UpdateEmployee](/doc/api/v1-employees.md#update-employee-role)
endpoint. An employee can have only one role at a time.

If an employee has no role, they have none of the permissions associated
with roles. All employees can accept payments with Square Point of Sale.

```ruby
def create_employee_role(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`V1 Employee Role Hash`](/doc/models/v1-employee-role.md) | Body, Required | An EmployeeRole object with a name and permissions, and an optional owner flag. |

## Response Type

[`V1 Employee Role Hash`](/doc/models/v1-employee-role.md)

## Example Usage

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


# Retrieve Employee Role

Provides the details for a single employee role.

```ruby
def retrieve_employee_role(role_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `role_id` | `String` | Template, Required | The role's ID. |

## Response Type

[`V1 Employee Role Hash`](/doc/models/v1-employee-role.md)

## Example Usage

```ruby
role_id = 'role_id6'

result = v1_employees_api.retrieve_employee_role(role_id: role_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.data
end
```


# Update Employee Role

Modifies the details of an employee role.

```ruby
def update_employee_role(role_id:,
                         body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `role_id` | `String` | Template, Required | The ID of the role to modify. |
| `body` | [`V1 Employee Role Hash`](/doc/models/v1-employee-role.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`V1 Employee Role Hash`](/doc/models/v1-employee-role.md)

## Example Usage

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

