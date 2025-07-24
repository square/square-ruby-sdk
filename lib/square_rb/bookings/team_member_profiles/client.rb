# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/list_team_member_booking_profiles_response"
require_relative "../../types/get_team_member_booking_profile_response"
require "async"
require "async"
require_relative "../../../requests"

module SquareApiClient
  module Bookings
    class TeamMemberProfilesClient
    # @return [SquareApiClient::RequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Bookings::TeamMemberProfilesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists booking profiles for team members.
      #
      # @param bookable_only [Boolean] Indicates whether to include only bookable team members in the returned result
#  (`true`) or not (`false`).
      # @param limit [Integer] The maximum number of results to return in a paged response.
      # @param cursor [String] The pagination cursor from the preceding response to return the next page of the
#  results. Do not set this when retrieving the first page of the results.
      # @param location_id [String] Indicates whether to include only team members enabled at the given location in
#  the returned result.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListTeamMemberBookingProfilesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.team_member_profiles.list
      def list(bookable_only: nil, limit: nil, cursor: nil, location_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "bookable_only": bookable_only, "limit": limit, "cursor": cursor, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/team-member-booking-profiles"
end
        SquareApiClient::ListTeamMemberBookingProfilesResponse.from_json(json_object: response.body)
      end
# Retrieves a team member's booking profile.
      #
      # @param team_member_id [String] The ID of the team member to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetTeamMemberBookingProfileResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.team_member_profiles.get(team_member_id: "team_member_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/team-member-booking-profiles/#{team_member_id}"
end
        SquareApiClient::GetTeamMemberBookingProfileResponse.from_json(json_object: response.body)
      end
    end
    class AsyncTeamMemberProfilesClient
    # @return [SquareApiClient::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [SquareApiClient::RequestClient] 
      # @return [SquareApiClient::Bookings::AsyncTeamMemberProfilesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Lists booking profiles for team members.
      #
      # @param bookable_only [Boolean] Indicates whether to include only bookable team members in the returned result
#  (`true`) or not (`false`).
      # @param limit [Integer] The maximum number of results to return in a paged response.
      # @param cursor [String] The pagination cursor from the preceding response to return the next page of the
#  results. Do not set this when retrieving the first page of the results.
      # @param location_id [String] Indicates whether to include only team members enabled at the given location in
#  the returned result.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::ListTeamMemberBookingProfilesResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.team_member_profiles.list
      def list(bookable_only: nil, limit: nil, cursor: nil, location_id: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "bookable_only": bookable_only, "limit": limit, "cursor": cursor, "location_id": location_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/team-member-booking-profiles"
end
          SquareApiClient::ListTeamMemberBookingProfilesResponse.from_json(json_object: response.body)
        end
      end
# Retrieves a team member's booking profile.
      #
      # @param team_member_id [String] The ID of the team member to retrieve.
      # @param request_options [SquareApiClient::RequestOptions] 
      # @return [SquareApiClient::GetTeamMemberBookingProfileResponse]
      # @example
#  api = SquareApiClient::Client.new(
#    base_url: "https://api.example.com",
#    environment: SquareApiClient::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.bookings.team_member_profiles.get(team_member_id: "team_member_id")
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
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/bookings/team-member-booking-profiles/#{team_member_id}"
end
          SquareApiClient::GetTeamMemberBookingProfileResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end