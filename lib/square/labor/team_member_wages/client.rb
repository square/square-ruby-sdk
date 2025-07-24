# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_team_member_wages_response"
require_relative "../../types/get_team_member_wage_response"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Labor
    class TeamMemberWagesClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Labor::TeamMemberWagesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a paginated list of `TeamMemberWage` instances for a business.
      #
      # @param team_member_id [String] Filter the returned wages to only those that are associated with the
#  specified team member.
      # @param limit [Integer] The maximum number of `TeamMemberWage` results to return per page. The number
#  can range between
#  1 and 200. The default is 200.
      # @param cursor [String] A pointer to the next page of `EmployeeWage` results to fetch.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListTeamMemberWagesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.team_member_wages.list
      def list(team_member_id: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "team_member_id": team_member_id, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/team-member-wages"
end
        square.rb::ListTeamMemberWagesResponse.from_json(json_object: response.body)
      end
# Returns a single `TeamMemberWage` specified by `id`.
      #
      # @param id [String] The UUID for the `TeamMemberWage` being retrieved.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetTeamMemberWageResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.team_member_wages.get(id: "id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/team-member-wages/#{id}"
end
        square.rb::GetTeamMemberWageResponse.from_json(json_object: response.body)
      end
    end
    class AsyncTeamMemberWagesClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Labor::AsyncTeamMemberWagesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Returns a paginated list of `TeamMemberWage` instances for a business.
      #
      # @param team_member_id [String] Filter the returned wages to only those that are associated with the
#  specified team member.
      # @param limit [Integer] The maximum number of `TeamMemberWage` results to return per page. The number
#  can range between
#  1 and 200. The default is 200.
      # @param cursor [String] A pointer to the next page of `EmployeeWage` results to fetch.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::ListTeamMemberWagesResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.team_member_wages.list
      def list(team_member_id: nil, limit: nil, cursor: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "team_member_id": team_member_id, "limit": limit, "cursor": cursor }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/team-member-wages"
end
          square.rb::ListTeamMemberWagesResponse.from_json(json_object: response.body)
        end
      end
# Returns a single `TeamMemberWage` specified by `id`.
      #
      # @param id [String] The UUID for the `TeamMemberWage` being retrieved.
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::GetTeamMemberWageResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.labor.team_member_wages.get(id: "id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/labor/team-member-wages/#{id}"
end
          square.rb::GetTeamMemberWageResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end