# Team

```ruby
team_api = client.team
```

## Class Name

`TeamApi`

## Methods

* [Create Team Member](../../doc/api/team.md#create-team-member)
* [Bulk Create Team Members](../../doc/api/team.md#bulk-create-team-members)
* [Bulk Update Team Members](../../doc/api/team.md#bulk-update-team-members)
* [List Jobs](../../doc/api/team.md#list-jobs)
* [Create Job](../../doc/api/team.md#create-job)
* [Retrieve Job](../../doc/api/team.md#retrieve-job)
* [Update Job](../../doc/api/team.md#update-job)
* [Search Team Members](../../doc/api/team.md#search-team-members)
* [Retrieve Team Member](../../doc/api/team.md#retrieve-team-member)
* [Update Team Member](../../doc/api/team.md#update-team-member)
* [Retrieve Wage Setting](../../doc/api/team.md#retrieve-wage-setting)
* [Update Wage Setting](../../doc/api/team.md#update-wage-setting)


# Create Team Member

Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates.
You must provide the following values in your request to this endpoint:

- `given_name`
- `family_name`

Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).

```ruby
def create_team_member(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Team Member Request Hash`](../../doc/models/create-team-member-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Team Member Response Hash`](../../doc/models/create-team-member-response.md).

## Example Usage

```ruby
body = {
  :idempotency_key => 'idempotency-key-0',
  :team_member => {
    :reference_id => 'reference_id_1',
    :status => 'ACTIVE',
    :given_name => 'Joe',
    :family_name => 'Doe',
    :email_address => 'joe_doe@gmail.com',
    :phone_number => '+14159283333',
    :assigned_locations => {
      :assignment_type => 'EXPLICIT_LOCATIONS',
      :location_ids => [
        'YSGH2WBKG94QZ',
        'GA2Y9HSJ8KRYT'
      ]
    },
    :wage_setting => {
      :job_assignments => [
        {
          :pay_type => 'SALARY',
          :annual_rate => {
            :amount => 3000000,
            :currency => 'USD'
          },
          :weekly_hours => 40,
          :job_id => 'FjS8x95cqHiMenw4f1NAUH4P'
        },
        {
          :pay_type => 'HOURLY',
          :hourly_rate => {
            :amount => 2000,
            :currency => 'USD'
          },
          :job_id => 'VDNpRv8da51NU8qZFC5zDWpF'
        }
      ],
      :is_overtime_exempt => true
    }
  }
}


result = team_api.create_team_member(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Create Team Members

Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates.
This process is non-transactional and processes as much of the request as possible. If one of the creates in
the request cannot be successfully processed, the request is not marked as failed, but the body of the response
contains explicit error information for the failed create.

Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).

```ruby
def bulk_create_team_members(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Create Team Members Request Hash`](../../doc/models/bulk-create-team-members-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Bulk Create Team Members Response Hash`](../../doc/models/bulk-create-team-members-response.md).

## Example Usage

```ruby
body = {
  :team_members => {
    'idempotency-key-1' => {
      :team_member => {
        :reference_id => 'reference_id_1',
        :given_name => 'Joe',
        :family_name => 'Doe',
        :email_address => 'joe_doe@gmail.com',
        :phone_number => '+14159283333',
        :assigned_locations => {
          :assignment_type => 'EXPLICIT_LOCATIONS',
          :location_ids => [
            'YSGH2WBKG94QZ',
            'GA2Y9HSJ8KRYT'
          ]
        }
      }
    },
    'idempotency-key-2' => {
      :team_member => {
        :reference_id => 'reference_id_2',
        :given_name => 'Jane',
        :family_name => 'Smith',
        :email_address => 'jane_smith@gmail.com',
        :phone_number => '+14159223334',
        :assigned_locations => {
          :assignment_type => 'ALL_CURRENT_AND_FUTURE_LOCATIONS'
        }
      }
    }
  }
}


result = team_api.bulk_create_team_members(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Bulk Update Team Members

Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates.
This process is non-transactional and processes as much of the request as possible. If one of the updates in
the request cannot be successfully processed, the request is not marked as failed, but the body of the response
contains explicit error information for the failed update.
Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).

```ruby
def bulk_update_team_members(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Bulk Update Team Members Request Hash`](../../doc/models/bulk-update-team-members-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Bulk Update Team Members Response Hash`](../../doc/models/bulk-update-team-members-response.md).

## Example Usage

```ruby
body = {
  :team_members => {
    'AFMwA08kR-MIF-3Vs0OE' => {
      :team_member => {
        :reference_id => 'reference_id_2',
        :status => 'ACTIVE',
        :given_name => 'Jane',
        :family_name => 'Smith',
        :email_address => 'jane_smith@gmail.com',
        :phone_number => '+14159223334',
        :assigned_locations => {
          :assignment_type => 'ALL_CURRENT_AND_FUTURE_LOCATIONS'
        }
      }
    },
    'fpgteZNMaf0qOK-a4t6P' => {
      :team_member => {
        :reference_id => 'reference_id_1',
        :status => 'ACTIVE',
        :given_name => 'Joe',
        :family_name => 'Doe',
        :email_address => 'joe_doe@gmail.com',
        :phone_number => '+14159283333',
        :assigned_locations => {
          :assignment_type => 'EXPLICIT_LOCATIONS',
          :location_ids => [
            'YSGH2WBKG94QZ',
            'GA2Y9HSJ8KRYT'
          ]
        }
      }
    }
  }
}


result = team_api.bulk_update_team_members(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Jobs

Lists jobs in a seller account. Results are sorted by title in ascending order.

```ruby
def list_jobs(cursor: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | The pagination cursor returned by the previous call to this endpoint. Provide this<br>cursor to retrieve the next page of results for your original request. For more information,<br>see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`List Jobs Response Hash`](../../doc/models/list-jobs-response.md).

## Example Usage

```ruby
result = team_api.list_jobs

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Job

Creates a job in a seller account. A job defines a title and tip eligibility. Note that
compensation is defined in a [job assignment](../../doc/models/job-assignment.md) in a team member's wage setting.

```ruby
def create_job(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Job Request Hash`](../../doc/models/create-job-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Create Job Response Hash`](../../doc/models/create-job-response.md).

## Example Usage

```ruby
body = {
  :job => {
    :title => 'Cashier',
    :is_tip_eligible => true
  },
  :idempotency_key => 'idempotency-key-0'
}


result = team_api.create_job(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Job

Retrieves a specified job.

```ruby
def retrieve_job(job_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_id` | `String` | Template, Required | The ID of the job to retrieve. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Retrieve Job Response Hash`](../../doc/models/retrieve-job-response.md).

## Example Usage

```ruby
job_id = 'job_id2'


result = team_api.retrieve_job(job_id: job_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Job

Updates the title or tip eligibility of a job. Changes to the title propagate to all
`JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job ID. Changes to
tip eligibility propagate to all `TeamMemberWage` objects that reference the job ID.

```ruby
def update_job(job_id:,
               body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_id` | `String` | Template, Required | The ID of the job to update. |
| `body` | [`Update Job Request Hash`](../../doc/models/update-job-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Update Job Response Hash`](../../doc/models/update-job-response.md).

## Example Usage

```ruby
job_id = 'job_id2'

body = {
  :job => {
    :title => 'Cashier 1',
    :is_tip_eligible => true
  }
}


result = team_api.update_job(
  job_id: job_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Team Members

Returns a paginated list of `TeamMember` objects for a business.
The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether
the team member is the Square account owner.

```ruby
def search_team_members(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Team Members Request Hash`](../../doc/models/search-team-members-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Search Team Members Response Hash`](../../doc/models/search-team-members-response.md).

## Example Usage

```ruby
body = {
  :query => {
    :filter => {
      :location_ids => [
        '0G5P3VGACMMQZ'
      ],
      :status => 'ACTIVE'
    }
  },
  :limit => 10
}


result = team_api.search_team_members(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Team Member

Retrieves a `TeamMember` object for the given `TeamMember.id`.
Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).

```ruby
def retrieve_team_member(team_member_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `team_member_id` | `String` | Template, Required | The ID of the team member to retrieve. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Retrieve Team Member Response Hash`](../../doc/models/retrieve-team-member-response.md).

## Example Usage

```ruby
team_member_id = 'team_member_id0'


result = team_api.retrieve_team_member(team_member_id: team_member_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Team Member

Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates.
Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).

```ruby
def update_team_member(team_member_id:,
                       body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `team_member_id` | `String` | Template, Required | The ID of the team member to update. |
| `body` | [`Update Team Member Request Hash`](../../doc/models/update-team-member-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Update Team Member Response Hash`](../../doc/models/update-team-member-response.md).

## Example Usage

```ruby
team_member_id = 'team_member_id0'

body = {
  :team_member => {
    :reference_id => 'reference_id_1',
    :status => 'ACTIVE',
    :given_name => 'Joe',
    :family_name => 'Doe',
    :email_address => 'joe_doe@gmail.com',
    :phone_number => '+14159283333',
    :assigned_locations => {
      :assignment_type => 'EXPLICIT_LOCATIONS',
      :location_ids => [
        'YSGH2WBKG94QZ',
        'GA2Y9HSJ8KRYT'
      ]
    }
  }
}


result = team_api.update_team_member(
  team_member_id: team_member_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Wage Setting

Retrieves a `WageSetting` object for a team member specified
by `TeamMember.id`. For more information, see
[Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).

Square recommends using [RetrieveTeamMember](../../doc/api/team.md#retrieve-team-member) or [SearchTeamMembers](../../doc/api/team.md#search-team-members)
to get this information directly from the `TeamMember.wage_setting` field.

```ruby
def retrieve_wage_setting(team_member_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `team_member_id` | `String` | Template, Required | The ID of the team member for which to retrieve the wage setting. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Retrieve Wage Setting Response Hash`](../../doc/models/retrieve-wage-setting-response.md).

## Example Usage

```ruby
team_member_id = 'team_member_id0'


result = team_api.retrieve_wage_setting(team_member_id: team_member_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Wage Setting

Creates or updates a `WageSetting` object. The object is created if a
`WageSetting` with the specified `team_member_id` doesn't exist. Otherwise,
it fully replaces the `WageSetting` object for the team member.
The `WageSetting` is returned on a successful update. For more information, see
[Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).

Square recommends using [CreateTeamMember](../../doc/api/team.md#create-team-member) or [UpdateTeamMember](../../doc/api/team.md#update-team-member)
to manage the `TeamMember.wage_setting` field directly.

```ruby
def update_wage_setting(team_member_id:,
                        body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `team_member_id` | `String` | Template, Required | The ID of the team member for which to update the `WageSetting` object. |
| `body` | [`Update Wage Setting Request Hash`](../../doc/models/update-wage-setting-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

This method returns a `ApiResponse` instance. The `data` property in this instance returns the response data which is of type [`Update Wage Setting Response Hash`](../../doc/models/update-wage-setting-response.md).

## Example Usage

```ruby
team_member_id = 'team_member_id0'

body = {
  :wage_setting => {
    :job_assignments => [
      {
        :pay_type => 'SALARY',
        :job_title => 'Manager',
        :annual_rate => {
          :amount => 3000000,
          :currency => 'USD'
        },
        :weekly_hours => 40
      },
      {
        :pay_type => 'HOURLY',
        :job_title => 'Cashier',
        :hourly_rate => {
          :amount => 2000,
          :currency => 'USD'
        }
      }
    ],
    :is_overtime_exempt => true
  }
}


result = team_api.update_wage_setting(
  team_member_id: team_member_id,
  body: body
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

