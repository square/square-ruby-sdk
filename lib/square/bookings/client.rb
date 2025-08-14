
module Square
    module Bookings
        class Client
            # @option client [Square::Internal::Http::RawClient]
            #
            # @return [Square::Bookings::Client]
            def initialize(client)
                @client = client
            end

            # Retrieve a collection of bookings.
            # 
            # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
            # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
            #
            # @return [Square::ListBookingsResponse]
            def list(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::ListBookingsResponse.load(_response.body)

                else
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
            # @return [Square::CreateBookingResponse]
            def create(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CreateBookingResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Searches for availabilities for booking.
            # 
            # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
            # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
            #
            # @return [Square::SearchAvailabilityResponse]
            def search_availability(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::SearchAvailabilityResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Bulk-Retrieves a list of bookings by booking IDs.
            # 
            # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
            # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
            #
            # @return [Square::BulkRetrieveBookingsResponse]
            def bulk_retrieve_bookings(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::BulkRetrieveBookingsResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves a seller's booking profile.
            #
            # @return [Square::GetBusinessBookingProfileResponse]
            def get_business_profile(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetBusinessBookingProfileResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves a seller's location booking profile.
            #
            # @return [Square::RetrieveLocationBookingProfileResponse]
            def retrieve_location_booking_profile(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::RetrieveLocationBookingProfileResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves one or more team members' booking profiles.
            #
            # @return [Square::BulkRetrieveTeamMemberBookingProfilesResponse]
            def bulk_retrieve_team_member_booking_profiles(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::BulkRetrieveTeamMemberBookingProfilesResponse.load(_response.body)

                else
                    raise _response.body
            end

            # Retrieves a booking.
            # 
            # To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope.
            # To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
            #
            # @return [Square::GetBookingResponse]
            def get(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::GetBookingResponse.load(_response.body)

                else
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
            # @return [Square::UpdateBookingResponse]
            def update(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::UpdateBookingResponse.load(_response.body)

                else
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
            # @return [Square::CancelBookingResponse]
            def cancel(request_options: {}, **params)
                _request = params

                _response = @client.send(_request)
                if _response.code >= "200" && _response.code < "300"
                    return Square::Types::CancelBookingResponse.load(_response.body)

                else
                    raise _response.body
            end
        end
    end
end
