# frozen_string_literal: true

module Square
  module Labor
    module WorkweekConfigs
      class Client
        # @return [Square::Labor::WorkweekConfigs::Client]
        def initialize(client:)
          @client = client
        end

        # Returns a list of `WorkweekConfig` instances for a business.
        #
        # @return [Square::Types::ListWorkweekConfigsResponse]
        def list(request_options: {}, **params)
          _query_param_names = %w[limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/workweek-configs",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListWorkweekConfigsResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates a `WorkweekConfig`.
        #
        # @return [Square::Types::UpdateWorkweekConfigResponse]
        def get(request_options: {}, **params)
          _path_param_names = ["id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/labor/workweek-configs/#{params[:id]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateWorkweekConfigResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
