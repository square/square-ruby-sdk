# frozen_string_literal: true

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
          _query_param_names = %w[limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/bookings/location-booking-profiles",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListLocationBookingProfilesResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
