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
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :workweek_configs,
            initial_cursor: _query[:cursor]
          ) do |next_cursor|
            _query[:cursor] = next_cursor
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/labor/workweek-configs",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListWorkweekConfigsResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end

        # Updates a `WorkweekConfig`.
        #
        # @return [Square::Types::UpdateWorkweekConfigResponse]
        def get(request_options: {}, **params)
          _path_param_names = ["id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/labor/workweek-configs/#{params[:id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateWorkweekConfigResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
