module Square
  # BaseApi.
  class BaseApi
    include CoreLibrary
    attr_accessor :config, :http_call_back

    def self.user_agent
      'Square-Ruby-SDK/42.2.0.20250521 ({api-version}) {engine}/{engine-version} ({os-info}) {detail}'
    end

    def self.user_agent_parameters
      {
        '{engine}' => { 'value' => RUBY_ENGINE, 'encode' => false },
        '{engine-version}' => { 'value' => RUBY_ENGINE_VERSION, 'encode' => false },
        '{os-info}' => { 'value' => RUBY_PLATFORM, 'encode' => false }
      }
    end

    # Initialization constructor.
    # @param [GlobalConfiguration] global_configuration The instance of GlobalConfiguration.
    def initialize(global_configuration)
      @global_configuration = global_configuration
      @config = @global_configuration.client_configuration
      @http_call_back = @config.http_callback
      @api_call = ApiCall.new(@global_configuration)
    end

    # Creates a new builder for the Api Call instance.
    # @return [ApiCall] The instance of ApiCall.
    def new_api_call_builder
      @api_call.new_builder
    end

    # Creates a new instance of the request builder.
    # @param [String] http_method The HTTP method to use in the request.
    # @param [String] path The endpoint path to use in the request.
    # @param [String] server The server to extract the base uri for the request.
    # @return [RequestBuilder] The instance of RequestBuilder.
    def new_request_builder(http_method, path, server)
      RequestBuilder.new
                    .http_method(http_method)
                    .path(path)
                    .server(server)
    end

    # Creates a new instance of the response handler.
    # @return [ResponseHandler] The instance of ResponseHandler.
    def new_response_handler
      ResponseHandler.new
    end

    # Creates a new instance of the parameter.
    # @param [String|optional] key The key of the parameter.
    # @param [Object] value The value of the parameter.
    # @return [Parameter] The instance of Parameter.
    def new_parameter(value, key: nil)
      Parameter.new
               .key(key)
               .value(value)
    end
  end
end
