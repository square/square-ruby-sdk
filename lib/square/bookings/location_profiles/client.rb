
module Square
  module Bookings
    module LocationProfiles
      class Client
        # @return [Square::Bookings::LocationProfiles::Client]
        def initialize(client:)
          @client = client
        end

        # Lists location booking profiles of a seller.
        #
        # @return [Square::Types::ListLocationBookingProfilesResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListLocationBookingProfilesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
