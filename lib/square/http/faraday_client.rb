require 'faraday/http_cache'
require 'faraday/retry'
require 'faraday/multipart'
require 'faraday/follow_redirects'
require 'faraday/gzip'

module Square
  # An implementation of HttpClient.
  class FaradayClient < HttpClient
    # The attribute readers for properties.
    attr_reader :connection

    # The constructor.
    def initialize(timeout:, max_retries:, retry_interval:,
                   backoff_factor:, retry_statuses:, retry_methods:,
                   connection: nil, cache: false, verify: true)
      @connection = if connection.nil?
                      create_connection(timeout: timeout, max_retries: max_retries,
                                        retry_interval: retry_interval, backoff_factor: backoff_factor,
                                        retry_statuses: retry_statuses, retry_methods: retry_methods,
                                        cache: cache, verify: verify)
                    else
                      connection
                    end
    end

    # Method to initialize connection.
    def create_connection(timeout:, max_retries:, retry_interval:,
                          backoff_factor:, retry_statuses:, retry_methods:,
                          cache: false, verify: true)
      Faraday.new do |faraday|
        faraday.use Faraday::HttpCache, serializer: Marshal if cache
        faraday.use Faraday::FollowRedirects::Middleware
        faraday.request :gzip
        faraday.request :multipart
        faraday.request :url_encoded
        faraday.ssl[:ca_file] = Certifi.where
        faraday.ssl[:verify] = verify
        faraday.request :retry, max: max_retries, interval: retry_interval,
                                backoff_factor: backoff_factor,
                                retry_statuses: retry_statuses,
                                methods: retry_methods,
                                retry_if: proc { |env, _exc|
                                            env.request.context['forced_retry'] ||= false
                                          }
        faraday.adapter Faraday.default_adapter
        faraday.options[:params_encoder] = Faraday::FlatParamsEncoder
        faraday.options[:timeout] = timeout if timeout.positive?
      end
    end

    # Method overridden from HttpClient.
    def execute_as_string(http_request)
      response = @connection.send(
        http_request.http_method.downcase,
        http_request.query_url
      ) do |request|
        request.headers = http_request.headers.map { |k, v| [k.to_s, v.to_s] }
        request.options.context ||= {}
        request.options.context.merge!(http_request.context)
        unless http_request.http_method == HttpMethodEnum::GET &&
               http_request.parameters.empty?
          request.body = http_request.parameters
        end
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
        request.options.context ||= {}
        request.options.context.merge!(http_request.context)
        unless http_request.http_method == HttpMethodEnum::GET &&
               http_request.parameters.empty?
          request.body = http_request.parameters
        end
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
