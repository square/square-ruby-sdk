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
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[location_id status limit cursor]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :employees,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/employees",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListEmployeesResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end

      # @return [Square::Types::GetEmployeeResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/employees/#{params[:id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetEmployeeResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
