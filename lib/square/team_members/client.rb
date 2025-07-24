# frozen_string_literal: true
require_relative "../../requests"
require_relative "wage_setting/client"
require_relative "../types/create_team_member_request"
require_relative "../types/create_team_member_response"
require_relative "../types/batch_create_team_members_response"
require_relative "../types/batch_update_team_members_response"
require_relative "../types/search_team_members_query"
require_relative "../types/search_team_members_response"
require_relative "../types/get_team_member_response"
require_relative "../types/update_team_member_request"
require_relative "../types/update_team_member_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module SquareApiClient
  class TeamMembersClient
  # @return [SquareApiClient::RequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::TeamMembers::WageSettingClient] 
    attr_reader :wage_setting


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::TeamMembersClient]
    def initialize(request_client:)
      @request_client = request_client
      @wage_setting = SquareApiClient::TeamMembers::WageSettingClient.new(request_client: request_client)
    end
# Creates a single `TeamMember` object. The `TeamMember` object is returned on
#  successful creates.
#  You must provide the following values in your request to this endpoint:
#  - `given_name`
#  - `family_name`
#  Learn about [Troubleshooting the Team
#  API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
    #
    # @param request [Hash] Request of type SquareApiClient::CreateTeamMemberRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :team_member (Hash)
    #     * :id (String) 
    #     * :reference_id (String) 
    #     * :is_owner (Boolean) 
    #     * :status (SquareApiClient::TeamMemberStatus) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :phone_number (String) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :assigned_locations (Hash)
    #       * :assignment_type (SquareApiClient::TeamMemberAssignedLocationsAssignmentType) 
    #       * :location_ids (Array<String>) 
    #     * :wage_setting (Hash)
    #       * :team_member_id (String) 
    #       * :job_assignments (Array<SquareApiClient::JobAssignment>) 
    #       * :is_overtime_exempt (Boolean) 
    #       * :version (Integer) 
    #       * :created_at (String) 
    #       * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateTeamMemberResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.create(request: { idempotency_key: "idempotency-key-0", team_member: { reference_id: "reference_id_1", status: ACTIVE, given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] }, wage_setting: { job_assignments: [{ pay_type: SALARY, annual_rate: { amount: 3000000, currency: USD }, weekly_hours: 40, job_id: "FjS8x95cqHiMenw4f1NAUH4P" }, { pay_type: HOURLY, hourly_rate: { amount: 2000, currency: USD }, job_id: "VDNpRv8da51NU8qZFC5zDWpF" }], is_overtime_exempt: true } } })
    def create(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members"
end
      SquareApiClient::CreateTeamMemberResponse.from_json(json_object: response.body)
    end
# Creates multiple `TeamMember` objects. The created `TeamMember` objects are
#  returned on successful creates.
#  This process is non-transactional and processes as much of the request as
#  possible. If one of the creates in
#  the request cannot be successfully processed, the request is not marked as
#  failed, but the body of the response
#  contains explicit error information for the failed create.
#  Learn about [Troubleshooting the Team
#  ps://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
    #
    # @param team_members [Hash{String => SquareApiClient::CreateTeamMemberRequest}] The data used to create the `TeamMember` objects. Each key is the
#  `idempotency_key` that maps to the `CreateTeamMemberRequest`.
#  The maximum number of create objects is 25.
#  If you include a team member's `wage_setting`, you must provide `job_id` for
#  each job assignment. To get job IDs,
#  call [ListJobs](api-endpoint:Team-ListJobs).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchCreateTeamMembersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.batch_create(team_members: { "idempotency-key-1": { team_member: { reference_id: "reference_id_1", given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] } } }, "idempotency-key-2": { team_member: { reference_id: "reference_id_2", given_name: "Jane", family_name: "Smith", email_address: "jane_smith@gmail.com", phone_number: "+14159223334", assigned_locations: { assignment_type: ALL_CURRENT_AND_FUTURE_LOCATIONS } } } })
    def batch_create(team_members:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), team_members: team_members }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/bulk-create"
end
      SquareApiClient::BatchCreateTeamMembersResponse.from_json(json_object: response.body)
    end
# Updates multiple `TeamMember` objects. The updated `TeamMember` objects are
#  returned on successful updates.
#  This process is non-transactional and processes as much of the request as
#  possible. If one of the updates in
#  the request cannot be successfully processed, the request is not marked as
#  failed, but the body of the response
#  contains explicit error information for the failed update.
#  Learn about [Troubleshooting the Team
#  ps://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
    #
    # @param team_members [Hash{String => SquareApiClient::UpdateTeamMemberRequest}] The data used to update the `TeamMember` objects. Each key is the
#  `team_member_id` that maps to the `UpdateTeamMemberRequest`.
#  The maximum number of update objects is 25.
#  For each team member, include the fields to add, change, or clear. Fields can be
#  cleared using a null value.
#  To update `wage_setting.job_assignments`, you must provide the complete list of
#  job assignments. If needed,
#  call [ListJobs](api-endpoint:Team-ListJobs) to get the required `job_id` values.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchUpdateTeamMembersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.batch_update(team_members: { "AFMwA08kR-MIF-3Vs0OE": { team_member: { reference_id: "reference_id_2", is_owner: false, status: ACTIVE, given_name: "Jane", family_name: "Smith", email_address: "jane_smith@gmail.com", phone_number: "+14159223334", assigned_locations: { assignment_type: ALL_CURRENT_AND_FUTURE_LOCATIONS } } }, "fpgteZNMaf0qOK-a4t6P": { team_member: { reference_id: "reference_id_1", is_owner: false, status: ACTIVE, given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] } } } })
    def batch_update(team_members:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), team_members: team_members }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/bulk-update"
end
      SquareApiClient::BatchUpdateTeamMembersResponse.from_json(json_object: response.body)
    end
# Returns a paginated list of `TeamMember` objects for a business.
#  The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or
#  whether
#  the team member is the Square account owner.
    #
    # @param query [Hash] The query parameters.Request of type SquareApiClient::SearchTeamMembersQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :status (SquareApiClient::TeamMemberStatus) 
    #     * :is_owner (Boolean) 
    # @param limit [Integer] The maximum number of `TeamMember` objects in a page (100 by default).
    # @param cursor [String] The opaque cursor for fetching the next page. For more information, see
#  [pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchTeamMembersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.search(query: { filter: { location_ids: ["0G5P3VGACMMQZ"], status: ACTIVE } }, limit: 10)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/search"
end
      SquareApiClient::SearchTeamMembersResponse.from_json(json_object: response.body)
    end
# Retrieves a `TeamMember` object for the given `TeamMember.id`.
#  Learn about [Troubleshooting the Team
#  ttps://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
    #
    # @param team_member_id [String] The ID of the team member to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetTeamMemberResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.get(team_member_id: "team_member_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}"
end
      SquareApiClient::GetTeamMemberResponse.from_json(json_object: response.body)
    end
# Updates a single `TeamMember` object. The `TeamMember` object is returned on
#  successful updates.
#  Learn about [Troubleshooting the Team
#  (https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
    #
    # @param team_member_id [String] The ID of the team member to update.
    # @param request [Hash] Request of type SquareApiClient::UpdateTeamMemberRequest, as a Hash
    #   * :team_member (Hash)
    #     * :id (String) 
    #     * :reference_id (String) 
    #     * :is_owner (Boolean) 
    #     * :status (SquareApiClient::TeamMemberStatus) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :phone_number (String) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :assigned_locations (Hash)
    #       * :assignment_type (SquareApiClient::TeamMemberAssignedLocationsAssignmentType) 
    #       * :location_ids (Array<String>) 
    #     * :wage_setting (Hash)
    #       * :team_member_id (String) 
    #       * :job_assignments (Array<SquareApiClient::JobAssignment>) 
    #       * :is_overtime_exempt (Boolean) 
    #       * :version (Integer) 
    #       * :created_at (String) 
    #       * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateTeamMemberResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.update(team_member_id: "team_member_id", request: { team_member: { reference_id: "reference_id_1", status: ACTIVE, given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] }, wage_setting: { job_assignments: [{ pay_type: SALARY, annual_rate: { amount: 3000000, currency: USD }, weekly_hours: 40, job_id: "FjS8x95cqHiMenw4f1NAUH4P" }, { pay_type: HOURLY, hourly_rate: { amount: 1200, currency: USD }, job_id: "VDNpRv8da51NU8qZFC5zDWpF" }], is_overtime_exempt: true } } })
    def update(team_member_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}"
end
      SquareApiClient::UpdateTeamMemberResponse.from_json(json_object: response.body)
    end
  end
  class AsyncTeamMembersClient
  # @return [SquareApiClient::AsyncRequestClient] 
    attr_reader :request_client
  # @return [SquareApiClient::TeamMembers::WageSettingClient] 
    attr_reader :wage_setting


    # @param request_client [SquareApiClient::RequestClient] 
    # @return [SquareApiClient::AsyncTeamMembersClient]
    def initialize(request_client:)
      @request_client = request_client
      @wage_setting = SquareApiClient::TeamMembers::AsyncWageSettingClient.new(request_client: request_client)
    end
# Creates a single `TeamMember` object. The `TeamMember` object is returned on
#  successful creates.
#  You must provide the following values in your request to this endpoint:
#  - `given_name`
#  - `family_name`
#  Learn about [Troubleshooting the Team
#  API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
    #
    # @param request [Hash] Request of type SquareApiClient::CreateTeamMemberRequest, as a Hash
    #   * :idempotency_key (String) 
    #   * :team_member (Hash)
    #     * :id (String) 
    #     * :reference_id (String) 
    #     * :is_owner (Boolean) 
    #     * :status (SquareApiClient::TeamMemberStatus) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :phone_number (String) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :assigned_locations (Hash)
    #       * :assignment_type (SquareApiClient::TeamMemberAssignedLocationsAssignmentType) 
    #       * :location_ids (Array<String>) 
    #     * :wage_setting (Hash)
    #       * :team_member_id (String) 
    #       * :job_assignments (Array<SquareApiClient::JobAssignment>) 
    #       * :is_overtime_exempt (Boolean) 
    #       * :version (Integer) 
    #       * :created_at (String) 
    #       * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::CreateTeamMemberResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.create(request: { idempotency_key: "idempotency-key-0", team_member: { reference_id: "reference_id_1", status: ACTIVE, given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] }, wage_setting: { job_assignments: [{ pay_type: SALARY, annual_rate: { amount: 3000000, currency: USD }, weekly_hours: 40, job_id: "FjS8x95cqHiMenw4f1NAUH4P" }, { pay_type: HOURLY, hourly_rate: { amount: 2000, currency: USD }, job_id: "VDNpRv8da51NU8qZFC5zDWpF" }], is_overtime_exempt: true } } })
    def create(request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members"
end
        SquareApiClient::CreateTeamMemberResponse.from_json(json_object: response.body)
      end
    end
# Creates multiple `TeamMember` objects. The created `TeamMember` objects are
#  returned on successful creates.
#  This process is non-transactional and processes as much of the request as
#  possible. If one of the creates in
#  the request cannot be successfully processed, the request is not marked as
#  failed, but the body of the response
#  contains explicit error information for the failed create.
#  Learn about [Troubleshooting the Team
#  ps://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
    #
    # @param team_members [Hash{String => SquareApiClient::CreateTeamMemberRequest}] The data used to create the `TeamMember` objects. Each key is the
#  `idempotency_key` that maps to the `CreateTeamMemberRequest`.
#  The maximum number of create objects is 25.
#  If you include a team member's `wage_setting`, you must provide `job_id` for
#  each job assignment. To get job IDs,
#  call [ListJobs](api-endpoint:Team-ListJobs).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchCreateTeamMembersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.batch_create(team_members: { "idempotency-key-1": { team_member: { reference_id: "reference_id_1", given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] } } }, "idempotency-key-2": { team_member: { reference_id: "reference_id_2", given_name: "Jane", family_name: "Smith", email_address: "jane_smith@gmail.com", phone_number: "+14159223334", assigned_locations: { assignment_type: ALL_CURRENT_AND_FUTURE_LOCATIONS } } } })
    def batch_create(team_members:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), team_members: team_members }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/bulk-create"
end
        SquareApiClient::BatchCreateTeamMembersResponse.from_json(json_object: response.body)
      end
    end
# Updates multiple `TeamMember` objects. The updated `TeamMember` objects are
#  returned on successful updates.
#  This process is non-transactional and processes as much of the request as
#  possible. If one of the updates in
#  the request cannot be successfully processed, the request is not marked as
#  failed, but the body of the response
#  contains explicit error information for the failed update.
#  Learn about [Troubleshooting the Team
#  ps://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
    #
    # @param team_members [Hash{String => SquareApiClient::UpdateTeamMemberRequest}] The data used to update the `TeamMember` objects. Each key is the
#  `team_member_id` that maps to the `UpdateTeamMemberRequest`.
#  The maximum number of update objects is 25.
#  For each team member, include the fields to add, change, or clear. Fields can be
#  cleared using a null value.
#  To update `wage_setting.job_assignments`, you must provide the complete list of
#  job assignments. If needed,
#  call [ListJobs](api-endpoint:Team-ListJobs) to get the required `job_id` values.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::BatchUpdateTeamMembersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.batch_update(team_members: { "AFMwA08kR-MIF-3Vs0OE": { team_member: { reference_id: "reference_id_2", is_owner: false, status: ACTIVE, given_name: "Jane", family_name: "Smith", email_address: "jane_smith@gmail.com", phone_number: "+14159223334", assigned_locations: { assignment_type: ALL_CURRENT_AND_FUTURE_LOCATIONS } } }, "fpgteZNMaf0qOK-a4t6P": { team_member: { reference_id: "reference_id_1", is_owner: false, status: ACTIVE, given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] } } } })
    def batch_update(team_members:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), team_members: team_members }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/bulk-update"
end
        SquareApiClient::BatchUpdateTeamMembersResponse.from_json(json_object: response.body)
      end
    end
# Returns a paginated list of `TeamMember` objects for a business.
#  The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or
#  whether
#  the team member is the Square account owner.
    #
    # @param query [Hash] The query parameters.Request of type SquareApiClient::SearchTeamMembersQuery, as a Hash
    #   * :filter (Hash)
    #     * :location_ids (Array<String>) 
    #     * :status (SquareApiClient::TeamMemberStatus) 
    #     * :is_owner (Boolean) 
    # @param limit [Integer] The maximum number of `TeamMember` objects in a page (100 by default).
    # @param cursor [String] The opaque cursor for fetching the next page. For more information, see
#  [pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::SearchTeamMembersResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.search(query: { filter: { location_ids: ["0G5P3VGACMMQZ"], status: ACTIVE } }, limit: 10)
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/search"
end
        SquareApiClient::SearchTeamMembersResponse.from_json(json_object: response.body)
      end
    end
# Retrieves a `TeamMember` object for the given `TeamMember.id`.
#  Learn about [Troubleshooting the Team
#  ttps://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
    #
    # @param team_member_id [String] The ID of the team member to retrieve.
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::GetTeamMemberResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.get(team_member_id: "team_member_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}"
end
        SquareApiClient::GetTeamMemberResponse.from_json(json_object: response.body)
      end
    end
# Updates a single `TeamMember` object. The `TeamMember` object is returned on
#  successful updates.
#  Learn about [Troubleshooting the Team
#  (https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
    #
    # @param team_member_id [String] The ID of the team member to update.
    # @param request [Hash] Request of type SquareApiClient::UpdateTeamMemberRequest, as a Hash
    #   * :team_member (Hash)
    #     * :id (String) 
    #     * :reference_id (String) 
    #     * :is_owner (Boolean) 
    #     * :status (SquareApiClient::TeamMemberStatus) 
    #     * :given_name (String) 
    #     * :family_name (String) 
    #     * :email_address (String) 
    #     * :phone_number (String) 
    #     * :created_at (String) 
    #     * :updated_at (String) 
    #     * :assigned_locations (Hash)
    #       * :assignment_type (SquareApiClient::TeamMemberAssignedLocationsAssignmentType) 
    #       * :location_ids (Array<String>) 
    #     * :wage_setting (Hash)
    #       * :team_member_id (String) 
    #       * :job_assignments (Array<SquareApiClient::JobAssignment>) 
    #       * :is_overtime_exempt (Boolean) 
    #       * :version (Integer) 
    #       * :created_at (String) 
    #       * :updated_at (String) 
    # @param request_options [SquareApiClient::RequestOptions] 
    # @return [SquareApiClient::UpdateTeamMemberResponse]
    # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.team_members.update(team_member_id: "team_member_id", request: { team_member: { reference_id: "reference_id_1", status: ACTIVE, given_name: "Joe", family_name: "Doe", email_address: "joe_doe@gmail.com", phone_number: "+14159283333", assigned_locations: { assignment_type: EXPLICIT_LOCATIONS, location_ids: ["YSGH2WBKG94QZ", "GA2Y9HSJ8KRYT"] }, wage_setting: { job_assignments: [{ pay_type: SALARY, annual_rate: { amount: 3000000, currency: USD }, weekly_hours: 40, job_id: "FjS8x95cqHiMenw4f1NAUH4P" }, { pay_type: HOURLY, hourly_rate: { amount: 1200, currency: USD }, job_id: "VDNpRv8da51NU8qZFC5zDWpF" }], is_overtime_exempt: true } } })
    def update(team_member_id:, request:, request_options: nil)
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
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/team-members/#{team_member_id}"
end
        SquareApiClient::UpdateTeamMemberResponse.from_json(json_object: response.body)
      end
    end
  end
end