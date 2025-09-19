# frozen_string_literal: true

module Square
  module Labor
    module Shifts
      class Client
        # @return [Square::Labor::Shifts::Client]
        def initialize(client:)
          @client = client
        end

        # Creates a new `Shift`.
        #
        # A `Shift` represents a complete workday for a single team member.
        # You must provide the following values in your request to this
        # endpoint:
        #
        # - `location_id`
        # - `team_member_id`
        # - `start_at`
        #
        # An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when:
        # - The `status` of the new `Shift` is `OPEN` and the team member has another
        # shift with an `OPEN` status.
        # - The `start_at` date is in the future.
        # - The `start_at` or `end_at` date overlaps another shift for the same team member.
        # - The `Break` instances are set in the request and a break `start_at`
        # is before the `Shift.start_at`, a break `end_at` is after
        # the `Shift.end_at`, or both.
        #
        # @return [Square::Types::CreateShiftResponse]
        def create(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/labor/shifts",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::CreateShiftResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Returns a paginated list of `Shift` records for a business.
        # The list to be returned can be filtered by:
        # - Location IDs
        # - Team member IDs
        # - Shift status (`OPEN` or `CLOSED`)
        # - Shift start
        # - Shift end
        # - Workday details
        #
        # The list can be sorted by:
        # - `START_AT`
        # - `END_AT`
        # - `CREATED_AT`
        # - `UPDATED_AT`
        #
        # @return [Square::Types::SearchShiftsResponse]
        def search(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "POST",
            path: "v2/labor/shifts/search",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::SearchShiftsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Returns a single `Shift` specified by `id`.
        #
        # @return [Square::Types::GetShiftResponse]
        def get(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/labor/shifts/#{params[:id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::GetShiftResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Updates an existing `Shift`.
        #
        # When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift` have
        # the `end_at` property set to a valid RFC-3339 datetime string.
        #
        # When closing a `Shift`, all `Break` instances in the `Shift` must be complete with `end_at`
        # set on each `Break`.
        #
        # @return [Square::Types::UpdateShiftResponse]
        def update(request_options: {}, **params)
          _path_param_names = ["id"]

          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "PUT",
            path: "v2/labor/shifts/#{params[:id]}",
            body: params.except(*_path_param_names)
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::UpdateShiftResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Deletes a `Shift`.
        #
        # @return [Square::Types::DeleteShiftResponse]
        def delete(request_options: {}, **params)
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "DELETE",
            path: "v2/labor/shifts/#{params[:id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::DeleteShiftResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
