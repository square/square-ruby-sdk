# frozen_string_literal: true

module Square
  module Labor
    module TeamMemberWages
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Returns a paginated list of `TeamMemberWage` instances for a business.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :team_member_id
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :cursor
        #
        # @return [Square::Types::ListTeamMemberWagesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[team_member_id limit cursor]
          query_params = {}
          query_params["team_member_id"] = params[:team_member_id] if params.key?(:team_member_id)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["cursor"] = params[:cursor] if params.key?(:cursor)
          params.except(*query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :team_member_wages,
            initial_cursor: query_params[:cursor]
          ) do |next_cursor|
            query_params[:cursor] = next_cursor
            request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "GET",
              path: "v2/labor/team-member-wages",
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
              Square::Types::ListTeamMemberWagesResponse.load(response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end
        end

        # Returns a single `TeamMemberWage` specified by `id`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @return [Square::Types::GetTeamMemberWageResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/labor/team-member-wages/#{params[:id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetTeamMemberWageResponse.load(response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
