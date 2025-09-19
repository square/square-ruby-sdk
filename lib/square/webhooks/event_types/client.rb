# frozen_string_literal: true

module Square
  module Webhooks
    module EventTypes
      class Client
        # @return [Square::Webhooks::EventTypes::Client]
        def initialize(client:)
          @client = client
        end

        # Lists all webhook event types that can be subscribed to.
        #
        # @return [Square::Types::ListWebhookEventTypesResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            ["api_version"],
            %i[api_version]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/webhooks/event-types",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListWebhookEventTypesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
