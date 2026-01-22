# frozen_string_literal: true

module Square
  module Labor
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Creates a scheduled shift by providing draft shift details such as job ID,
      # team member assignment, and start and end times.
      #
      # The following `draft_shift_details` fields are required:
      # - `location_id`
      # - `job_id`
      # - `start_at`
      # - `end_at`
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::CreateScheduledShiftRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateScheduledShiftResponse]
      def create_scheduled_shift(request_options: {}, **params)
        body_prop_names = %i[idempotency_key scheduled_shift]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/labor/scheduled-shifts",
          body: Square::Labor::Types::CreateScheduledShiftRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateScheduledShiftResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Publishes 1 - 100 scheduled shifts. This endpoint takes a map of individual publish
      # requests and returns a map of responses. When a scheduled shift is published, Square keeps
      # the `draft_shift_details` field as is and copies it to the `published_shift_details` field.
      #
      # The minimum `start_at` and maximum `end_at` timestamps of all shifts in a
      # `BulkPublishScheduledShifts` request must fall within a two-week period.
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::BulkPublishScheduledShiftsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::BulkPublishScheduledShiftsResponse]
      def bulk_publish_scheduled_shifts(request_options: {}, **params)
        body_prop_names = %i[scheduled_shifts scheduled_shift_notification_audience]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/labor/scheduled-shifts/bulk-publish",
          body: Square::Labor::Types::BulkPublishScheduledShiftsRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkPublishScheduledShiftsResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a paginated list of scheduled shifts, with optional filter and sort settings.
      # By default, results are sorted by `start_at` in ascending order.
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::SearchScheduledShiftsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::SearchScheduledShiftsResponse]
      def search_scheduled_shifts(request_options: {}, **params)
        body_prop_names = %i[query limit cursor]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/labor/scheduled-shifts/search",
          body: Square::Labor::Types::SearchScheduledShiftsRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchScheduledShiftsResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a scheduled shift by ID.
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
      # @return [Square::Types::RetrieveScheduledShiftResponse]
      def retrieve_scheduled_shift(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/labor/scheduled-shifts/#{params[:id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveScheduledShiftResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates the draft shift details for a scheduled shift. This endpoint supports
      # sparse updates, so only new, changed, or removed fields are required in the request.
      # You must publish the shift to make updates public.
      #
      # You can make the following updates to `draft_shift_details`:
      # - Change the `location_id`, `job_id`, `start_at`, and `end_at` fields.
      # - Add, change, or clear the `team_member_id` and `notes` fields. To clear these fields,
      # set the value to null.
      # - Change the `is_deleted` field. To delete a scheduled shift, set `is_deleted` to true
      # and then publish the shift.
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::UpdateScheduledShiftRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Square::Types::UpdateScheduledShiftResponse]
      def update_scheduled_shift(request_options: {}, **params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)
        body_prop_names = %i[scheduled_shift]
        body_bag = body_params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/labor/scheduled-shifts/#{params[:id]}",
          body: Square::Labor::Types::UpdateScheduledShiftRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateScheduledShiftResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Publishes a scheduled shift. When a scheduled shift is published, Square keeps the
      # `draft_shift_details` field as is and copies it to the `published_shift_details` field.
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::PublishScheduledShiftRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Square::Types::PublishScheduledShiftResponse]
      def publish_scheduled_shift(request_options: {}, **params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)
        body_prop_names = %i[idempotency_key version scheduled_shift_notification_audience]
        body_bag = body_params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/labor/scheduled-shifts/#{params[:id]}/publish",
          body: Square::Labor::Types::PublishScheduledShiftRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::PublishScheduledShiftResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a new `Timecard`.
      #
      # A `Timecard` represents a complete workday for a single team member.
      # You must provide the following values in your request to this
      # endpoint:
      #
      # - `location_id`
      # - `team_member_id`
      # - `start_at`
      #
      # An attempt to create a new `Timecard` can result in a `BAD_REQUEST` error when:
      # - The `status` of the new `Timecard` is `OPEN` and the team member has another
      # timecard with an `OPEN` status.
      # - The `start_at` date is in the future.
      # - The `start_at` or `end_at` date overlaps another timecard for the same team member.
      # - The `Break` instances are set in the request and a break `start_at`
      # is before the `Timecard.start_at`, a break `end_at` is after
      # the `Timecard.end_at`, or both.
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::CreateTimecardRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::CreateTimecardResponse]
      def create_timecard(request_options: {}, **params)
        body_prop_names = %i[idempotency_key timecard]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/labor/timecards",
          body: Square::Labor::Types::CreateTimecardRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateTimecardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a paginated list of `Timecard` records for a business.
      # The list to be returned can be filtered by:
      # - Location IDs
      # - Team member IDs
      # - Timecard status (`OPEN` or `CLOSED`)
      # - Timecard start
      # - Timecard end
      # - Workday details
      #
      # The list can be sorted by:
      # - `START_AT`
      # - `END_AT`
      # - `CREATED_AT`
      # - `UPDATED_AT`
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::SearchTimecardsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @return [Square::Types::SearchTimecardsResponse]
      def search_timecards(request_options: {}, **params)
        body_prop_names = %i[query limit cursor]
        body_bag = params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/labor/timecards/search",
          body: Square::Labor::Types::SearchTimecardsRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchTimecardsResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Returns a single `Timecard` specified by `id`.
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
      # @return [Square::Types::RetrieveTimecardResponse]
      def retrieve_timecard(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/labor/timecards/#{params[:id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveTimecardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates an existing `Timecard`.
      #
      # When adding a `Break` to a `Timecard`, any earlier `Break` instances in the `Timecard` have
      # the `end_at` property set to a valid RFC-3339 datetime string.
      #
      # When closing a `Timecard`, all `Break` instances in the `Timecard` must be complete with `end_at`
      # set on each `Break`.
      #
      # @param request_options [Hash]
      # @param params [Square::Labor::Types::UpdateTimecardRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :id
      #
      # @return [Square::Types::UpdateTimecardResponse]
      def update_timecard(request_options: {}, **params)
        path_param_names = %i[id]
        body_params = params.except(*path_param_names)
        body_prop_names = %i[timecard]
        body_bag = body_params.slice(*body_prop_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/labor/timecards/#{params[:id]}",
          body: Square::Labor::Types::UpdateTimecardRequest.new(body_bag).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateTimecardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Deletes a `Timecard`.
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
      # @return [Square::Types::DeleteTimecardResponse]
      def delete_timecard(request_options: {}, **params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "DELETE",
          path: "v2/labor/timecards/#{params[:id]}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          Square::Types::DeleteTimecardResponse.load(response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::BreakTypes::Client]
      def break_types
        @break_types ||= Square::Labor::BreakTypes::Client.new(client: @client)
      end

      # @return [Square::EmployeeWages::Client]
      def employee_wages
        @employee_wages ||= Square::Labor::EmployeeWages::Client.new(client: @client)
      end

      # @return [Square::Shifts::Client]
      def shifts
        @shifts ||= Square::Labor::Shifts::Client.new(client: @client)
      end

      # @return [Square::TeamMemberWages::Client]
      def team_member_wages
        @team_member_wages ||= Square::Labor::TeamMemberWages::Client.new(client: @client)
      end

      # @return [Square::WorkweekConfigs::Client]
      def workweek_configs
        @workweek_configs ||= Square::Labor::WorkweekConfigs::Client.new(client: @client)
      end
    end
  end
end
