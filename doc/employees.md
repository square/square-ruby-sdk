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
| `location_id` | `String` | Query, Optional | Filter employees returned to only those that are associated with the specified location. |
| `status` | [`String (Employee Status)`]($m/EmployeeStatus) | Query, Optional | Specifies the EmployeeStatus to filter the employee by. |
| `limit` | `Integer` | Query, Optional | The number of employees to be returned on each page. |
| `cursor` | `String` | Query, Optional | The token required to retrieve the specified page of results. |

### Response Type

[`List Employees Response Hash`]($m/ListEmployeesResponse)

### Example Usage

```ruby
result = employees_api.list_employees()

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

[`Retrieve Employee Response Hash`]($m/RetrieveEmployeeResponse)

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

