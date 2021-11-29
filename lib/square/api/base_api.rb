module Square
  # BaseApi.
  class BaseApi
    attr_accessor :config, :http_call_back

    def initialize(config, http_call_back: nil)
      @config = config
      @http_call_back = http_call_back

      @global_headers = {
        'user-agent' => 'Square-Ruby-SDK/16.0.1.20211117',
        'Square-Version' => config.square_version
      }
    end

    def validate_parameters(args)
      args.each do |_name, value|
        raise ArgumentError, "Required parameter #{_name} cannot be nil." if value.nil?
      end
    end

    def execute_request(request, binary: false)
      @http_call_back&.on_before_request(request)

      APIHelper.clean_hash(request.headers)
      request.headers.merge!(@global_headers)
      request.headers.merge!(config.additional_headers) unless config.additional_headers.nil?

      response = if binary
                   config.http_client.execute_as_binary(request)
                 else
                   config.http_client.execute_as_string(request)
                 end
      @http_call_back&.on_after_response(response)

      response
    end
  end
end
