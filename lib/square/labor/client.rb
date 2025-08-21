# frozen_string_literal: true

module Square
  module Labor
    class Client
      # @return [Square::Labor::Client]
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
      # @return [Square::Types::CreateScheduledShiftResponse]
      def create_scheduled_shift(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/labor/scheduled-shifts",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateScheduledShiftResponse.load(_response.body)
        end

        raise _response.body
      end

      # Publishes 1 - 100 scheduled shifts. This endpoint takes a map of individual publish
      # requests and returns a map of responses. When a scheduled shift is published, Square keeps
      # the `draft_shift_details` field as is and copies it to the `published_shift_details` field.
      #
      # The minimum `start_at` and maximum `end_at` timestamps of all shifts in a
      # `BulkPublishScheduledShifts` request must fall within a two-week period.
      #
      # @return [Square::Types::BulkPublishScheduledShiftsResponse]
      def bulk_publish_scheduled_shifts(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/labor/scheduled-shifts/bulk-publish",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkPublishScheduledShiftsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns a paginated list of scheduled shifts, with optional filter and sort settings.
      # By default, results are sorted by `start_at` in ascending order.
      #
      # @return [Square::Types::SearchScheduledShiftsResponse]
      def search_scheduled_shifts(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/labor/scheduled-shifts/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchScheduledShiftsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a scheduled shift by ID.
      #
      # @return [Square::Types::RetrieveScheduledShiftResponse]
      def retrieve_scheduled_shift(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/labor/scheduled-shifts/#{params[:id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveScheduledShiftResponse.load(_response.body)
        end

        raise _response.body
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
      # @return [Square::Types::UpdateScheduledShiftResponse]
      def update_scheduled_shift(request_options: {}, **params)
        _path_param_names = ["id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/labor/scheduled-shifts/#{params[:id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateScheduledShiftResponse.load(_response.body)
        end

        raise _response.body
      end

      # Publishes a scheduled shift. When a scheduled shift is published, Square keeps the
      # `draft_shift_details` field as is and copies it to the `published_shift_details` field.
      #
      # @return [Square::Types::PublishScheduledShiftResponse]
      def publish_scheduled_shift(request_options: {}, **params)
        _path_param_names = ["id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/labor/scheduled-shifts/#{params[:id]}/publish",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::PublishScheduledShiftResponse.load(_response.body)
        end

        raise _response.body
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
      # @return [Square::Types::CreateTimecardResponse]
      def create_timecard(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/labor/timecards",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateTimecardResponse.load(_response.body)
        end

        raise _response.body
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
      # @return [Square::Types::SearchTimecardsResponse]
      def search_timecards(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/labor/timecards/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchTimecardsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Returns a single `Timecard` specified by `id`.
      #
      # @return [Square::Types::RetrieveTimecardResponse]
      def retrieve_timecard(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/labor/timecards/#{params[:id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveTimecardResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates an existing `Timecard`.
      #
      # When adding a `Break` to a `Timecard`, any earlier `Break` instances in the `Timecard` have
      # the `end_at` property set to a valid RFC-3339 datetime string.
      #
      # When closing a `Timecard`, all `Break` instances in the `Timecard` must be complete with `end_at`
      # set on each `Break`.
      #
      # @return [Square::Types::UpdateTimecardResponse]
      def update_timecard(request_options: {}, **params)
        _path_param_names = ["id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/labor/timecards/#{params[:id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateTimecardResponse.load(_response.body)
        end

        raise _response.body
      end

      # Deletes a `Timecard`.
      #
      # @return [Square::Types::DeleteTimecardResponse]
      def delete_timecard(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "DELETE",
          path: "v2/labor/timecards/#{params[:id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::DeleteTimecardResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::Mobile::Client]
      def mobile
        @mobile ||= Square::Mobile::Client.new(client: @raw_client)
      end

      # @return [Square::OAuth::Client]
      def oAuth
        @oAuth ||= Square::OAuth::Client.new(client: @raw_client)
      end

      # @return [Square::V1Transactions::Client]
      def v1Transactions
        @v1Transactions ||= Square::V1Transactions::Client.new(client: @raw_client)
      end

      # @return [Square::ApplePay::Client]
      def applePay
        @applePay ||= Square::ApplePay::Client.new(client: @raw_client)
      end

      # @return [Square::BankAccounts::Client]
      def bankAccounts
        @bankAccounts ||= Square::BankAccounts::Client.new(client: @raw_client)
      end

      # @return [Square::Bookings::Client]
      def bookings
        @bookings ||= Square::Bookings::Client.new(client: @raw_client)
      end

      # @return [Square::Cards::Client]
      def cards
        @cards ||= Square::Cards::Client.new(client: @raw_client)
      end

      # @return [Square::Catalog::Client]
      def catalog
        @catalog ||= Square::Catalog::Client.new(client: @raw_client)
      end

      # @return [Square::Customers::Client]
      def customers
        @customers ||= Square::Customers::Client.new(client: @raw_client)
      end

      # @return [Square::Devices::Client]
      def devices
        @devices ||= Square::Devices::Client.new(client: @raw_client)
      end

      # @return [Square::Disputes::Client]
      def disputes
        @disputes ||= Square::Disputes::Client.new(client: @raw_client)
      end

      # @return [Square::Employees::Client]
      def employees
        @employees ||= Square::Employees::Client.new(client: @raw_client)
      end

      # @return [Square::Events::Client]
      def events
        @events ||= Square::Events::Client.new(client: @raw_client)
      end

      # @return [Square::GiftCards::Client]
      def giftCards
        @giftCards ||= Square::GiftCards::Client.new(client: @raw_client)
      end

      # @return [Square::Inventory::Client]
      def inventory
        @inventory ||= Square::Inventory::Client.new(client: @raw_client)
      end

      # @return [Square::Invoices::Client]
      def invoices
        @invoices ||= Square::Invoices::Client.new(client: @raw_client)
      end

      # @return [Square::Labor::Client]
      def labor
        @labor ||= Square::Labor::Client.new(client: @raw_client)
      end

      # @return [Square::Locations::Client]
      def locations
        @locations ||= Square::Locations::Client.new(client: @raw_client)
      end

      # @return [Square::Loyalty::Client]
      def loyalty
        @loyalty ||= Square::Loyalty::Client.new(client: @raw_client)
      end

      # @return [Square::Merchants::Client]
      def merchants
        @merchants ||= Square::Merchants::Client.new(client: @raw_client)
      end

      # @return [Square::Checkout::Client]
      def checkout
        @checkout ||= Square::Checkout::Client.new(client: @raw_client)
      end

      # @return [Square::Orders::Client]
      def orders
        @orders ||= Square::Orders::Client.new(client: @raw_client)
      end

      # @return [Square::Payments::Client]
      def payments
        @payments ||= Square::Payments::Client.new(client: @raw_client)
      end

      # @return [Square::Payouts::Client]
      def payouts
        @payouts ||= Square::Payouts::Client.new(client: @raw_client)
      end

      # @return [Square::Refunds::Client]
      def refunds
        @refunds ||= Square::Refunds::Client.new(client: @raw_client)
      end

      # @return [Square::Sites::Client]
      def sites
        @sites ||= Square::Sites::Client.new(client: @raw_client)
      end

      # @return [Square::Snippets::Client]
      def snippets
        @snippets ||= Square::Snippets::Client.new(client: @raw_client)
      end

      # @return [Square::Subscriptions::Client]
      def subscriptions
        @subscriptions ||= Square::Subscriptions::Client.new(client: @raw_client)
      end

      # @return [Square::TeamMembers::Client]
      def teamMembers
        @teamMembers ||= Square::TeamMembers::Client.new(client: @raw_client)
      end

      # @return [Square::Team::Client]
      def team
        @team ||= Square::Team::Client.new(client: @raw_client)
      end

      # @return [Square::Terminal::Client]
      def terminal
        @terminal ||= Square::Terminal::Client.new(client: @raw_client)
      end

      # @return [Square::Vendors::Client]
      def vendors
        @vendors ||= Square::Vendors::Client.new(client: @raw_client)
      end

      # @return [Square::CashDrawers::Client]
      def cashDrawers
        @cashDrawers ||= Square::CashDrawers::Client.new(client: @raw_client)
      end

      # @return [Square::Webhooks::Client]
      def webhooks
        @webhooks ||= Square::Webhooks::Client.new(client: @raw_client)
      end
    end
  end
end
