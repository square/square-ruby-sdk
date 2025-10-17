# frozen_string_literal: true

module Square
  module Labor
    module BreakTypes
      class Client
        # @return [Square::Labor::BreakTypes::Client]
        def initialize(client:)
          @client = client
        end

        # Returns a paginated list of `BreakType` instances for a business.
        #
        # @return [Square::Types::ListBreakTypesResponse]
        def list(request_options: {}, **params)
          params = Square::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[location_id limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          Square::Internal::CursorItemIterator.new(
            cursor_field: :cursor,
            item_field: :break_types,
            initial_cursor: _query[:cursor]
          ) do |next_cursor|
            _query[:cursor] = next_cursor
            _request = Square::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
              method: "GET",
              path: "v2/labor/break-types",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Square::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Square::Types::ListBreakTypesResponse.load(_response.body)
            else
              error_class = Square::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end
        end

        # Creates a new `BreakType`.
        #
        # A `BreakType` is a template for creating `Break` objects.
        # You must provide the following values in your request to this
        # endpoint:
        #
        # - `location_id`
        # - `break_name`
        # - `expected_duration`
        # - `is_paid`
        #
        # You can only have three `BreakType` instances per location. If you attempt to add a fourth
        # `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3 breaks per location."
        # is returned.
        #
        # @return [Square::Types::CreateBreakTypeResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/labor/break-types",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateBreakTypeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Returns a single `BreakType` specified by `id`.
        #
        # @return [Square::Types::GetBreakTypeResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/labor/break-types/#{params[:id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetBreakTypeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates an existing `BreakType`.
        #
        # @return [Square::Types::UpdateBreakTypeResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/labor/break-types/#{params[:id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateBreakTypeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes an existing `BreakType`.
        #
        # A `BreakType` can be deleted even if it is referenced from a `Shift`.
        #
        # @return [Square::Types::DeleteBreakTypeResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/labor/break-types/#{params[:id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteBreakTypeResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
