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
          _query_param_names = %w[location_id limit cursor]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/break-types",
            query: _query
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::ListBreakTypesResponse.load(_response.body)
          end

          raise _response.body
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
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "POST",
            path: "v2/labor/break-types",
            body: params
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateBreakTypeResponse.load(_response.body)
          end

          raise _response.body
        end

        # Returns a single `BreakType` specified by `id`.
        #
        # @return [Square::Types::GetBreakTypeResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "GET",
            path: "v2/labor/break-types/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::GetBreakTypeResponse.load(_response.body)
          end

          raise _response.body
        end

        # Updates an existing `BreakType`.
        #
        # @return [Square::Types::UpdateBreakTypeResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "PUT",
            path: "v2/labor/break-types/#{params[:id]}",
            body: params.except(*_path_param_names)
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateBreakTypeResponse.load(_response.body)
          end

          raise _response.body
        end

        # Deletes an existing `BreakType`.
        #
        # A `BreakType` can be deleted even if it is referenced from a `Shift`.
        #
        # @return [Square::Types::DeleteBreakTypeResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::SANDBOX,
            method: "DELETE",
            path: "v2/labor/break-types/#{params[:id]}"
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::DeleteBreakTypeResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
