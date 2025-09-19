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
          _query_param_names = [
            %w[cursor limit],
            %i[cursor limit]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/customers/segments",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListCustomerSegmentsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieves a specific customer segment as identified by the `segment_id` value.
        #
        # @return [Square::Types::GetCustomerSegmentResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/customers/segments/#{params[:segment_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetCustomerSegmentResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
