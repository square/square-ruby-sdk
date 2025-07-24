# frozen_string_literal: true
require_relative "../../../requests"
require_relative "../../types/create_catalog_image_request"
require_relative "../../types/create_catalog_image_response"
require_relative "../../../core/file_utilities"
require_relative "../../types/update_catalog_image_request"
require_relative "../../types/update_catalog_image_response"
require "async"
require "async"
require_relative "../../../requests"

module square.rb
  module Catalog
    class ImagesClient
    # @return [square.rb::RequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Catalog::ImagesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Uploads an image file to be represented by a [CatalogImage](entity:CatalogImage)
#  object that can be linked to an existing
#  [CatalogObject](entity:CatalogObject) instance. The resulting `CatalogImage` is
#  unattached to any `CatalogObject` if the `object_id`
#  is not specified.
#  This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests
#  with a JSON part and an image file part in
#  JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
      #
      # @param request [Hash] Request of type square.rb::CreateCatalogImageRequest, as a Hash
      #   * :idempotency_key (String) 
      #   * :object_id (String) 
      #   * :image (Hash)
      #   * :is_primary (Boolean) 
      # @param image_file [String, IO] 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateCatalogImageResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.images.create(image_file: my_file.txt)
      def create(request: nil, image_file: nil, request_options: nil)
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  square.rb::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/images"
end
        square.rb::CreateCatalogImageResponse.from_json(json_object: response.body)
      end
# Uploads a new image file to replace the existing one in the specified
#  [CatalogImage](entity:CatalogImage) object.
#  This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests
#  with a JSON part and an image file part in
#  JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
      #
      # @param image_id [String] The ID of the `CatalogImage` object to update the encapsulated image file.
      # @param request [Hash] Request of type square.rb::UpdateCatalogImageRequest, as a Hash
      #   * :idempotency_key (String) 
      # @param image_file [String, IO] 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateCatalogImageResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.images.update(image_id: "image_id", image_file: my_file.txt)
      def update(image_id:, request: nil, image_file: nil, request_options: nil)
        response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  square.rb::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/images/#{image_id}"
end
        square.rb::UpdateCatalogImageResponse.from_json(json_object: response.body)
      end
    end
    class AsyncImagesClient
    # @return [square.rb::AsyncRequestClient] 
      attr_reader :request_client


      # @param request_client [square.rb::RequestClient] 
      # @return [square.rb::Catalog::AsyncImagesClient]
      def initialize(request_client:)
        @request_client = request_client
      end
# Uploads an image file to be represented by a [CatalogImage](entity:CatalogImage)
#  object that can be linked to an existing
#  [CatalogObject](entity:CatalogObject) instance. The resulting `CatalogImage` is
#  unattached to any `CatalogObject` if the `object_id`
#  is not specified.
#  This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests
#  with a JSON part and an image file part in
#  JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
      #
      # @param request [Hash] Request of type square.rb::CreateCatalogImageRequest, as a Hash
      #   * :idempotency_key (String) 
      #   * :object_id (String) 
      #   * :image (Hash)
      #   * :is_primary (Boolean) 
      # @param image_file [String, IO] 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::CreateCatalogImageResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.images.create(image_file: my_file.txt)
      def create(request: nil, image_file: nil, request_options: nil)
        Async do
          response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  square.rb::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/images"
end
          square.rb::CreateCatalogImageResponse.from_json(json_object: response.body)
        end
      end
# Uploads a new image file to replace the existing one in the specified
#  [CatalogImage](entity:CatalogImage) object.
#  This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests
#  with a JSON part and an image file part in
#  JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
      #
      # @param image_id [String] The ID of the `CatalogImage` object to update the encapsulated image file.
      # @param request [Hash] Request of type square.rb::UpdateCatalogImageRequest, as a Hash
      #   * :idempotency_key (String) 
      # @param image_file [String, IO] 
      # @param request_options [square.rb::RequestOptions] 
      # @return [square.rb::UpdateCatalogImageResponse]
      # @example
#  api = square.rb::Client.new(
#    base_url: "https://api.example.com",
#    environment: square.rb::Environment::PRODUCTION,
#    token: "YOUR_AUTH_TOKEN",
#    version: "Version"
#  )
#  api.catalog.images.update(image_id: "image_id", image_file: my_file.txt)
      def update(image_id:, request: nil, image_file: nil, request_options: nil)
        Async do
          response = @request_client.conn.put do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.token.nil?
    req.headers["Authorization"] = request_options.token
  end
  unless request_options&.version.nil?
    req.headers["Square-Version"] = request_options.version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), request: request, image_file: unless image_file.nil?
  square.rb::FileUtilities.as_faraday_multipart(file_like: image_file)
end }.compact
  req.url "#{@request_client.get_url(request_options: request_options)}/v2/catalog/images/#{image_id}"
end
          square.rb::UpdateCatalogImageResponse.from_json(json_object: response.body)
        end
      end
    end
  end
end