# frozen_string_literal: true

module Square
  module Labor
    module Shifts
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
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
        # @param request_options [Hash]
        # @param params [Square::Labor::Shifts::Types::CreateShiftRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.labor.shifts.create(
        #     idempotency_key: "HIDSNG5KS478L",
        #     shift: {
        #       location_id: "PAA1RJZZKXBFG",
        #       start_at: "2019-01-25T03:11:00-05:00",
        #       end_at: "2019-01-25T13:11:00-05:00",
        #       wage: {
        #         title: "Barista",
        #         hourly_rate: {
        #           amount: 1100,
        #           currency: "USD"
        #         },
        #         tip_eligible: true
        #       },
        #       breaks: [{
        #         start_at: "2019-01-25T06:11:00-05:00",
        #         end_at: "2019-01-25T06:16:00-05:00",
        #         break_type_id: "REGS1EQR1TPZ5",
        #         name: "Tea Break",
        #         expected_duration: "PT5M",
        #         is_paid: true
        #       }],
        #       team_member_id: "ormj0jJJZ5OZIzxrZYJI",
        #       declared_cash_tip_money: {
        #         amount: 500,
        #         currency: "USD"
        #       }
        #     }
        #   )
        #
        # @return [Square::Types::CreateShiftResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/labor/shifts",
            body: Square::Labor::Shifts::Types::CreateShiftRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::CreateShiftResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
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
        # @param request_options [Hash]
        # @param params [Square::Labor::Shifts::Types::SearchShiftsRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.labor.shifts.search(
        #     query: {
        #       filter: {
        #         workday: {
        #           date_range: {
        #             start_date: "2019-01-20",
        #             end_date: "2019-02-03"
        #           },
        #           match_shifts_by: "START_AT",
        #           default_timezone: "America/Los_Angeles"
        #         }
        #       }
        #     },
        #     limit: 100
        #   )
        #
        # @return [Square::Types::SearchShiftsResponse]
        def search(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/labor/shifts/search",
            body: Square::Labor::Shifts::Types::SearchShiftsRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::SearchShiftsResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns a single `Shift` specified by `id`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.labor.shifts.get(id: "id")
        #
        # @return [Square::Types::GetShiftResponse]
        def get(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/labor/shifts/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::GetShiftResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
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
        # @param request_options [Hash]
        # @param params [Square::Labor::Shifts::Types::UpdateShiftRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.labor.shifts.update(
        #     id: "id",
        #     shift: {
        #       location_id: "PAA1RJZZKXBFG",
        #       start_at: "2019-01-25T03:11:00-05:00",
        #       end_at: "2019-01-25T13:11:00-05:00",
        #       wage: {
        #         title: "Bartender",
        #         hourly_rate: {
        #           amount: 1500,
        #           currency: "USD"
        #         },
        #         tip_eligible: true
        #       },
        #       breaks: [{
        #         id: "X7GAQYVVRRG6P",
        #         start_at: "2019-01-25T06:11:00-05:00",
        #         end_at: "2019-01-25T06:16:00-05:00",
        #         break_type_id: "REGS1EQR1TPZ5",
        #         name: "Tea Break",
        #         expected_duration: "PT5M",
        #         is_paid: true
        #       }],
        #       version: 1,
        #       team_member_id: "ormj0jJJZ5OZIzxrZYJI",
        #       declared_cash_tip_money: {
        #         amount: 500,
        #         currency: "USD"
        #       }
        #     }
        #   )
        #
        # @return [Square::Types::UpdateShiftResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request_data = Square::Labor::Shifts::Types::UpdateShiftRequest.new(params).to_h
          non_body_param_names = %w[id]
          body = request_data.except(*non_body_param_names)

          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/labor/shifts/#{URI.encode_uri_component(params[:id].to_s)}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::UpdateShiftResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes a `Shift`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :id
        #
        # @example
        #   client.labor.shifts.delete(id: "id")
        #
        # @return [Square::Types::DeleteShiftResponse]
        def delete(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "DELETE",
            path: "v2/labor/shifts/#{URI.encode_uri_component(params[:id].to_s)}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            (response.body.to_s.empty? ? nil : Square::Types::DeleteShiftResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
