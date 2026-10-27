# frozen_string_literal: true

module Square
  module Locations
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
      # including those with an inactive status. Locations are listed alphabetically by `name`.
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
      #   client.locations.list
      #
      # @return [Square::Types::ListLocationsResponse]
      def list(request_options: {}, **_params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/locations",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::ListLocationsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a [location](https://developer.squareup.com/docs/locations-api).
      # Creating new locations allows for separate configuration of receipt layouts, item prices,
      # and sales reports. Developers can use locations to separate sales activity through applications
      # that integrate with Square from sales activity elsewhere in a seller's account.
      # Locations created programmatically with the Locations API last forever and
      # are visible to the seller for their own management. Therefore, ensure that
      # each location has a sensible and unique name.
      #
      # @param request_options [Hash]
      # @param params [Square::Locations::Types::CreateLocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.locations.create(location: {
      #     name: "Midtown",
      #     address: {
      #       address_line_1: "1234 Peachtree St. NE",
      #       locality: "Atlanta",
      #       administrative_district_level_1: "GA",
      #       postal_code: "30309"
      #     },
      #     description: "Midtown Atlanta store"
      #   })
      #
      # @return [Square::Types::CreateLocationResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/locations",
          body: Square::Locations::Types::CreateLocationRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateLocationResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves details of a single location. Specify "main"
      # as the location ID to retrieve details of the [main
      # location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
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
      #   client.locations.get(location_id: "location_id")
      #
      # @return [Square::Types::GetLocationResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/locations/#{URI.encode_uri_component(params[:location_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetLocationResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates a [location](https://developer.squareup.com/docs/locations-api).
      #
      # @param request_options [Hash]
      # @param params [Square::Locations::Types::UpdateLocationRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      #
      # @example
      #   client.locations.update(
      #     location_id: "location_id",
      #     location: {
      #       business_hours: {
      #         periods: [{
      #           day_of_week: "FRI",
      #           start_local_time: "07:00",
      #           end_local_time: "18:00"
      #         }, {
      #           day_of_week: "SAT",
      #           start_local_time: "07:00",
      #           end_local_time: "18:00"
      #         }, {
      #           day_of_week: "SUN",
      #           start_local_time: "09:00",
      #           end_local_time: "15:00"
      #         }]
      #       },
      #       description: "Midtown Atlanta store - Open weekends"
      #     }
      #   )
      #
      # @return [Square::Types::UpdateLocationResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Locations::Types::UpdateLocationRequest.new(params).to_h
        non_body_param_names = %w[location_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/locations/#{URI.encode_uri_component(params[:location_id].to_s)}",
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
          (response.body.to_s.empty? ? nil : Square::Types::UpdateLocationResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Links a `checkoutId` to a `checkout_page_url` that customers are
      # directed to in order to provide their payment information using a
      # payment processing workflow hosted on connect.squareup.com.
      #
      #
      # NOTE: The Checkout API has been updated with new features.
      # For more information, see [Checkout API
      # highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights).
      #
      # @param request_options [Hash]
      # @param params [Square::Locations::Types::CreateCheckoutRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :location_id
      #
      # @example
      #   client.locations.checkouts(
      #     location_id: "location_id",
      #     idempotency_key: "86ae1696-b1e3-4328-af6d-f1e04d947ad6",
      #     order: {
      #       order: {
      #         location_id: "location_id",
      #         reference_id: "reference_id",
      #         customer_id: "customer_id",
      #         line_items: [{
      #           name: "Printed T Shirt",
      #           quantity: "2",
      #           applied_taxes: [{
      #             tax_uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3"
      #           }],
      #           applied_discounts: [{
      #             discount_uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4"
      #           }],
      #           base_price_money: {
      #             amount: 1500,
      #             currency: "USD"
      #           }
      #         }, {
      #           name: "Slim Jeans",
      #           quantity: "1",
      #           base_price_money: {
      #             amount: 2500,
      #             currency: "USD"
      #           }
      #         }, {
      #           name: "Woven Sweater",
      #           quantity: "3",
      #           base_price_money: {
      #             amount: 3500,
      #             currency: "USD"
      #           }
      #         }],
      #         taxes: [{
      #           uid: "38ze1696-z1e3-5628-af6d-f1e04d947fg3",
      #           type: "INCLUSIVE",
      #           percentage: "7.75",
      #           scope: "LINE_ITEM"
      #         }],
      #         discounts: [{
      #           uid: "56ae1696-z1e3-9328-af6d-f1e04d947gd4",
      #           type: "FIXED_AMOUNT",
      #           amount_money: {
      #             amount: 100,
      #             currency: "USD"
      #           },
      #           scope: "LINE_ITEM"
      #         }]
      #       },
      #       idempotency_key: "12ae1696-z1e3-4328-af6d-f1e04d947gd4"
      #     },
      #     ask_for_shipping_address: true,
      #     merchant_support_email: "merchant+support@website.com",
      #     pre_populate_buyer_email: "example@email.com",
      #     pre_populate_shipping_address: {
      #       address_line_1: "1455 Market St.",
      #       address_line_2: "Suite 600",
      #       locality: "San Francisco",
      #       administrative_district_level_1: "CA",
      #       postal_code: "94103",
      #       country: "US",
      #       first_name: "Jane",
      #       last_name: "Doe"
      #     },
      #     redirect_url: "https://merchant.website.com/order-confirm",
      #     additional_recipients: [{
      #       location_id: "057P5VYJ4A5X1",
      #       description: "Application fees",
      #       amount_money: {
      #         amount: 60,
      #         currency: "USD"
      #       }
      #     }]
      #   )
      #
      # @return [Square::Types::CreateCheckoutResponse]
      def checkouts(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request_data = Square::Locations::Types::CreateCheckoutRequest.new(params).to_h
        non_body_param_names = %w[location_id]
        body = request_data.except(*non_body_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/locations/#{URI.encode_uri_component(params[:location_id].to_s)}/checkouts",
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
          (response.body.to_s.empty? ? nil : Square::Types::CreateCheckoutResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # @return [Square::CustomAttributeDefinitions::Client]
      def custom_attribute_definitions
        @custom_attribute_definitions ||= Square::Locations::CustomAttributeDefinitions::Client.new(client: @client)
      end

      # @return [Square::CustomAttributes::Client]
      def custom_attributes
        @custom_attributes ||= Square::Locations::CustomAttributes::Client.new(client: @client)
      end

      # @return [Square::Transactions::Client]
      def transactions
        @transactions ||= Square::Locations::Transactions::Client.new(client: @client)
      end
    end
  end
end
