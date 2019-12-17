module Square
  # HttpCallBack allows defining callables for pre and post API calls.
  class HttpCallBack
    # A controller will call this method before making an HTTP Request.
    # @param [HttpRequest] The HttpRequest object which the HttpClient
    # will execute.
    def on_before_request(_http_request)
      raise NotImplementedError, 'This method needs
        to be implemented in a child class.'
    end

    # A controller will call this method after making an HTTP Request.
    # @param [HttpResponse] The HttpReponse of the API call.
    def on_after_response(_http_response)
      raise NotImplementedError, 'This method needs
        to be implemented in a child class.'
    end
  end
end
