
module Square
  module Employees
    class Client
      # @option client [Square::Internal::Http::RawClient]
      #
      # @return [Square::Employees::Client]
      def initialize(client)
        @client = client
      end

      # @return [Square::Types::ListEmployeesResponse]
      def list(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListEmployeesResponse.load(_response.body)
        else
          raise _response.body
        end
      end

      # @return [Square::Types::GetEmployeeResponse]
      def get(request_options: {}, **params)
        _request = params
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetEmployeeResponse.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
