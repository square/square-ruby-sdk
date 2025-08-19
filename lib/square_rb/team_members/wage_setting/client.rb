# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/get_wage_setting_response"
require_relative "../../types/wage_setting"
require_relative "../../types/update_wage_setting_response"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module TeamMembers
    class WageSettingClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::TeamMembers::WageSettingClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves a `WageSetting` object for a team member specified
#  by `TeamMember.id`. For more information, see
#  [Troubleshooting the Team
#  ](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).
#  Square recommends using
#  [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
#  to get this information directly from the `TeamMember.wage_setting` field.
      #
      # @param team_member_id [String] The ID of the team member for which to retrieve the wage setting.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetWageSettingResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.wage_setting.get(team_member_id: "team_member_id")
      def get(team_member_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}/wage-setting"
end
        SquareApiClient::GetWageSettingResponse.from_json(json_object: response.body)
      end
# Creates or updates a `WageSetting` object. The object is created if a
#  `WageSetting` with the specified `team_member_id` doesn't exist. Otherwise,
#  it fully replaces the `WageSetting` object for the team member.
#  The `WageSetting` is returned on a successful update. For more information, see
#  [Troubleshooting the Team
#  veloper.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).
#  Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember)
#  or [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember)
#  to manage the `TeamMember.wage_setting` field directly.
      #
      # @param team_member_id [String] The ID of the team member for which to update the `WageSetting` object.
      # @param wage_setting [Hash] The complete `WageSetting` object. For all job assignments, specify one of the
#  following:
#  - `job_id` (recommended) - If needed, call
#  [ListJobs](api-endpoint:Team-ListJobs) to get a list of all jobs.
#  Requires Square API version 2024-12-18 or later.
#  - `job_title` - Use the exact, case-sensitive spelling of an existing title
#  unless you want to create a new job.
#  This value is ignored if `job_id` is also provided.Request of type SquareApiClient::WageSetting, as a Hash
      #   * :team_member_id (String) 
      #   * :job_assignments (Array<SquareApiClient::JobAssignment>) 
      #   * :is_overtime_exempt (Boolean) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdateWageSettingResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.wage_setting.update(team_member_id: "team_member_id", wage_setting: { job_assignments: [{ job_title: "Manager", pay_type: SALARY, annual_rate: { amount: 3000000, currency: USD }, weekly_hours: 40 }, { job_title: "Cashier", pay_type: HOURLY, hourly_rate: { amount: 2000, currency: USD } }], is_overtime_exempt: true })
      def update(team_member_id:, wage_setting:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), wage_setting: wage_setting }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}/wage-setting"
end
        SquareApiClient::UpdateWageSettingResponse.from_json(json_object: response.body)
      end
    end
    class AsyncWageSettingClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::TeamMembers::AsyncWageSettingClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Retrieves a `WageSetting` object for a team member specified
#  by `TeamMember.id`. For more information, see
#  [Troubleshooting the Team
#  ](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).
#  Square recommends using
#  [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or
#  [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers)
#  to get this information directly from the `TeamMember.wage_setting` field.
      #
      # @param team_member_id [String] The ID of the team member for which to retrieve the wage setting.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetWageSettingResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.wage_setting.get(team_member_id: "team_member_id")
      def get(team_member_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}/wage-setting"
end
          SquareApiClient::GetWageSettingResponse.from_json(json_object: response.body)
        end
      end
# Creates or updates a `WageSetting` object. The object is created if a
#  `WageSetting` with the specified `team_member_id` doesn't exist. Otherwise,
#  it fully replaces the `WageSetting` object for the team member.
#  The `WageSetting` is returned on a successful update. For more information, see
#  [Troubleshooting the Team
#  veloper.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).
#  Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember)
#  or [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember)
#  to manage the `TeamMember.wage_setting` field directly.
      #
      # @param team_member_id [String] The ID of the team member for which to update the `WageSetting` object.
      # @param wage_setting [Hash] The complete `WageSetting` object. For all job assignments, specify one of the
#  following:
#  - `job_id` (recommended) - If needed, call
#  [ListJobs](api-endpoint:Team-ListJobs) to get a list of all jobs.
#  Requires Square API version 2024-12-18 or later.
#  - `job_title` - Use the exact, case-sensitive spelling of an existing title
#  unless you want to create a new job.
#  This value is ignored if `job_id` is also provided.Request of type SquareApiClient::WageSetting, as a Hash
      #   * :team_member_id (String) 
      #   * :job_assignments (Array<SquareApiClient::JobAssignment>) 
      #   * :is_overtime_exempt (Boolean) 
      #   * :version (Integer) 
      #   * :created_at (String) 
      #   * :updated_at (String) 
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::UpdateWageSettingResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.wage_setting.update(team_member_id: "team_member_id", wage_setting: { job_assignments: [{ job_title: "Manager", pay_type: SALARY, annual_rate: { amount: 3000000, currency: USD }, weekly_hours: 40 }, { job_title: "Cashier", pay_type: HOURLY, hourly_rate: { amount: 2000, currency: USD } }], is_overtime_exempt: true })
      def update(team_member_id:, wage_setting:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), wage_setting: wage_setting }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}/wage-setting"
end
          SquareApiClient::UpdateWageSettingResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end