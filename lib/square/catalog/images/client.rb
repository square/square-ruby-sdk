# frozen_string_literal: true

module Square
  module Catalog
    module Images
      class Client
        # @param client [Square::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Uploads an image file to be represented by a [CatalogImage](entity:CatalogImage) object that can be linked to
        # an existing
        # [CatalogObject](entity:CatalogObject) instance. The resulting `CatalogImage` is unattached to any
        # `CatalogObject` if the `object_id`
        # is not specified.
        #
        # This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image
        # file part in
        # JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.catalog.images.create
        #
        # @return [Square::Types::CreateCatalogImageResponse]
        def create(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          unless params[:request].nil?
            body.add(
              name: "request",
              value: params[:request],
              content_type: "application/json; charset=utf-8"
            )
          end
          if params[:image_file]
            body.add_file(
              name: "image_file",
              file: params[:image_file],
              content_type: "image/jpeg"
            )
          end

          request = Square::Internal::Multipart::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "v2/catalog/images",
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
            (response.body.to_s.empty? ? nil : Square::Types::CreateCatalogImageResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Uploads a new image file to replace the existing one in the specified [CatalogImage](entity:CatalogImage)
        # object.
        #
        # This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image
        # file part in
        # JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
        #
        # @param request_options [Hash]
        # @param params [void]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :image_id
        #
        # @example
        #   client.catalog.images.update(image_id: "image_id")
        #
        # @return [Square::Types::UpdateCatalogImageResponse]
        def update(request_options: {}, **params)
          params = Square::Internal::Types::Utils.normalize_keys(params)
          body = Internal::Multipart::FormData.new

          unless params[:request].nil?
            body.add(
              name: "request",
              value: params[:request],
              content_type: "application/json; charset=utf-8"
            )
          end
          if params[:image_file]
            body.add_file(
              name: "image_file",
              file: params[:image_file],
              content_type: "image/jpeg"
            )
          end

          request = Square::Internal::Multipart::Request.new(
            base_url: request_options[:base_url],
            method: "PUT",
            path: "v2/catalog/images/#{URI.encode_uri_component(params[:image_id].to_s)}",
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
            (response.body.to_s.empty? ? nil : Square::Types::UpdateCatalogImageResponse.load(response.body))
          else
            error_class = Square::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
