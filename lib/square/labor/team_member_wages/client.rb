
module Square
  module Labor
    module TeamMemberWages
      class Client
        # @option client [Square::Internal::Http::RawClient]
        #
        # @return [Square::Labor::TeamMemberWages::Client]
        def initialize(client)
          @client = client
        end

        # Returns a paginated list of `TeamMemberWage` instances for a business.
        #
        # @return [Square::ListTeamMemberWagesResponse]
        def list(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListTeamMemberWagesResponse.load(_response.body)

          else
            raise _response.body
        end

        # Returns a single `TeamMemberWage` specified by `id`.
        #
        # @return [Square::GetTeamMemberWageResponse]
        def get(request_options: {}, **params)
          _request = params

          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetTeamMemberWageResponse.load(_response.body)

          else
            raise _response.body
        end

      end
    end
  end
end
