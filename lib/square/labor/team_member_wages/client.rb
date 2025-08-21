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
          _query_param_names = %w[team_member_id limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/team-member-wages",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListTeamMemberWagesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a single `TeamMemberWage` specified by `id`.
        #
        # @return [Square::Types::GetTeamMemberWageResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/team-member-wages/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTeamMemberWageResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
