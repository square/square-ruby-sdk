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
          _query_param_names = [
            %w[limit cursor],
            %i[limit cursor]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/bookings/location-booking-profiles",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListLocationBookingProfilesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
