
module Square
  module Labor
    module EmployeeWages
      class Client
        # @return [Square::Labor::EmployeeWages::Client]
        def initialize(client:)
          @client = client
        end

        # Returns a paginated list of `EmployeeWage` instances for a business.
        #
        # @return [Square::Types::ListEmployeeWagesResponse]
        def list(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListEmployeeWagesResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # Returns a single `EmployeeWage` specified by `id`.
        #
        # @return [Square::Types::GetEmployeeWageResponse]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetEmployeeWageResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
