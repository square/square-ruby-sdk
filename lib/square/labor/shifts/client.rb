# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/shift"
require_relative "../../types/create_shift_response"
require_relative "../../types/shift_query"
require_relative "../../types/search_shifts_response"
require_relative "../../types/get_shift_response"
require_relative "../../types/update_shift_response"
require_relative "../../types/delete_shift_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Labor
    class ShiftsClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Labor::ShiftsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a new `Shift`.
#  A `Shift` represents a complete workday for a single team member.
#  You must provide the following values in your request to this
#  endpoint:
#  - `location_id`
#  - `team_member_id`
#  - `start_at`
#  An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when:
#  - The `status` of the new `Shift` is `OPEN` and the team member has another
#  shift with an `OPEN` status.
#  - The `start_at` date is in the future.
#  - The `start_at` or `end_at` date overlaps another shift for the same team
#  member.
#  - The `Break` instances are set in the request and a break `start_at`
#  is before the `Shift.start_at`, a break `end_at` is after
#  the `Shift.end_at`, or both.
      #
      # @param idempotency_key [String] A unique string value to ensure the idempotency of the operation.
      # @param shift [Hash] The `Shift` to be created.Request of type square.rb::Shift, as a Hash
      #   * :id (String) 
      #   * :employee_id (String) 
      #   * :location_id (String) 
      #   * :timezone (String) 
      #   * :start_at (String) 
      #   * :end_at (String) 
      #   * :wage (Hash)
      #     * :title (String) 
      #     * :hourly_rate (Hash)
      #       * :amount (Long) 
      #       * :currency (square.rb::Currency) 
      #     * :job_id (String) 
      #     * :tip_eligible (Boolean) 
      #   * :breaks (Array<square.rb::Break>) 
      #   * :status (square.rb::ShiftStatus) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :team_member_id (String) 
      #   * :declared_cash_tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.create(idempotency_key: "HIDSNG5KS478L", shift: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Barista", hourly_rate: { amount: 1100, currency: USD }, tip_eligible: true }, breaks: [{ start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
      def create(idempotency_key: nil, shift:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, shift: shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts"
end
        square.rb::CreateShiftResponse.from_json(json_object: response.body)
      end
# Returns a paginated list of `Shift` records for a business.
#  The list to be returned can be filtered by:
#  - Location IDs
#  - Team member IDs
#  - Shift status (`OPEN` or `CLOSED`)
#  - Shift start
#  - Shift end
#  - Workday details
#  The list can be sorted by:
#  - `START_AT`
#  - `END_AT`
#  - `CREATED_AT`
#  - `UPDATED_AT`
      #
      # @param query [Hash] Query filters.Request of type square.rb::ShiftQuery, as a Hash
      #   * :filter (Hash)
      #     * :location_ids (Array<String>) 
      #     * :employee_ids (Array<String>) 
      #     * :status (square.rb::ShiftFilterStatus) 
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
      #       * :match_shifts_by (square.rb::ShiftWorkdayMatcher) 
      #       * :default_timezone (String) 
      #     * :team_member_ids (Array<String>) 
      #   * :sort (Hash)
      #     * :field (square.rb::ShiftSortField) 
      #     * :order (square.rb::SortOrder) 
      # @param limit [Integer] The number of resources in a page (200 by default).
      # @param cursor [String] An opaque cursor for fetching the next page.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::SearchShiftsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.search(query: { filter: { workday: { date_range: { start_date: "2019-01-20", end_date: "2019-02-03" }, match_shifts_by: START_AT, default_timezone: "America/Los_Angeles" } } }, limit: 100)
      def search(query: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/search"
end
        square.rb::SearchShiftsResponse.from_json(json_object: response.body)
      end
# Returns a single `Shift` specified by `id`.
      #
      # @param id [String] The UUID for the `Shift` being retrieved.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.get(id: "id")
      def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/#{id}"
end
        square.rb::GetShiftResponse.from_json(json_object: response.body)
      end
# Updates an existing `Shift`.
#  When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift`
#  have
#  the `end_at` property set to a valid RFC-3339 datetime string.
#  When closing a `Shift`, all `Break` instances in the `Shift` must be complete
#  with `end_at`
#  set on each `Break`.
      #
      # @param id [String] The ID of the object being updated.
      # @param shift [Hash] The updated `Shift` object.Request of type square.rb::Shift, as a Hash
      #   * :id (String) 
      #   * :employee_id (String) 
      #   * :location_id (String) 
      #   * :timezone (String) 
      #   * :start_at (String) 
      #   * :end_at (String) 
      #   * :wage (Hash)
      #     * :title (String) 
      #     * :hourly_rate (Hash)
      #       * :amount (Long) 
      #       * :currency (square.rb::Currency) 
      #     * :job_id (String) 
      #     * :tip_eligible (Boolean) 
      #   * :breaks (Array<square.rb::Break>) 
      #   * :status (square.rb::ShiftStatus) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :team_member_id (String) 
      #   * :declared_cash_tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.update(id: "id", shift: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Bartender", hourly_rate: { amount: 1500, currency: USD }, tip_eligible: true }, breaks: [{ id: "X7GAQYVVRRG6P", start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], version: 1, team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
      def update(id:, shift:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), shift: shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/#{id}"
end
        square.rb::UpdateShiftResponse.from_json(json_object: response.body)
      end
# Deletes a `Shift`.
      #
      # @param id [String] The UUID for the `Shift` being deleted.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.delete(id: "id")
      def delete(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/#{id}"
end
        square.rb::DeleteShiftResponse.from_json(json_object: response.body)
      end
    end
    class AsyncShiftsClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Labor::AsyncShiftsClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Creates a new `Shift`.
#  A `Shift` represents a complete workday for a single team member.
#  You must provide the following values in your request to this
#  endpoint:
#  - `location_id`
#  - `team_member_id`
#  - `start_at`
#  An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when:
#  - The `status` of the new `Shift` is `OPEN` and the team member has another
#  shift with an `OPEN` status.
#  - The `start_at` date is in the future.
#  - The `start_at` or `end_at` date overlaps another shift for the same team
#  member.
#  - The `Break` instances are set in the request and a break `start_at`
#  is before the `Shift.start_at`, a break `end_at` is after
#  the `Shift.end_at`, or both.
      #
      # @param idempotency_key [String] A unique string value to ensure the idempotency of the operation.
      # @param shift [Hash] The `Shift` to be created.Request of type square.rb::Shift, as a Hash
      #   * :id (String) 
      #   * :employee_id (String) 
      #   * :location_id (String) 
      #   * :timezone (String) 
      #   * :start_at (String) 
      #   * :end_at (String) 
      #   * :wage (Hash)
      #     * :title (String) 
      #     * :hourly_rate (Hash)
      #       * :amount (Long) 
      #       * :currency (square.rb::Currency) 
      #     * :job_id (String) 
      #     * :tip_eligible (Boolean) 
      #   * :breaks (Array<square.rb::Break>) 
      #   * :status (square.rb::ShiftStatus) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :team_member_id (String) 
      #   * :declared_cash_tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.create(idempotency_key: "HIDSNG5KS478L", shift: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Barista", hourly_rate: { amount: 1100, currency: USD }, tip_eligible: true }, breaks: [{ start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
      def create(idempotency_key: nil, shift:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), idempotency_key: idempotency_key, shift: shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts"
end
          square.rb::CreateShiftResponse.from_json(json_object: response.body)
        end
      end
# Returns a paginated list of `Shift` records for a business.
#  The list to be returned can be filtered by:
#  - Location IDs
#  - Team member IDs
#  - Shift status (`OPEN` or `CLOSED`)
#  - Shift start
#  - Shift end
#  - Workday details
#  The list can be sorted by:
#  - `START_AT`
#  - `END_AT`
#  - `CREATED_AT`
#  - `UPDATED_AT`
      #
      # @param query [Hash] Query filters.Request of type square.rb::ShiftQuery, as a Hash
      #   * :filter (Hash)
      #     * :location_ids (Array<String>) 
      #     * :employee_ids (Array<String>) 
      #     * :status (square.rb::ShiftFilterStatus) 
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
      #       * :match_shifts_by (square.rb::ShiftWorkdayMatcher) 
      #       * :default_timezone (String) 
      #     * :team_member_ids (Array<String>) 
      #   * :sort (Hash)
      #     * :field (square.rb::ShiftSortField) 
      #     * :order (square.rb::SortOrder) 
      # @param limit [Integer] The number of resources in a page (200 by default).
      # @param cursor [String] An opaque cursor for fetching the next page.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::SearchShiftsResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.search(query: { filter: { workday: { date_range: { start_date: "2019-01-20", end_date: "2019-02-03" }, match_shifts_by: START_AT, default_timezone: "America/Los_Angeles" } } }, limit: 100)
      def search(query: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/search"
end
          square.rb::SearchShiftsResponse.from_json(json_object: response.body)
        end
      end
# Returns a single `Shift` specified by `id`.
      #
      # @param id [String] The UUID for the `Shift` being retrieved.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.get(id: "id")
      def get(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/#{id}"
end
          square.rb::GetShiftResponse.from_json(json_object: response.body)
        end
      end
# Updates an existing `Shift`.
#  When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift`
#  have
#  the `end_at` property set to a valid RFC-3339 datetime string.
#  When closing a `Shift`, all `Break` instances in the `Shift` must be complete
#  with `end_at`
#  set on each `Break`.
      #
      # @param id [String] The ID of the object being updated.
      # @param shift [Hash] The updated `Shift` object.Request of type square.rb::Shift, as a Hash
      #   * :id (String) 
      #   * :employee_id (String) 
      #   * :location_id (String) 
      #   * :timezone (String) 
      #   * :start_at (String) 
      #   * :end_at (String) 
      #   * :wage (Hash)
      #     * :title (String) 
      #     * :hourly_rate (Hash)
      #       * :amount (Long) 
      #       * :currency (square.rb::Currency) 
      #     * :job_id (String) 
      #     * :tip_eligible (Boolean) 
      #   * :breaks (Array<square.rb::Break>) 
      #   * :status (square.rb::ShiftStatus) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      #   * :team_member_id (String) 
      #   * :declared_cash_tip_money (Hash)
      #     * :amount (Long) 
      #     * :currency (square.rb::Currency) 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.update(id: "id", shift: { location_id: "PAA1RJZZKXBFG", start_at: "2019-01-25T03:11:00-05:00", end_at: "2019-01-25T13:11:00-05:00", wage: { title: "Bartender", hourly_rate: { amount: 1500, currency: USD }, tip_eligible: true }, breaks: [{ id: "X7GAQYVVRRG6P", start_at: "2019-01-25T06:11:00-05:00", end_at: "2019-01-25T06:16:00-05:00", break_type_id: "REGS1EQR1TPZ5", name: "Tea Break", expected_duration: "PT5M", is_paid: true }], version: 1, team_member_id: "ormj0jJJZ5OZIzxrZYJI", declared_cash_tip_money: { amount: 500, currency: USD } })
      def update(id:, shift:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), shift: shift }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/#{id}"
end
          square.rb::UpdateShiftResponse.from_json(json_object: response.body)
        end
      end
# Deletes a `Shift`.
      #
      # @param id [String] The UUID for the `Shift` being deleted.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::DeleteShiftResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.shifts.delete(id: "id")
      def delete(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/shifts/#{id}"
end
          square.rb::DeleteShiftResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end