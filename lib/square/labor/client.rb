# frozen_string_literal: true
require_relative "../../requests"
require_relative "break_types/client"
require_relative "employee_wages/client"
require_relative "shifts/client"
require_relative "team_member_wages/client"
require_relative "workweek_configs/client"
require_relative "../types/scheduled_shift"
require_relative "../types/create_scheduled_shift_response"
require_relative "../types/scheduled_shift_notification_audience"
require_relative "../types/bulk_publish_scheduled_shifts_response"
require_relative "../types/scheduled_shift_query"
require_relative "../types/search_scheduled_shifts_response"
require_relative "../types/retrieve_scheduled_shift_response"
require_relative "../types/update_scheduled_shift_response"
require_relative "../types/publish_scheduled_shift_response"
require_relative "../types/timecard"
require_relative "../types/create_timecard_response"
require_relative "../types/timecard_query"
require_relative "../types/search_timecards_response"
require_relative "../types/retrieve_timecard_response"
require_relative "../types/update_timecard_response"
require_relative "../types/delete_timecard_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class LaborClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Labor::BreakTypesClient] 
    attr_reader :break_types
  # @return [SquareApiClient::Labor::EmployeeWagesClient] 
    attr_reader :employee_wages
  # @return [SquareApiClient::Labor::ShiftsClient] 
    attr_reader :shifts
  # @return [SquareApiClient::Labor::TeamMemberWagesClient] 
    attr_reader :team_member_wages
  # @return [SquareApiClient::Labor::WorkweekConfigsClient] 
    attr_reader :workweek_configs


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::LaborClient]
    def initialize(request_client:)
      @request_client = request_client
      @break_types = SquareApiClient::Labor::BreakTypesClient.new(request_client: request_client)
      @employee_wages = SquareApiClient::Labor::EmployeeWagesClient.new(request_client: request_client)
      @shifts = SquareApiClient::Labor::ShiftsClient.new(request_client: request_client)
      @team_member_wages = SquareApiClient::Labor::TeamMemberWagesClient.new(request_client: request_client)
      @workweek_configs = SquareApiClient::Labor::WorkweekConfigsClient.new(request_client: request_client)
    end
# Creates a scheduled shift by providing draft shift details such as job ID,
#  team member assignment, and start and end times.
#  The following `draft_shift_details` fields are required:
#  - `location_id`
#  - `job_id`
#  - `start_at`
#  - `end_at`
    #
    # @param idempotency_key [String] A unique identifier for the `CreateScheduledShift` request, used to ensure the
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  of the operation.
    # @param scheduled_shift [Hash] The scheduled shift with `draft_shift_details`.
#  If needed, call [ListLocations](api-endpoint:Locations-ListLocations) to get
#  location IDs,
#  [ListJobs](api-endpoint:Team-ListJobs) to get job IDs, and
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
#  to get team member IDs and current job assignments.
#  The `start_at` and `end_at` timestamps must be provided in the time zone +
#  offset of the
#  shift location specified in `location_id`. Example for Pacific Standard Time:
#  2024-10-31T12:30:00-08:00Request of type SquareApiClient::ScheduledShift, as a Hash
    #   * :id (String) 
    #   * :draft_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :published_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.create_scheduled_shift(idempotency_key: "HIDSNG5KS478L", scheduled_shift: { draft_shift_details: { team_member_id: "ormj0jJJZ5OZIzxrZYJI", location_id: "PAA1RJZZKXBFG", job_id: "FzbJAtt9qEWncK1BWgVCxQ6M", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", notes: "Dont forget to prep the vegetables", is_deleted: false } })
    def create_scheduled_shift(idempotency_key: nil, scheduled_shift:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, scheduled_shift: scheduled_shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts"
end
      SquareApiClient::CreateScheduledShiftResponse.from_json(json_object: response.body)
    end
# Publishes 1 - 100 scheduled shifts. This endpoint takes a map of individual
#  publish
#  requests and returns a map of responses. When a scheduled shift is published,
#  Square keeps
#  the `draft_shift_details` field as is and copies it to the
#  `published_shift_details` field.
#  The minimum `start_at` and maximum `end_at` timestamps of all shifts in a
#  `BulkPublishScheduledShifts` request must fall within a two-week period.
    #
    # @param scheduled_shifts [Hash{String => SquareApiClient::BulkPublishScheduledShiftsData}] A map of 1 to 100 key-value pairs that represent individual publish requests.
#  - Each key is the ID of a scheduled shift you want to publish.
#  - Each value is a `BulkPublishScheduledShiftsData` object that contains the
#  `version` field or is an empty object.
    # @param scheduled_shift_notification_audience [SquareApiClient::ScheduledShiftNotificationAudience] Indicates whether Square should send email notifications to team members and
#  which team members should receive the notifications. This setting applies to all
#  shifts
#  specified in the bulk operation. The default value is `AFFECTED`.
#  See
#  [ScheduledShiftNotificationAudience](#type-scheduledshiftnotificationaudience)
#  for possible values
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkPublishScheduledShiftsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.bulk_publish_scheduled_shifts(scheduled_shifts: { "key": {  } }, scheduled_shift_notification_audience: AFFECTED)
    def bulk_publish_scheduled_shifts(scheduled_shifts:, scheduled_shift_notification_audience: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), scheduled_shifts: scheduled_shifts, scheduled_shift_notification_audience: scheduled_shift_notification_audience }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/bulk-publish"
end
      SquareApiClient::BulkPublishScheduledShiftsResponse.from_json(json_object: response.body)
    end
# Returns a paginated list of scheduled shifts, with optional filter and sort
#  settings.
#  By default, results are sorted by `start_at` in ascending order.
    #
    # @param query [Hash] Query conditions used to filter and sort the results.Request of type SquareApiClient::ScheduledShiftQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :start (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :end_ (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :workday (Hash)
    #       * :date_range (Hash)
    #         * :start_date (String) 
    #         * :end_date (String) 
    #       * :match_scheduled_shifts_by (SquareApiClient::ScheduledShiftWorkdayMatcher) 
    #       * :default_timezone (String) 
    #     * :team_member_ids (Array<String>) 
    #     * :assignment_status (SquareApiClient::ScheduledShiftFilterAssignmentStatus) 
    #     * :scheduled_shift_statuses (Array<SquareApiClient::ScheduledShiftFilterScheduledShiftStatus>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::ScheduledShiftSortField) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param limit [Integer] The maximum number of results to return in a single response page. The default
#  value is 50.
    # @param cursor [String] The pagination cursor returned by the previous call to this endpoint. Provide
#  this cursor to retrieve the next page of results for your original request. For
#  more
#  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchScheduledShiftsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.search_scheduled_shifts(
#    query: { filter: { assignment_status: ASSIGNED }, sort: { field: CREATED_AT, order: ASC } },
#    limit: 2,
#    cursor: "xoxp-1234-5678-90123"
#  )
    def search_scheduled_shifts(query: nil, limit: nil, cursor: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/search"
end
      SquareApiClient::SearchScheduledShiftsResponse.from_json(json_object: response.body)
    end
# Retrieves a scheduled shift by ID.
    #
    # @param id [String] The ID of the scheduled shift to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RetrieveScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.retrieve_scheduled_shift(id: "id")
    def retrieve_scheduled_shift(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/#{id}"
end
      SquareApiClient::RetrieveScheduledShiftResponse.from_json(json_object: response.body)
    end
# Updates the draft shift details for a scheduled shift. This endpoint supports
#  sparse updates, so only new, changed, or removed fields are required in the
#  request.
#  You must publish the shift to make updates public.
#  You can make the following updates to `draft_shift_details`:
#  - Change the `location_id`, `job_id`, `start_at`, and `end_at` fields.
#  - Add, change, or clear the `team_member_id` and `notes` fields. To clear these
#  fields,
#  set the value to null.
#  - Change the `is_deleted` field. To delete a scheduled shift, set `is_deleted`
#  to true
#  and then publish the shift.
    #
    # @param id [String] The ID of the scheduled shift to update.
    # @param scheduled_shift [Hash] The scheduled shift with any updates in the `draft_shift_details` field.
#  If needed, call [ListLocations](api-endpoint:Locations-ListLocations) to get
#  location IDs,
#  [ListJobs](api-endpoint:Team-ListJobs) to get job IDs, and
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
#  to get team member IDs and current job assignments. Updates made to
#  `published_shift_details`
#  are ignored.
#  If provided, the `start_at` and `end_at` timestamps must be in the time zone +
#  offset of the
#  shift location specified in `location_id`. Example for Pacific Standard Time:
#  2024-10-31T12:30:00-08:00
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for the request, provide the current version of the shift in the
#  `version` field.
#  If the provided version doesn't match the server version, the request fails. If
#  `version` is
#  omitted, Square executes a blind write, potentially overwriting data from
#  another publish request.Request of type SquareApiClient::ScheduledShift, as a Hash
    #   * :id (String) 
    #   * :draft_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :published_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.update_scheduled_shift(id: "id", scheduled_shift: { draft_shift_details: { team_member_id: "ormj0jJJZ5OZIzxrZYJI", location_id: "PAA1RJZZKXBFG", job_id: "FzbJAtt9qEWncK1BWgVCxQ6M", start_at: "2019-03-25T03:11:00-05:00", end_at: "2019-03-25T13:18:00-05:00", notes: "Dont forget to prep the vegetables", is_deleted: false }, version: 1 })
    def update_scheduled_shift(id:, scheduled_shift:, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), scheduled_shift: scheduled_shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/#{id}"
end
      SquareApiClient::UpdateScheduledShiftResponse.from_json(json_object: response.body)
    end
# Publishes a scheduled shift. When a scheduled shift is published, Square keeps
#  the
#  `draft_shift_details` field as is and copies it to the `published_shift_details`
#  field.
    #
    # @param id [String] The ID of the scheduled shift to publish.
    # @param idempotency_key [String] A unique identifier for the `PublishScheduledShift` request, used to ensure the
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  of the operation.
    # @param version [Integer] The current version of the scheduled shift, used to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control. If the provided version doesn't match the server version, the request
#  fails.
#  If omitted, Square executes a blind write, potentially overwriting data from
#  another publish request.
    # @param scheduled_shift_notification_audience [SquareApiClient::ScheduledShiftNotificationAudience] Indicates whether Square should send an email notification to team members and
#  which team members should receive the notification. The default value is
#  `AFFECTED`.
#  See
#  [ScheduledShiftNotificationAudience](#type-scheduledshiftnotificationaudience)
#  for possible values
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::PublishScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.publish_scheduled_shift(
#    id: "id",
#    idempotency_key: "HIDSNG5KS478L",
#    version: 2,
#    scheduled_shift_notification_audience: ALL
#  )
    def publish_scheduled_shift(id:, idempotency_key:, version: nil, scheduled_shift_notification_audience: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, version: version, scheduled_shift_notification_audience: scheduled_shift_notification_audience }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/#{id}/publish"
end
      SquareApiClient::PublishScheduledShiftResponse.from_json(json_object: response.body)
    end
# Creates a new `Timecard`.
#  A `Timecard` represents a complete workday for a single team member.
#  You must provide the following values in your request to this
#  endpoint:
#  - `location_id`
#  - `team_member_id`
#  - `start_at`
#  An attempt to create a new `Timecard` can result in a `BAD_REQUEST` error when:
#  - The `status` of the new `Timecard` is `OPEN` and the team member has another
#  timecard with an `OPEN` status.
#  - The `start_at` date is in the future.
#  - The `start_at` or `end_at` date overlaps another timecard for the same team
#  member.
#  - The `Break` instances are set in the request and a break `start_at`
#  is before the `Timecard.start_at`, a break `end_at` is after
#  the `Timecard.end_at`, or both.
    #
    # @param idempotency_key [String] A unique string value to ensure the idempotency of the operation.
    # @param timecard [Hash] The `Timecard` to be created.Request of type SquareApiClient::Timecard, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :timezone (String) 
    #   * :start_at (String) 
    #   * :end_at (String) 
    #   * :wage (Hash)
    #     * :title (String) 
    #     * :hourly_rate (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :job_id (String) 
    #     * :tip_eligible (Boolean) 
    #   * :breaks (Array<SquareApiClient::Break>) 
    #   * :status (SquareApiClient::TimecardStatus) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :team_member_id (String) 
    #   * :declared_cash_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.create_timecard(idempotency_key: "HIDSNG5KS478L", timecard: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Barista", hourly_rate: { amount: 1100, currency: USD }, tip_eligible: true }, breaks: [{ start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
    def create_timecard(idempotency_key: nil, timecard:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, timecard: timecard }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards"
end
      SquareApiClient::CreateTimecardResponse.from_json(json_object: response.body)
    end
# Returns a paginated list of `Timecard` records for a business.
#  The list to be returned can be filtered by:
#  - Location IDs
#  - Team member IDs
#  - Timecard status (`OPEN` or `CLOSED`)
#  - Timecard start
#  - Timecard end
#  - Workday details
#  The list can be sorted by:
#  - `START_AT`
#  - `END_AT`
#  - `CREATED_AT`
#  - `UPDATED_AT`
    #
    # @param query [Hash] Query filters.Request of type SquareApiClient::TimecardQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :status (SquareApiClient::TimecardFilterStatus) 
    #     * :start (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :end_ (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :workday (Hash)
    #       * :date_range (Hash)
    #         * :start_date (String) 
    #         * :end_date (String) 
    #       * :match_timecards_by (SquareApiClient::TimecardWorkdayMatcher) 
    #       * :default_timezone (String) 
    #     * :team_member_ids (Array<String>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::TimecardSortField) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param limit [Integer] The number of resources in a page (200 by default).
    # @param cursor [String] An opaque cursor for fetching the next page.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchTimecardsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.search_timecards(query: { filter: { workday: { date_range: { start_date: "2019-01-20", end_date: "2019-02-03" }, match_timecards_by: START_AT, default_timezone: "America/Los_Angeles" } } }, limit: 100)
    def search_timecards(query: nil, limit: nil, cursor: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/search"
end
      SquareApiClient::SearchTimecardsResponse.from_json(json_object: response.body)
    end
# Returns a single `Timecard` specified by `id`.
    #
    # @param id [String] The UUID for the `Timecard` being retrieved.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RetrieveTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.retrieve_timecard(id: "id")
    def retrieve_timecard(id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/#{id}"
end
      SquareApiClient::RetrieveTimecardResponse.from_json(json_object: response.body)
    end
# Updates an existing `Timecard`.
#  When adding a `Break` to a `Timecard`, any earlier `Break` instances in the
#  `Timecard` have
#  the `end_at` property set to a valid RFC-3339 datetime string.
#  When closing a `Timecard`, all `Break` instances in the `Timecard` must be
#  complete with `end_at`
#  set on each `Break`.
    #
    # @param id [String] The ID of the object being updated.
    # @param timecard [Hash] The updated `Timecard` object.Request of type SquareApiClient::Timecard, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :timezone (String) 
    #   * :start_at (String) 
    #   * :end_at (String) 
    #   * :wage (Hash)
    #     * :title (String) 
    #     * :hourly_rate (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :job_id (String) 
    #     * :tip_eligible (Boolean) 
    #   * :breaks (Array<SquareApiClient::Break>) 
    #   * :status (SquareApiClient::TimecardStatus) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :team_member_id (String) 
    #   * :declared_cash_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.update_timecard(id: "id", timecard: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Bartender", hourly_rate: { amount: 1500, currency: USD }, tip_eligible: true }, breaks: [{ id: "X7GAQYVVRRG6P", start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], status: CLOSED, version: 1, team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
    def update_timecard(id:, timecard:, request_options: nil)
      response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), timecard: timecard }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/#{id}"
end
      SquareApiClient::UpdateTimecardResponse.from_json(json_object: response.body)
    end
# Deletes a `Timecard`.
    #
    # @param id [String] The UUID for the `Timecard` being deleted.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.delete_timecard(id: "id")
    def delete_timecard(id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/#{id}"
end
      SquareApiClient::DeleteTimecardResponse.from_json(json_object: response.body)
    end
  end
  class AsyncLaborClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::Labor::BreakTypesClient] 
    attr_reader :break_types
  # @return [SquareApiClient::Labor::EmployeeWagesClient] 
    attr_reader :employee_wages
  # @return [SquareApiClient::Labor::ShiftsClient] 
    attr_reader :shifts
  # @return [SquareApiClient::Labor::TeamMemberWagesClient] 
    attr_reader :team_member_wages
  # @return [SquareApiClient::Labor::WorkweekConfigsClient] 
    attr_reader :workweek_configs


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncLaborClient]
    def initialize(request_client:)
      @request_client = request_client
      @break_types = SquareApiClient::Labor::AsyncBreakTypesClient.new(request_client: request_client)
      @employee_wages = SquareApiClient::Labor::AsyncEmployeeWagesClient.new(request_client: request_client)
      @shifts = SquareApiClient::Labor::AsyncShiftsClient.new(request_client: request_client)
      @team_member_wages = SquareApiClient::Labor::AsyncTeamMemberWagesClient.new(request_client: request_client)
      @workweek_configs = SquareApiClient::Labor::AsyncWorkweekConfigsClient.new(request_client: request_client)
    end
# Creates a scheduled shift by providing draft shift details such as job ID,
#  team member assignment, and start and end times.
#  The following `draft_shift_details` fields are required:
#  - `location_id`
#  - `job_id`
#  - `start_at`
#  - `end_at`
    #
    # @param idempotency_key [String] A unique identifier for the `CreateScheduledShift` request, used to ensure the
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  of the operation.
    # @param scheduled_shift [Hash] The scheduled shift with `draft_shift_details`.
#  If needed, call [ListLocations](api-endpoint:Locations-ListLocations) to get
#  location IDs,
#  [ListJobs](api-endpoint:Team-ListJobs) to get job IDs, and
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
#  to get team member IDs and current job assignments.
#  The `start_at` and `end_at` timestamps must be provided in the time zone +
#  offset of the
#  shift location specified in `location_id`. Example for Pacific Standard Time:
#  2024-10-31T12:30:00-08:00Request of type SquareApiClient::ScheduledShift, as a Hash
    #   * :id (String) 
    #   * :draft_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :published_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.create_scheduled_shift(idempotency_key: "HIDSNG5KS478L", scheduled_shift: { draft_shift_details: { team_member_id: "ormj0jJJZ5OZIzxrZYJI", location_id: "PAA1RJZZKXBFG", job_id: "FzbJAtt9qEWncK1BWgVCxQ6M", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", notes: "Dont forget to prep the vegetables", is_deleted: false } })
    def create_scheduled_shift(idempotency_key: nil, scheduled_shift:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, scheduled_shift: scheduled_shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts"
end
        SquareApiClient::CreateScheduledShiftResponse.from_json(json_object: response.body)
      end
    end
# Publishes 1 - 100 scheduled shifts. This endpoint takes a map of individual
#  publish
#  requests and returns a map of responses. When a scheduled shift is published,
#  Square keeps
#  the `draft_shift_details` field as is and copies it to the
#  `published_shift_details` field.
#  The minimum `start_at` and maximum `end_at` timestamps of all shifts in a
#  `BulkPublishScheduledShifts` request must fall within a two-week period.
    #
    # @param scheduled_shifts [Hash{String => SquareApiClient::BulkPublishScheduledShiftsData}] A map of 1 to 100 key-value pairs that represent individual publish requests.
#  - Each key is the ID of a scheduled shift you want to publish.
#  - Each value is a `BulkPublishScheduledShiftsData` object that contains the
#  `version` field or is an empty object.
    # @param scheduled_shift_notification_audience [SquareApiClient::ScheduledShiftNotificationAudience] Indicates whether Square should send email notifications to team members and
#  which team members should receive the notifications. This setting applies to all
#  shifts
#  specified in the bulk operation. The default value is `AFFECTED`.
#  See
#  [ScheduledShiftNotificationAudience](#type-scheduledshiftnotificationaudience)
#  for possible values
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BulkPublishScheduledShiftsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.bulk_publish_scheduled_shifts(scheduled_shifts: { "key": {  } }, scheduled_shift_notification_audience: AFFECTED)
    def bulk_publish_scheduled_shifts(scheduled_shifts:, scheduled_shift_notification_audience: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), scheduled_shifts: scheduled_shifts, scheduled_shift_notification_audience: scheduled_shift_notification_audience }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/bulk-publish"
end
        SquareApiClient::BulkPublishScheduledShiftsResponse.from_json(json_object: response.body)
      end
    end
# Returns a paginated list of scheduled shifts, with optional filter and sort
#  settings.
#  By default, results are sorted by `start_at` in ascending order.
    #
    # @param query [Hash] Query conditions used to filter and sort the results.Request of type SquareApiClient::ScheduledShiftQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :start (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :end_ (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :workday (Hash)
    #       * :date_range (Hash)
    #         * :start_date (String) 
    #         * :end_date (String) 
    #       * :match_scheduled_shifts_by (SquareApiClient::ScheduledShiftWorkdayMatcher) 
    #       * :default_timezone (String) 
    #     * :team_member_ids (Array<String>) 
    #     * :assignment_status (SquareApiClient::ScheduledShiftFilterAssignmentStatus) 
    #     * :scheduled_shift_statuses (Array<SquareApiClient::ScheduledShiftFilterScheduledShiftStatus>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::ScheduledShiftSortField) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param limit [Integer] The maximum number of results to return in a single response page. The default
#  value is 50.
    # @param cursor [String] The pagination cursor returned by the previous call to this endpoint. Provide
#  this cursor to retrieve the next page of results for your original request. For
#  more
#  information, see
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchScheduledShiftsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.search_scheduled_shifts(
#    query: { filter: { assignment_status: ASSIGNED }, sort: { field: CREATED_AT, order: ASC } },
#    limit: 2,
#    cursor: "xoxp-1234-5678-90123"
#  )
    def search_scheduled_shifts(query: nil, limit: nil, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/search"
end
        SquareApiClient::SearchScheduledShiftsResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a scheduled shift by ID.
    #
    # @param id [String] The ID of the scheduled shift to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RetrieveScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.retrieve_scheduled_shift(id: "id")
    def retrieve_scheduled_shift(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/#{id}"
end
        SquareApiClient::RetrieveScheduledShiftResponse.from_json(json_object: response.body)
      end
    end
# Updates the draft shift details for a scheduled shift. This endpoint supports
#  sparse updates, so only new, changed, or removed fields are required in the
#  request.
#  You must publish the shift to make updates public.
#  You can make the following updates to `draft_shift_details`:
#  - Change the `location_id`, `job_id`, `start_at`, and `end_at` fields.
#  - Add, change, or clear the `team_member_id` and `notes` fields. To clear these
#  fields,
#  set the value to null.
#  - Change the `is_deleted` field. To delete a scheduled shift, set `is_deleted`
#  to true
#  and then publish the shift.
    #
    # @param id [String] The ID of the scheduled shift to update.
    # @param scheduled_shift [Hash] The scheduled shift with any updates in the `draft_shift_details` field.
#  If needed, call [ListLocations](api-endpoint:Locations-ListLocations) to get
#  location IDs,
#  [ListJobs](api-endpoint:Team-ListJobs) to get job IDs, and
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
#  to get team member IDs and current job assignments. Updates made to
#  `published_shift_details`
#  are ignored.
#  If provided, the `start_at` and `end_at` timestamps must be in the time zone +
#  offset of the
#  shift location specified in `location_id`. Example for Pacific Standard Time:
#  2024-10-31T12:30:00-08:00
#  To enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control for the request, provide the current version of the shift in the
#  `version` field.
#  If the provided version doesn't match the server version, the request fails. If
#  `version` is
#  omitted, Square executes a blind write, potentially overwriting data from
#  another publish request.Request of type SquareApiClient::ScheduledShift, as a Hash
    #   * :id (String) 
    #   * :draft_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :published_shift_details (Hash)
    #     * :team_member_id (String) 
    #     * :location_id (String) 
    #     * :job_id (String) 
    #     * :start_at (String) 
    #     * :end_at (String) 
    #     * :notes (String) 
    #     * :is_deleted (Boolean) 
    #     * :timezone (String) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.update_scheduled_shift(id: "id", scheduled_shift: { draft_shift_details: { team_member_id: "ormj0jJJZ5OZIzxrZYJI", location_id: "PAA1RJZZKXBFG", job_id: "FzbJAtt9qEWncK1BWgVCxQ6M", start_at: "2019-03-25T03:11:00-05:00", end_at: "2019-03-25T13:18:00-05:00", notes: "Dont forget to prep the vegetables", is_deleted: false }, version: 1 })
    def update_scheduled_shift(id:, scheduled_shift:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), scheduled_shift: scheduled_shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/#{id}"
end
        SquareApiClient::UpdateScheduledShiftResponse.from_json(json_object: response.body)
      end
    end
# Publishes a scheduled shift. When a scheduled shift is published, Square keeps
#  the
#  `draft_shift_details` field as is and copies it to the `published_shift_details`
#  field.
    #
    # @param id [String] The ID of the scheduled shift to publish.
    # @param idempotency_key [String] A unique identifier for the `PublishScheduledShift` request, used to ensure the
#  ttps://developer.squareup.com/docs/build-basics/common-api-patterns/idempotency)
#  of the operation.
    # @param version [Integer] The current version of the scheduled shift, used to enable [optimistic
#  loper.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency)
#  control. If the provided version doesn't match the server version, the request
#  fails.
#  If omitted, Square executes a blind write, potentially overwriting data from
#  another publish request.
    # @param scheduled_shift_notification_audience [SquareApiClient::ScheduledShiftNotificationAudience] Indicates whether Square should send an email notification to team members and
#  which team members should receive the notification. The default value is
#  `AFFECTED`.
#  See
#  [ScheduledShiftNotificationAudience](#type-scheduledshiftnotificationaudience)
#  for possible values
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::PublishScheduledShiftResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.publish_scheduled_shift(
#    id: "id",
#    idempotency_key: "HIDSNG5KS478L",
#    version: 2,
#    scheduled_shift_notification_audience: ALL
#  )
    def publish_scheduled_shift(id:, idempotency_key:, version: nil, scheduled_shift_notification_audience: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, version: version, scheduled_shift_notification_audience: scheduled_shift_notification_audience }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/scheduled-shifts/#{id}/publish"
end
        SquareApiClient::PublishScheduledShiftResponse.from_json(json_object: response.body)
      end
    end
# Creates a new `Timecard`.
#  A `Timecard` represents a complete workday for a single team member.
#  You must provide the following values in your request to this
#  endpoint:
#  - `location_id`
#  - `team_member_id`
#  - `start_at`
#  An attempt to create a new `Timecard` can result in a `BAD_REQUEST` error when:
#  - The `status` of the new `Timecard` is `OPEN` and the team member has another
#  timecard with an `OPEN` status.
#  - The `start_at` date is in the future.
#  - The `start_at` or `end_at` date overlaps another timecard for the same team
#  member.
#  - The `Break` instances are set in the request and a break `start_at`
#  is before the `Timecard.start_at`, a break `end_at` is after
#  the `Timecard.end_at`, or both.
    #
    # @param idempotency_key [String] A unique string value to ensure the idempotency of the operation.
    # @param timecard [Hash] The `Timecard` to be created.Request of type SquareApiClient::Timecard, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :timezone (String) 
    #   * :start_at (String) 
    #   * :end_at (String) 
    #   * :wage (Hash)
    #     * :title (String) 
    #     * :hourly_rate (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :job_id (String) 
    #     * :tip_eligible (Boolean) 
    #   * :breaks (Array<SquareApiClient::Break>) 
    #   * :status (SquareApiClient::TimecardStatus) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :team_member_id (String) 
    #   * :declared_cash_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.create_timecard(idempotency_key: "HIDSNG5KS478L", timecard: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Barista", hourly_rate: { amount: 1100, currency: USD }, tip_eligible: true }, breaks: [{ start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
    def create_timecard(idempotency_key: nil, timecard:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, timecard: timecard }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards"
end
        SquareApiClient::CreateTimecardResponse.from_json(json_object: response.body)
      end
    end
# Returns a paginated list of `Timecard` records for a business.
#  The list to be returned can be filtered by:
#  - Location IDs
#  - Team member IDs
#  - Timecard status (`OPEN` or `CLOSED`)
#  - Timecard start
#  - Timecard end
#  - Workday details
#  The list can be sorted by:
#  - `START_AT`
#  - `END_AT`
#  - `CREATED_AT`
#  - `UPDATED_AT`
    #
    # @param query [Hash] Query filters.Request of type SquareApiClient::TimecardQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :status (SquareApiClient::TimecardFilterStatus) 
    #     * :start (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :end_ (Hash)
    #       * :start_at (String) 
    #       * :end_at (String) 
    #     * :workday (Hash)
    #       * :date_range (Hash)
    #         * :start_date (String) 
    #         * :end_date (String) 
    #       * :match_timecards_by (SquareApiClient::TimecardWorkdayMatcher) 
    #       * :default_timezone (String) 
    #     * :team_member_ids (Array<String>) 
    #   * :sort (Hash)
    #     * :field (SquareApiClient::TimecardSortField) 
    #     * :order (SquareApiClient::SortOrder) 
    # @param limit [Integer] The number of resources in a page (200 by default).
    # @param cursor [String] An opaque cursor for fetching the next page.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchTimecardsResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.search_timecards(query: { filter: { workday: { date_range: { start_date: "2019-01-20", end_date: "2019-02-03" }, match_timecards_by: START_AT, default_timezone: "America/Los_Angeles" } } }, limit: 100)
    def search_timecards(query: nil, limit: nil, cursor: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), query: query, limit: limit, cursor: cursor }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/search"
end
        SquareApiClient::SearchTimecardsResponse.from_json(json_object: response.body)
      end
    end
# Returns a single `Timecard` specified by `id`.
    #
    # @param id [String] The UUID for the `Timecard` being retrieved.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::RetrieveTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.retrieve_timecard(id: "id")
    def retrieve_timecard(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/#{id}"
end
        SquareApiClient::RetrieveTimecardResponse.from_json(json_object: response.body)
      end
    end
# Updates an existing `Timecard`.
#  When adding a `Break` to a `Timecard`, any earlier `Break` instances in the
#  `Timecard` have
#  the `end_at` property set to a valid RFC-3339 datetime string.
#  When closing a `Timecard`, all `Break` instances in the `Timecard` must be
#  complete with `end_at`
#  set on each `Break`.
    #
    # @param id [String] The ID of the object being updated.
    # @param timecard [Hash] The updated `Timecard` object.Request of type SquareApiClient::Timecard, as a Hash
    #   * :id (String) 
    #   * :location_id (String) 
    #   * :timezone (String) 
    #   * :start_at (String) 
    #   * :end_at (String) 
    #   * :wage (Hash)
    #     * :title (String) 
    #     * :hourly_rate (Hash)
    #       * :amount (Long) 
    #       * :currency (SquareApiClient::Currency) 
    #     * :job_id (String) 
    #     * :tip_eligible (Boolean) 
    #   * :breaks (Array<SquareApiClient::Break>) 
    #   * :status (SquareApiClient::TimecardStatus) 
    #   * :version (Integer) 
    #   * :created_at (String) 
    #   * :updated_at (String) 
    #   * :team_member_id (String) 
    #   * :declared_cash_tip_money (Hash)
    #     * :amount (Long) 
    #     * :currency (SquareApiClient::Currency) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.update_timecard(id: "id", timecard: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Bartender", hourly_rate: { amount: 1500, currency: USD }, tip_eligible: true }, breaks: [{ id: "X7GAQYVVRRG6P", start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], status: CLOSED, version: 1, team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
    def update_timecard(id:, timecard:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), timecard: timecard }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/#{id}"
end
        SquareApiClient::UpdateTimecardResponse.from_json(json_object: response.body)
      end
    end
# Deletes a `Timecard`.
    #
    # @param id [String] The UUID for the `Timecard` being deleted.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::DeleteTimecardResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.delete_timecard(id: "id")
    def delete_timecard(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/timecards/#{id}"
end
        SquareApiClient::DeleteTimecardResponse.from_json(json_object: response.body)
      end
    end
  end
end