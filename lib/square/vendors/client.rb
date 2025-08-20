# frozen_string_literal: true

module Square
  module Vendors
    class Client
      # @return [Square::Vendors::Client]
      def initialize(client:)
        @client = client
      end

      # Creates one or more [Vendor](entity:Vendor) objects to represent suppliers to a seller.
      #
      # @return [Square::Types::BatchCreateVendorsResponse]
      def batch_create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/vendors/bulk-create",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchCreateVendorsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves one or more vendors of specified [Vendor](entity:Vendor) IDs.
      #
      # @return [Square::Types::BatchGetVendorsResponse]
      def batch_get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/vendors/bulk-retrieve",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchGetVendorsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates one or more of existing [Vendor](entity:Vendor) objects as suppliers to a seller.
      #
      # @return [Square::Types::BatchUpdateVendorsResponse]
      def batch_update(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/vendors/bulk-update",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::BatchUpdateVendorsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Creates a single [Vendor](entity:Vendor) object to represent a supplier to a seller.
      #
      # @return [Square::Types::CreateVendorResponse]
      def create(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/vendors/create",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::CreateVendorResponse.load(_response.body)
        end

        raise _response.body
      end

      # Searches for vendors using a filter against supported [Vendor](entity:Vendor) properties and a supported sorter.
      #
      # @return [Square::Types::SearchVendorsResponse]
      def search(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "POST",
          path: "v2/vendors/search",
          body: params
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::SearchVendorsResponse.load(_response.body)
        end

        raise _response.body
      end

      # Retrieves the vendor of a specified [Vendor](entity:Vendor) ID.
      #
      # @return [Square::Types::GetVendorResponse]
      def get(request_options: {}, **params)
        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "GET",
          path: "v2/vendors/#{params[:vendor_id]}"
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::GetVendorResponse.load(_response.body)
        end

        raise _response.body
      end

      # Updates an existing [Vendor](entity:Vendor) object as a supplier to a seller.
      #
      # @return [Square::Types::UpdateVendorResponse]
      def update(request_options: {}, **params)
        _path_param_names = ["vendor_id"]

        _request = Square::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Square::Environment::SANDBOX,
          method: "PUT",
          path: "v2/vendors/#{params[:vendor_id]}",
          body: params.except(*_path_param_names)
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Square::Types::UpdateVendorResponse.load(_response.body)
        end

        raise _response.body
      end
    end
  end
end
