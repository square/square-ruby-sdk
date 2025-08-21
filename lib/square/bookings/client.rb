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
        _query_param_names = %w[limit cursor customer_id team_member_id location_id start_at_min
                                start_at_max]
        _query = params.slice(*_query_param_names)
        params.except(*_query_param_names)

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bookings",
          query: _query
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::ListBookingsResponse.load(_response.body)
        end

        raise _response.body
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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/bookings",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateBookingResponse.load(_response.body)
        end

        raise _response.body
      end

      # Searches for availabilities for booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::SearchAvailabilityResponse]
      def search_availability(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/bookings/availability/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchAvailabilityResponse.load(_response.body)
        end

        raise _response.body
      end

      # Bulk-Retrieves a list of bookings by booking IDs.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::BulkRetrieveBookingsResponse]
      def bulk_retrieve_bookings(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/bookings/bulk-retrieve",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkRetrieveBookingsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a seller's booking profile.
      #
      # @return [Square::Types::GetBusinessBookingProfileResponse]
      def get_business_profile(request_options: {}, **_params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bookings/business-booking-profile"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetBusinessBookingProfileResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a seller's location booking profile.
      #
      # @return [Square::Types::RetrieveLocationBookingProfileResponse]
      def retrieve_location_booking_profile(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bookings/location-booking-profiles/#{params[:location_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::RetrieveLocationBookingProfileResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves one or more team members' booking profiles.
      #
      # @return [Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse]
      def bulk_retrieve_team_member_booking_profiles(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/bookings/team-member-booking-profiles/bulk-retrieve",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves a booking.
      #
      # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
      # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
      #
      # @return [Square::Types::GetBookingResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/bookings/#{params[:booking_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetBookingResponse.load(_response.body)
        end

        raise _response.body
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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/bookings/#{params[:booking_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateBookingResponse.load(_response.body)
        end

        raise _response.body
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
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/bookings/#{params[:booking_id]}/cancel",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CancelBookingResponse.load(_response.body)
        end

        raise _response.body
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def customAttributeDefinitions
        @customAttributeDefinitions ||= Square::CustomAttributeDefinitions::Client.new(client: @raw_client)
      end

      # @return [Square::CustomAttributes::Client]
      def customAttributes
        @customAttributes ||= Square::CustomAttributes::Client.new(client: @raw_client)
      end

      # @return [Square::LocationProfiles::Client]
      def locationProfiles
        @locationProfiles ||= Square::LocationProfiles::Client.new(client: @raw_client)
      end

      # @return [Square::TeamMemberProfiles::Client]
      def teamMemberProfiles
        @teamMemberProfiles ||= Square::TeamMemberProfiles::Client.new(client: @raw_client)
      end
    end
  end
end
