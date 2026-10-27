# frozen_string_literal: true

module Square
  module Bookings
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieve a collection of bookings.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the
      # OAuth scope.
      #
      # Returns a `Square::Internal::CursorItemIterator` that yields each `Square::Types::Booking` in the `bookings`
      # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Square::Types::ListBookingsResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Integer, nil] :limit
      # @option params [String, nil] :cursor
      # @option params [String, nil] :customer_id
      # @option params [String, nil] :team_member_id
      # @option params [String, nil] :location_id
      # @option params [String, nil] :start_at_min
      # @option params [String, nil] :start_at_max
      #
      # @example
      #   client.bookings.list(
      #     limit: 1,
      #     cursor: "cursor",
      #     customer_id: "customer_id",
      #     team_member_id: "team_member_id",
      #     location_id: "location_id",
      #     start_at_min: "start_at_min",
      #     start_at_max: "start_at_max"
      #   )
      #
      # @return [Square::Internal::CursorItemIterator]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        query_params = {}
        query_params["limit"] = params[:limit] if params.key?(:limit)
        query_params["cursor"] = params[:cursor] if params.key?(:cursor)
        query_params["customer_id"] = params[:customer_id] if params.key?(:customer_id)
        query_params["team_member_id"] = params[:team_member_id] if params.key?(:team_member_id)
        query_params["location_id"] = params[:location_id] if params.key?(:location_id)
        query_params["start_at_min"] = params[:start_at_min] if params.key?(:start_at_min)
        query_params["start_at_max"] = params[:start_at_max] if params.key?(:start_at_max)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :bookings,
          initial_cursor: query_params["cursor"]
        ) do |next_cursor|
          query_params["cursor"] = next_cursor
          request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "GET",
            path: "v2/bookings",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = (response.body.to_s.empty? ? nil : Square::Types::ListBookingsResponse.load(response.body))
            [parsed_response, response]
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end

      # Creates a booking.
      #
      # The required input must include the following:
      # - `Booking.location_id`
      # - `Booking.start_at`
      # - `Booking.AppointmentSegment.team_member_id`
      # - `Booking.AppointmentSegment.service_variation_id`
      # - `Booking.AppointmentSegment.service_variation_version`
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for
      # the OAuth scope.
      #
      # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to
      # *Appointments Plus*
      # or *Appointments Premium*.
      #
      # @param request_options [Hash]
      # @param params [Square::Bookings::Types::CreateBookingRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.bookings.create(booking: {})
      #
      # @return [Square::Types::CreateBookingResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bookings",
          body: Square::Bookings::Types::CreateBookingRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateBookingResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Searches for availabilities for booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the
      # OAuth scope.
      #
      # @param request_options [Hash]
      # @param params [Square::Bookings::Types::SearchAvailabilityRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.bookings.search_availability(query: {
      #     filter: {
      #       start_at_range: {}
      #     }
      #   })
      #
      # @return [Square::Types::SearchAvailabilityResponse]
      def search_availability(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bookings/availability/search",
          body: Square::Bookings::Types::SearchAvailabilityRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchAvailabilityResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Bulk-Retrieves a list of bookings by booking IDs.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the
      # OAuth scope.
      #
      # @param request_options [Hash]
      # @param params [Square::Bookings::Types::BulkRetrieveBookingsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.bookings.bulk_retrieve_bookings(booking_ids: ["booking_ids"])
      #
      # @return [Square::Types::BulkRetrieveBookingsResponse]
      def bulk_retrieve_bookings(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bookings/bulk-retrieve",
          body: Square::Bookings::Types::BulkRetrieveBookingsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkRetrieveBookingsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a seller's booking profile.
      #
      # @param request_options [Hash]
      # @param _params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.bookings.get_business_profile
      #
      # @return [Square::Types::GetBusinessBookingProfileResponse]
      def get_business_profile(request_options: {}, **_params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/bookings/business-booking-profile",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetBusinessBookingProfileResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a seller's location booking profile.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      #
      # @example
      #   client.bookings.retrieve_location_booking_profile(location_id: "location_id")
      #
      # @return [Square::Types::RetrieveLocationBookingProfileResponse]
      def retrieve_location_booking_profile(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/bookings/location-booking-profiles/#{URI.encode_uri_component(params[:location_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::RetrieveLocationBookingProfileResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves one or more team members' booking profiles.
      #
      # @param request_options [Hash]
      # @param params [Square::Bookings::Types::BulkRetrieveTeamMemberBookingProfilesRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.bookings.bulk_retrieve_team_member_booking_profiles(team_member_ids: ["team_member_ids"])
      #
      # @return [Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse]
      def bulk_retrieve_team_member_booking_profiles(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bookings/team-member-booking-profiles/bulk-retrieve",
          body: Square::Bookings::Types::BulkRetrieveTeamMemberBookingProfilesRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves a booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the
      # OAuth scope.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :booking_id
      #
      # @example
      #   client.bookings.get(booking_id: "booking_id")
      #
      # @return [Square::Types::GetBookingResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetBookingResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for
      # the OAuth scope.
      #
      # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to
      # *Appointments Plus*
      # or *Appointments Premium*.
      #
      # @param request_options [Hash]
      # @param params [Square::Bookings::Types::UpdateBookingRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :booking_id
      #
      # @example
      #   client.bookings.update(
      #     booking_id: "booking_id",
      #     booking: {}
      #   )
      #
      # @return [Square::Types::UpdateBookingResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Bookings::Types::UpdateBookingRequest.new(params).to_h
        non_body_param_names = %w[booking_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::UpdateBookingResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Cancels an existing booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for
      # the OAuth scope.
      #
      # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to
      # *Appointments Plus*
      # or *Appointments Premium*.
      #
      # @param request_options [Hash]
      # @param params [Square::Bookings::Types::CancelBookingRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :booking_id
      #
      # @example
      #   client.bookings.cancel(booking_id: "booking_id")
      #
      # @return [Square::Types::CancelBookingResponse]
      def cancel(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Bookings::Types::CancelBookingRequest.new(params).to_h
        non_body_param_names = %w[booking_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/bookings/#{URI.encode_uri_component(params[:booking_id].to_s)}/cancel",
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
          (response.body.to_s.empty? ? nil : Square::Types::CancelBookingResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def custom_attribute_definitions
        @custom_attribute_definitions ||= Square::Bookings::CustomAttributeDefinitions::Client.new(client: @client)
      end

      # @return [Square::CustomAttributes::Client]
      def custom_attributes
        @custom_attributes ||= Square::Bookings::CustomAttributes::Client.new(client: @client)
      end

      # @return [Square::LocationProfiles::Client]
      def location_profiles
        @location_profiles ||= Square::Bookings::LocationProfiles::Client.new(client: @client)
      end

      # @return [Square::TeamMemberProfiles::Client]
      def team_member_profiles
        @team_member_profiles ||= Square::Bookings::TeamMemberProfiles::Client.new(client: @client)
      end
    end
  end
end
