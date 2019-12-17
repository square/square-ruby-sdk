module Square
  # An interface for the methods that an HTTP Client must implement.
  #
  # This class should not be instantiated but should be used as a base class
  # for HTTP Client classes.
  class HttpClient
    # Execute an HttpRequest when the response is expected to be a string.
    # @param [HttpRequest] The HttpRequest to be executed.
    def execute_as_string(_http_request)
      raise NotImplementedError, 'This method needs
        to be implemented in a child class.'
    end

    # Execute an HttpRequest when the response is expected to be binary.
    # @param [HttpRequest] The HttpRequest to be executed.
    def execute_as_binary(_http_request)
      raise NotImplementedError, 'This method needs
        to be implemented in a child class.'
    end

    # Converts the HTTP Response from the client to an HttpResponse object.
    # @param [Dynamic] The response object received from the client.
    def convert_response(_response)
      raise NotImplementedError, 'This method needs
        to be implemented in a child class.'
    end

    # Get a GET HttpRequest object.
    # @param [String] The URL to send the request to.
    # @param [Hash, Optional] The headers for the HTTP Request.
    def get(query_url,
            headers: {})
      HttpRequest.new(HttpMethodEnum::GET,
                      query_url,
                      headers: headers)
    end

    # Get a HEAD HttpRequest object.
    # @param [String] The URL to send the request to.
    # @param [Hash, Optional] The headers for the HTTP Request.
    def head(query_url,
             headers: {})
      HttpRequest.new(HttpMethodEnum::HEAD,
                      query_url,
                      headers: headers)
    end

    # Get a POST HttpRequest object.
    # @param [String] The URL to send the request to.
    # @param [Hash, Optional] The headers for the HTTP Request.
    # @param [Hash, Optional] The parameters for the HTTP Request.
    def post(query_url,
             headers: {},
             parameters: {})
      HttpRequest.new(HttpMethodEnum::POST,
                      query_url,
                      headers: headers,
                      parameters: parameters)
    end

    # Get a PUT HttpRequest object.
    # @param [String] The URL to send the request to.
    # @param [Hash, Optional] The headers for the HTTP Request.
    # @param [Hash, Optional] The parameters for the HTTP Request.
    def put(query_url,
            headers: {},
            parameters: {})
      HttpRequest.new(HttpMethodEnum::PUT,
                      query_url,
                      headers: headers,
                      parameters: parameters)
    end

    # Get a PATCH HttpRequest object.
    # @param [String] The URL to send the request to.
    # @param [Hash, Optional] The headers for the HTTP Request.
    # @param [Hash, Optional] The parameters for the HTTP Request.
    def patch(query_url,
              headers: {},
              parameters: {})
      HttpRequest.new(HttpMethodEnum::PATCH,
                      query_url,
                      headers: headers,
                      parameters: parameters)
    end

    # Get a DELETE HttpRequest object.
    # @param [String] The URL to send the request to.
    # @param [Hash, Optional] The headers for the HTTP Request.
    def delete(query_url,
               headers: {},
               parameters: {})
      HttpRequest.new(HttpMethodEnum::DELETE,
                      query_url,
                      headers: headers,
                      parameters: parameters)
    end
  end
end
