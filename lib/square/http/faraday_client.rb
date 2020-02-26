require 'faraday/http_cache'
require 'faraday_middleware'

module Square
  # An implementation of HttpClient.
  class FaradayClient < HttpClient
    # The constructor.
    def initialize(timeout:, max_retries:, retry_interval:,
                   backoff_factor:, cache: false, verify: true)
      @connection = Faraday.new do |faraday|
        faraday.use Faraday::HttpCache, serializer: Marshal if cache
        faraday.use FaradayMiddleware::FollowRedirects
        faraday.request :multipart
        faraday.request :url_encoded
        faraday.ssl[:ca_file] = Certifi.where
        faraday.ssl[:verify] = verify
        faraday.request :retry, max: max_retries, interval: retry_interval,
                                backoff_factor: backoff_factor
        faraday.adapter Faraday.default_adapter
        faraday.options[:params_encoder] = Faraday::FlatParamsEncoder
        faraday.options[:timeout] = timeout if timeout > 0
      end
    end

    # Method overridden from HttpClient.
    def execute_as_string(http_request)
      response = @connection.send(
        http_request.http_method.downcase,
        http_request.query_url
      ) do |request|
        request.headers = http_request.headers
        request.body = http_request.parameters
      end
      convert_response(response, http_request)
    end

    # Method overridden from HttpClient.
    def execute_as_binary(http_request)
      response = @connection.send(
        http_request.http_method.downcase,
        http_request.query_url
      ) do |request|
        request.headers = http_request.headers
        request.body = http_request.parameters
      end
      convert_response(response, http_request)
    end

    # Method overridden from HttpClient.
    def convert_response(response, http_request)
      HttpResponse.new(response.status, response.reason_phrase,
                       response.headers, response.body, http_request)
    end
  end
end
