# frozen_string_literal: true

module Square
  module Bookings
    class Client
      # @return [Square::Bookings::Client]
      def initialize(client:)
        @client = client
      end

      # Retrieve a collection of bookings.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::ListBookingsResponse]
      def list(request_options: {}, **params)
        params = Square::Internal::Types::Utils.symbolize_keys(params)
        _query_param_names = %i[limit cursor customer_id team_member_id location_id start_at_min start_at_max]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        Square::Internal::CursorItemIterator.new(
          cursor_field: :cursor,
          item_field: :bookings,
          initial_cursor: _query[:cursor]
        ) do |next_cursor|
          _query[:cursor] = next_cursor
          _request = Square::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
            method: "GET",
            path: "v2/bookings",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Square::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Square::Types::ListBookingsResponse.load(_response.body)
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
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
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
      #
      # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
      # or *Appointments Premium*.
      #
      # @return [Square::Types::CreateBookingResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/bookings",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CreateBookingResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Searches for availabilities for booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::SearchAvailabilityResponse]
      def search_availability(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/bookings/availability/search",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::SearchAvailabilityResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Bulk-Retrieves a list of bookings by booking IDs.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::BulkRetrieveBookingsResponse]
      def bulk_retrieve_bookings(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/bookings/bulk-retrieve",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkRetrieveBookingsResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a seller's booking profile.
      #
      # @return [Square::Types::GetBusinessBookingProfileResponse]
      def get_business_profile(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/bookings/business-booking-profile"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetBusinessBookingProfileResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a seller's location booking profile.
      #
      # @return [Square::Types::RetrieveLocationBookingProfileResponse]
      def retrieve_location_booking_profile(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/bookings/location-booking-profiles/#{params[:location_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::RetrieveLocationBookingProfileResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves one or more team members' booking profiles.
      #
      # @return [Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse]
      def bulk_retrieve_team_member_booking_profiles(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/bookings/team-member-booking-profiles/bulk-retrieve",
          body: params
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Retrieves a booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::GetBookingResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "GET",
          path: "v2/bookings/#{params[:booking_id]}"
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::GetBookingResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Updates a booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
      #
      # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
      # or *Appointments Premium*.
      #
      # @return [Square::Types::UpdateBookingResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["booking_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "PUT",
          path: "v2/bookings/#{params[:booking_id]}",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::UpdateBookingResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end

      # Cancels an existing booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.
      #
      # For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus*
      # or *Appointments Premium*.
      #
      # @return [Square::Types::CancelBookingResponse]
      def cancel(request_options: {}, **params)
        _path_param_names = ["booking_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::PRODUCTION,
          method: "POST",
          path: "v2/bookings/#{params[:booking_id]}/cancel",
          body: params.except(*_path_param_names)
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Square::Types::CancelBookingResponse.load(_response.body)
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
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
