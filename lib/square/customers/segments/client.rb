# frozen_string_literal: true

module Square
  module Customers
    module Segments
      class Client
        # @return [Square::Customers::Segments::Client]
        def initialize(client:)
          @client = client
        end

        # Retrieves the list of customer segments of a business.
        #
        # @return [Square::Types::ListCustomerSegmentsResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[cursor limit]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/customers/segments",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListCustomerSegmentsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Retrieves a specific customer segment as identified by the `segment_id` value.
        #
        # @return [Square::Types::GetCustomerSegmentResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/customers/segments/#{params[:segment_id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetCustomerSegmentResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
