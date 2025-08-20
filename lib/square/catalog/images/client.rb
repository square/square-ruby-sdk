# frozen_string_literal: true

module Square
  module Catalog
    module Images
      class Client
        # @return [Square::Catalog::Images::Client]
        def initialize(client:)
          @client = client
        end

        # Uploads an image file to be represented by a [CatalogImage](entity:CatalogImage) object that can be linked to an existing
        # [CatalogObject](entity:CatalogObject) instance. The resulting `CatalogImage` is unattached to any `CatalogObject` if the `object_id`
        # is not specified.
        #
        # This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in
        # JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
        #
        # @return [Square::Types::CreateCatalogImageResponse]
        def create(request_options: {}, **params)
          body = Internal::Multipart::FormData.new

          if params[:request]
            body.add(
              name: "request",
              value: params[:request],
              content_type: "application/json; charset=utf-8"
            )
          end
          body.add_part(params[:image_file].to_form_data_part(name: "image_file")) if params[:image_file]

          _request = Square::Internal::Multipart::Request.new(
            method: POST,
            path: "v2/catalog/images",
            body: body
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::CreateCatalogImageResponse.load(_response.body)
          end

          raise _response.body
        end

        # Uploads a new image file to replace the existing one in the specified [CatalogImage](entity:CatalogImage) object.
        #
        # This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in
        # JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
        #
        # @return [Square::Types::UpdateCatalogImageResponse]
        def update(request_options: {}, **params)
          body = Internal::Multipart::FormData.new

          if params[:request]
            body.add(
              name: "request",
              value: params[:request],
              content_type: "application/json; charset=utf-8"
            )
          end
          body.add_part(params[:image_file].to_form_data_part(name: "image_file")) if params[:image_file]

          _request = Square::Internal::Multipart::Request.new(
            method: PUT,
            path: "v2/catalog/images/#{params[:image_id]}",
            body: body
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Square::Types::UpdateCatalogImageResponse.load(_response.body)
          end

          raise _response.body
        end
      end
    end
  end
end
