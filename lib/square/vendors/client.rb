# frozen_string_literal: true

module Square
  module Vendors
    class Client
      # @param client [Square::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Creates one or more [Vendor](entity:Vendor) objects to represent suppliers to a seller.
      #
      # @param request_options [Hash]
      # @param params [Square::Vendors::Types::BatchCreateVendorsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.vendors.batch_create(vendors: {
      #     "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe" => {
      #       name: "Joe's Fresh Seafood",
      #       address: {
      #         address_line_1: "505 Electric Ave",
      #         address_line_2: "Suite 600",
      #         locality: "New York",
      #         administrative_district_level_1: "NY",
      #         postal_code: "10003",
      #         country: "US"
      #       },
      #       contacts: [{
      #         name: "Joe Burrow",
      #         email_address: "joe@joesfreshseafood.com",
      #         phone_number: "1-212-555-4250",
      #         ordinal: 1
      #       }],
      #       account_number: "4025391",
      #       note: "a vendor"
      #     }
      #   })
      #
      # @return [Square::Types::BatchCreateVendorsResponse]
      def batch_create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/vendors/bulk-create",
          body: Square::Vendors::Types::BatchCreateVendorsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchCreateVendorsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves one or more vendors of specified [Vendor](entity:Vendor) IDs.
      #
      # @param request_options [Hash]
      # @param params [Square::Vendors::Types::BatchGetVendorsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.vendors.batch_get(vendor_ids: ["INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4"])
      #
      # @return [Square::Types::BatchGetVendorsResponse]
      def batch_get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/vendors/bulk-retrieve",
          body: Square::Vendors::Types::BatchGetVendorsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchGetVendorsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates one or more of existing [Vendor](entity:Vendor) objects as suppliers to a seller.
      #
      # @param request_options [Hash]
      # @param params [Square::Vendors::Types::BatchUpdateVendorsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.vendors.batch_update(vendors: {
      #     FMCYHBWT1TPL8MFH52PBMEN92A: {
      #       vendor: {}
      #     },
      #     INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4: {
      #       vendor: {}
      #     }
      #   })
      #
      # @return [Square::Types::BatchUpdateVendorsResponse]
      def batch_update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/vendors/bulk-update",
          body: Square::Vendors::Types::BatchUpdateVendorsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::BatchUpdateVendorsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Creates a single [Vendor](entity:Vendor) object to represent a supplier to a seller.
      #
      # @param request_options [Hash]
      # @param params [Square::Vendors::Types::CreateVendorRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.vendors.create(
      #     idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      #     vendor: {
      #       name: "Joe's Fresh Seafood",
      #       address: {
      #         address_line_1: "505 Electric Ave",
      #         address_line_2: "Suite 600",
      #         locality: "New York",
      #         administrative_district_level_1: "NY",
      #         postal_code: "10003",
      #         country: "US"
      #       },
      #       contacts: [{
      #         name: "Joe Burrow",
      #         email_address: "joe@joesfreshseafood.com",
      #         phone_number: "1-212-555-4250",
      #         ordinal: 1
      #       }],
      #       account_number: "4025391",
      #       note: "a vendor"
      #     }
      #   )
      #
      # @return [Square::Types::CreateVendorResponse]
      def create(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/vendors/create",
          body: Square::Vendors::Types::CreateVendorRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::CreateVendorResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Searches for vendors using a filter against supported [Vendor](entity:Vendor) properties and a supported sorter.
      #
      # @param request_options [Hash]
      # @param params [Square::Vendors::Types::SearchVendorsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.vendors.search
      #
      # @return [Square::Types::SearchVendorsResponse]
      def search(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "v2/vendors/search",
          body: Square::Vendors::Types::SearchVendorsRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::SearchVendorsResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Retrieves the vendor of a specified [Vendor](entity:Vendor) ID.
      #
      # @param request_options [Hash]
      # @param params [Hash]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :vendor_id
      #
      # @example
      #   client.vendors.get(vendor_id: "vendor_id")
      #
      # @return [Square::Types::GetVendorResponse]
      def get(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "GET",
          path: "v2/vendors/#{URI.encode_uri_component(params[:vendor_id].to_s)}",
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::GetVendorResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end

      # Updates an existing [Vendor](entity:Vendor) object as a supplier to a seller.
      #
      # @param request_options [Hash]
      # @param params [Square::Types::UpdateVendorRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [String] :vendor_id
      #
      # @example
      #   client.vendors.update(
      #     vendor_id: "vendor_id",
      #     idempotency_key: "8fc6a5b0-9fe8-4b46-b46b-2ef95793abbe",
      #     vendor: {
      #       id: "INV_V_JDKYHBWT1D4F8MFH63DBMEN8Y4",
      #       name: "Jack's Chicken Shack",
      #       version: 1,
      #       status: "ACTIVE"
      #     }
      #   )
      #
      # @return [Square::Types::UpdateVendorResponse]
      def update(request_options: {}, **params)
        params = Square::Internal::Types::Utils.normalize_keys(params)
        path_param_names = %i[vendor_id]
        body_params = params.except(*path_param_names)

        request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "PUT",
          path: "v2/vendors/#{URI.encode_uri_component(params[:vendor_id].to_s)}",
          body: Square::Types::UpdateVendorRequest.new(body_params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Square::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          (response.body.to_s.empty? ? nil : Square::Types::UpdateVendorResponse.load(response.body))
        else
          error_class = Square::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
