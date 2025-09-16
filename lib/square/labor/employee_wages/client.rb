# frozen_string_literal: true

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
          _query_param_names = [
            %w[employee_id limit cursor],
            %i[employee_id limit cursor]
          ].flatten
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/employee-wages",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListEmployeeWagesResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a single `EmployeeWage` specified by `id`.
        #
        # @return [Square::Types::GetEmployeeWageResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/employee-wages/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetEmployeeWageResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
