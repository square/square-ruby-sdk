
module Square
  module Customers
    module Segments
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Customers::Segments::Client]
        def initialize(client)
          @client = client
        end

        # Retrieves the list of customer segments of a business.
        #
        # @return [Square::Types::ListCustomerSegmentsResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerSegmentsResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieves a specific customer segment as identified by the `segment_id` value.
        #
        # @return [Square::Types::GetCustomerSegmentResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerSegmentResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
