module Square
  # All configuration including auth info and base URI for the API access
  # are configured in this class.
  class Configuration
    # The attribute readers for properties.
    attr_reader :http_client, :http_client_instance, :timeout, :max_retries, :retry_interval,
                :backoff_factor, :retry_statuses, :retry_methods, :environment, :custom_url,
                :square_version, :access_token, :user_agent_detail

    def additional_headers
      @additional_headers.clone
    end

    class << self
      attr_reader :environments
    end

    def initialize(http_client_instance: nil, timeout: 60, max_retries: 0,
                   retry_interval: 1, backoff_factor: 2,
                   retry_statuses: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524],
                   retry_methods: %i[get put], environment: 'production',
                   custom_url: 'https://connect.squareup.com',
                   square_version: '2021-12-15', access_token: '',
                   user_agent_detail: '', additional_headers: {})
      # The Http Client passed from the sdk user for making requests
      @http_client_instance = http_client_instance

      # The value to use for connection timeout
      @timeout = timeout

      # The number of times to retry an endpoint call if it fails
      @max_retries = max_retries

      # Pause in seconds between retries
      @retry_interval = retry_interval

      # The amount to multiply each successive retry's interval amount
      # by in order to provide backoff
      @backoff_factor = backoff_factor

      # A list of HTTP statuses to retry
      @retry_statuses = retry_statuses

      # A list of HTTP methods to retry
      @retry_methods = retry_methods

      # Current API environment
      @environment = String(environment)

      # Sets the base URL requests are made to. Defaults to `https://connect.squareup.com`
      @custom_url = custom_url

      # Square Connect API versions
      @square_version = square_version

      # The OAuth 2.0 Access Token to use for API requests.
      @access_token = access_token

      # Additional headers to add to each API request
      @additional_headers = additional_headers.clone

      # The Http Client to use for making requests.
      @http_client = create_http_client
    end

    def clone_with(http_client_instance: nil, timeout: nil, max_retries: nil,
                   retry_interval: nil, backoff_factor: nil,
                   retry_statuses: nil, retry_methods: nil, environment: nil,
                   custom_url: nil, square_version: nil, access_token: nil,
                   user_agent_detail: nil, additional_headers: nil)
      http_client_instance ||= self.http_client_instance
      timeout ||= self.timeout
      max_retries ||= self.max_retries
      retry_interval ||= self.retry_interval
      backoff_factor ||= self.backoff_factor
      retry_statuses ||= self.retry_statuses
      retry_methods ||= self.retry_methods
      environment ||= self.environment
      custom_url ||= self.custom_url
      square_version ||= self.square_version
      access_token ||= self.access_token
      user_agent_detail ||= self.user_agent_detail
      additional_headers ||= self.additional_headers

      Configuration.new(http_client_instance: http_client_instance,
                        timeout: timeout, max_retries: max_retries,
                        retry_interval: retry_interval,
                        backoff_factor: backoff_factor,
                        retry_statuses: retry_statuses,
                        retry_methods: retry_methods, environment: environment,
                        custom_url: custom_url, square_version: square_version,
                        access_token: access_token,
                        user_agent_detail: user_agent_detail,
                        additional_headers: additional_headers)
    end

    def create_http_client
      FaradayClient.new(timeout: timeout, max_retries: max_retries,
                        retry_interval: retry_interval,
                        backoff_factor: backoff_factor,
                        retry_statuses: retry_statuses,
                        retry_methods: retry_methods,
                        http_client_instance: http_client_instance)
    end

    # All the environments the SDK can run in.
    ENVIRONMENTS = {
      'production' => {
        'default' => 'https://connect.squareup.com'
      },
      'sandbox' => {
        'default' => 'https://connect.squareupsandbox.com'
      },
      'custom' => {
        'default' => '{custom_url}'
      }
    }.freeze

    # Generates the appropriate base URI for the environment and the server.
    # @param [Configuration::Server] The server enum for which the base URI is
    # required.
    # @return [String] The base URI.
    def get_base_uri(server = 'default')
      parameters = {
        'custom_url' => { 'value' => custom_url, 'encode' => false }
      }
      APIHelper.append_url_with_template_parameters(
        ENVIRONMENTS[environment][server], parameters
      )
    end
  end
end
