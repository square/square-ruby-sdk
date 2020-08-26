# Employees

```ruby
employees_api = client.employees
```

## Class Name

`EmployeesApi`

## Methods

* [List Employees](/doc/employees.md#list-employees)
* [Retrieve Employee](/doc/employees.md#retrieve-employee)

## List Employees

ListEmployees

```ruby
def list_employees(location_id: nil,
                   status: nil,
                   limit: nil,
                   cursor: nil)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Query, Optional | - |
| `status` | [`String (Employee Status)`](/doc/models/employee-status.md) | Query, Optional | Specifies the EmployeeStatus to filter the employee by. |
| `limit` | `Integer` | Query, Optional | The number of employees to be returned on each page. |
| `cursor` | `String` | Query, Optional | The token required to retrieve the specified page of results. |

### Response Type

[`List Employees Response Hash`](/doc/models/list-employees-response.md)

### Example Usage

```ruby
location_id = 'location_id4'
status = 'ACTIVE'
limit = 172
cursor = 'cursor6'

result = employees_api.list_employees(location_id: location_id, status: status, limit: limit, cursor: cursor)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Retrieve Employee

RetrieveEmployee

```ruby
def retrieve_employee(id:)
```

### Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `id` | `String` | Template, Required | UUID for the employee that was requested. |

### Response Type

[`Retrieve Employee Response Hash`](/doc/models/retrieve-employee-response.md)

### Example Usage

```ruby
id = 'id0'

result = employees_api.retrieve_employee(id: id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

