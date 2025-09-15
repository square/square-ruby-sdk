# frozen_string_literal: true

module Square
  module Bookings
    module TeamMemberProfiles
      class Client
        # @return [Square::Bookings::TeamMemberProfiles::Client]
        def initialize(client:)
          @client = client
        end

        # Lists booking profiles for team members.
        #
        # @return [Square::Types::ListTeamMemberBookingProfilesResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[bookable_only limit cursor location_id],
            %i[bookable_only limit cursor location_id]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/bookings/team-member-booking-profiles",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListTeamMemberBookingProfilesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a team member's booking profile.
        #
        # @return [Square::Types::GetTeamMemberBookingProfileResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/bookings/team-member-booking-profiles/#{params[:team_member_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTeamMemberBookingProfileResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
