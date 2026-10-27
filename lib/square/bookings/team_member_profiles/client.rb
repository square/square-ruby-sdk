# frozen_string_literal: true

module Square
  module Bookings
    module TeamMemberProfiles
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Lists booking profiles for team members.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::TeamMemberBookingProfile` in
        # the `team_member_booking_profiles` field of every page, requesting pages as they are needed. Call `pages` on
        # it to get each page as a `Square::Types::ListTeamMemberBookingProfilesResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Boolean, nil] :bookable_only
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        # @option params [String, nil] :location_id
        #
        # @example
        #   client.bookings.team_member_profiles.list(
        #     bookable_only: true,
        #     limit: 1,
        #     cursor: "cursor",
        #     location_id: "location_id"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["bookable_only"] = params[:bookable_only] if params.key?(:bookable_only)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          query_params["location_id"] = params[:location_id] if params.key?(:location_id)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :team_member_booking_profiles,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/bookings/team-member-booking-profiles",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListTeamMemberBookingProfilesResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Retrieves a team member's booking profile.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :team_member_id
        #
        # @example
        #   client.bookings.team_member_profiles.get(team_member_id: "team_member_id")
        #
        # @return [Square::Types::GetTeamMemberBookingProfileResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/bookings/team-member-booking-profiles/#{URI.encode_uri_component(params[:team_member_id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetTeamMemberBookingProfileResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
