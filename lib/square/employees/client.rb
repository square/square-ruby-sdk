# frozen_string_literal: true

module Square
  module Employees
    class Client
      # @return [Square::Employees::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Square::Types::ListEmployeesResponse]
      def list(request_options: {}, **params)
        _query_param_names = [
          %w[location_id status limit cursor],
          %i[location_id status limit cursor]
        ].flatten
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/employees",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListEmployeesResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::Types::GetEmployeeResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/employees/#{params[:id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetEmployeeResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
