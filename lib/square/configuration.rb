module Square
  # All configuration including auth info and base URI for the API access
  # are configured in this class.
  class Configuration < CoreLibrary::HttpClientConfiguration
    def access_token
      @bearer_auth_credentials.access_token
    end

    # The attribute readers for properties.
    attr_reader :environment, :custom_url, :bearer_auth_credentials,
                :square_version, :user_agent_detail

    def additional_headers
      @additional_headers.clone
    end

    class << self
      attr_reader :environments
    end

    def initialize(
      connection: nil, adapter: :net_http_persistent, timeout: 60,
      max_retries: 0, retry_interval: 1, backoff_factor: 2,
      retry_statuses: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524],
      retry_methods: %i[get put], http_callback: nil, environment: 'production',
      custom_url: 'https://connect.squareup.com', access_token: nil,
      bearer_auth_credentials: nil, square_version: '2025-05-21',
      user_agent_detail: '', additional_headers: {}
    )

      super connection: connection, adapter: adapter, timeout: timeout,
            max_retries: max_retries, retry_interval: retry_interval,
            backoff_factor: backoff_factor, retry_statuses: retry_statuses,
            retry_methods: retry_methods, http_callback: http_callback

      # Current API environment
      @environment = String(environment)

      # Sets the base URL requests are made to. Defaults to `https://connect.squareup.com`
      @custom_url = custom_url

      # The OAuth 2.0 Access Token to use for API requests.
      @access_token = access_token

      # Square Connect API versions
      @square_version = square_version

      # Additional headers to add to each API request
      @additional_headers = additional_headers.clone

      # Initializing OAuth 2 Bearer token credentials with the provided auth parameters
      @bearer_auth_credentials = create_auth_credentials_object(
        access_token, bearer_auth_credentials
      )

      # The Http Client to use for making requests.
      set_http_client CoreLibrary::FaradayClient.new(self)

      # User agent detail, to be appended with user-agent header.
      @user_agent_detail = get_user_agent(user_agent_detail)
    end

    def clone_with(connection: nil, adapter: nil, timeout: nil,
                   max_retries: nil, retry_interval: nil, backoff_factor: nil,
                   retry_statuses: nil, retry_methods: nil, http_callback: nil,
                   environment: nil, custom_url: nil, access_token: nil,
                   bearer_auth_credentials: nil, square_version: nil,
                   user_agent_detail: nil, additional_headers: nil)
      connection ||= self.connection
      adapter ||= self.adapter
      timeout ||= self.timeout
      max_retries ||= self.max_retries
      retry_interval ||= self.retry_interval
      backoff_factor ||= self.backoff_factor
      retry_statuses ||= self.retry_statuses
      retry_methods ||= self.retry_methods
      http_callback ||= self.http_callback
      environment ||= self.environment
      custom_url ||= self.custom_url
      square_version ||= self.square_version
      user_agent_detail ||= self.user_agent_detail
      additional_headers ||= self.additional_headers
      bearer_auth_credentials = create_auth_credentials_object(
        access_token, bearer_auth_credentials || self.bearer_auth_credentials
      )

      Configuration.new(connection: connection, adapter: adapter,
                        timeout: timeout, max_retries: max_retries,
                        retry_interval: retry_interval,
                        backoff_factor: backoff_factor,
                        retry_statuses: retry_statuses,
                        retry_methods: retry_methods,
                        http_callback: http_callback, environment: environment,
                        custom_url: custom_url, square_version: square_version,
                        user_agent_detail: user_agent_detail,
                        additional_headers: additional_headers,
                        bearer_auth_credentials: bearer_auth_credentials)
    end

    def get_user_agent(user_agent_detail)
      raise ArgumentError, 'The length of user-agent detail should not exceed 128 characters.' unless
        user_agent_detail.length < 128

      user_agent_detail
    end

    def create_auth_credentials_object(access_token, bearer_auth_credentials)
      return bearer_auth_credentials if access_token.nil?

      warn('The \'access_token\' params are deprecated. Use \'bearer_auth_cred'\
           'entials\' param instead.')

      unless bearer_auth_credentials.nil?
        return bearer_auth_credentials.clone_with(
          access_token: access_token
        )
      end

      BearerAuthCredentials.new(access_token: access_token)
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
    # @param [Configuration::Server] server The server enum for which the base URI is
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
