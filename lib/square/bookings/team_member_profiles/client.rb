
module Square
  module Bookings
    module TeamMemberProfiles
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Bookings::TeamMemberProfiles::Client]
        def initialize(client)
          @client = client
        end

        # Lists booking profiles for team members.
        #
        # @return [Square::Types::ListTeamMemberBookingProfilesResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListTeamMemberBookingProfilesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a team member's booking profile.
        #
        # @return [Square::Types::GetTeamMemberBookingProfileResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTeamMemberBookingProfileResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
