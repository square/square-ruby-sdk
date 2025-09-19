# frozen_string_literal: true

module Square
  module Labor
    module TeamMemberWages
      class Client
        # @return [Square::Labor::TeamMemberWages::Client]
        def initialize(client:)
          @client = client
        end

        # Returns a paginated list of `TeamMemberWage` instances for a business.
        #
        # @return [Square::Types::ListTeamMemberWagesResponse]
        def list(request_options: {}, **params)
          _query_param_names = [
            %w[team_member_id limit cursor],
            %i[team_member_id limit cursor]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/labor/team-member-wages",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListTeamMemberWagesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Returns a single `TeamMemberWage` specified by `id`.
        #
        # @return [Square::Types::GetTeamMemberWageResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/labor/team-member-wages/#{params[:id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetTeamMemberWageResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
