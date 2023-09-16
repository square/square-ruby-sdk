module Square
  class FaradayClient < CoreLibrary::FaradayClient
    # Method overridden from HttpClient.
    # @param [HttpRequest] http_request The HttpRequest to be executed.
    def execute(http_request)
      response = @connection.send(
        http_request.http_method.downcase,
        http_request.query_url
      ) do |request|
        request.headers = http_request.headers.map { |k, v| [k.to_s, v.to_s] }
        request.options.context ||= {}
        request.options.context.merge!(http_request.context)
        unless (http_request.http_method == HttpMethod::GET || http_request.http_method == HttpMethod::DELETE) && http_request.parameters.empty?
          request.body = http_request.parameters
        end
      end
      convert_response(response, http_request)
    end
  end
end