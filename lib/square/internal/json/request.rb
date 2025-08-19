# frozen_string_literal: true

module Square
  module Internal
    module JSON
      # @api private
      class Request < Square::Internal::Http::BaseRequest
        attr_reader :body

        # @param base_url [String] The base URL for the request
        # @param path [String] The path for the request
        # @param method [Symbol] The HTTP method for the request (:get, :post, etc.)
        # @param headers [Hash] Additional headers for the request (optional)
        # @param query [Hash] Query parameters for the request (optional)
        # @param body [Object, nil] The JSON request body (optional)
        # @param request_options [Square::RequestOptions, Hash{Symbol=>Object}, nil]
        def initialize(base_url:, path:, method:, headers: {}, query: {}, body: nil, request_options: {})
          super(base_url:, path:, method:, headers:, query:, request_options:)

          @body = body
        end

        # @return [Hash] The encoded HTTP request headers.
        def encode_headers
          {
            "Content-Type" => "application/json",
            "Accept" => "application/json"
          }.merge(@headers)
        end

        # @return [String, nil] The encoded HTTP request body.
        def encode_body
          if @body.nil?
            nil
          else
            puts "json.request.encode_body: @body.to_h.class: #{@body.to_h.class}"
            puts "json.request.encode_body: @body.to_h: #{@body.to_h}"
            puts "----------------------------------------------------"
            ::JSON.generate(@body.to_h)
          end
          # @body.nil? ? nil : ::JSON.generate(@body)
        end
      end
    end
  end
end 