# frozen_string_literal: true

module Square
  module Labor
    module WorkweekConfigs
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns a list of `WorkweekConfig` instances for a business.
        #
        # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::WorkweekConfig` in the
        # `workweek_configs` field of every page, requesting pages as they are needed. Call `pages` on it to get each
        # page as a `Square::Types::ListWorkweekConfigsResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @example
        #   client.labor.workweek_configs.list(
        #     limit: 1,
        #     cursor: "cursor"
        #   )
        #
        # @return [Square::Internal::CursorItemIterator]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :workweek_configs,
            initial_cursor: query_params["cursor"]
          ) do |next_cursor|
            query_params["cursor"] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/labor/workweek-configs",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListWorkweekConfigsResponse.load(response.body))
              [parsed_response, response]
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Updates a `WorkweekConfig`.
        #
        # @param request_options [Hash]
        # @param params [Square::Labor::WorkweekConfigs::Types::UpdateWorkweekConfigRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.labor.workweek_configs.get(
        #     id: "id",
        #     workweek_config: {
        #       start_of_week: "MON",
        #       start_of_day_local_time: "10:00",
        #       version: 10
        #     }
        #   )
        #
        # @return [Square::Types::UpdateWorkweekConfigResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Labor::WorkweekConfigs::Types::UpdateWorkweekConfigRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/labor/workweek-configs/#{URI.encode_uri_component(params[:id].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::UpdateWorkweekConfigResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
