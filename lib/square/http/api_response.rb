module Square
  # Http response received.
  class ApiResponse
    attr_reader(:status_code, :reason_phrase, :headers, :raw_body, :request,
                :data, :errors, :body, :cursor)

    # The constructor
    # @param [HttpResponse] The original, raw response from the api.
    # @param [Object] The data field specified for the response.
    # @param [Array<String>] Any errors returned by the server.
    def initialize(http_response,
                   data: nil,
                   errors: nil)
      @status_code = http_response.status_code
      @reason_phrase = http_response.reason_phrase
      @headers = http_response.headers
      @raw_body = http_response.raw_body
      @request = http_response.request
      @errors = errors

      if data.is_a? Hash
        if data.keys.any?
          @body = Struct.new(*data.keys) do
            define_method(:to_s) { http_response.raw_body }
          end.new(*data.values)

          @cursor = data.fetch(:cursor, nil)
          data.reject! { |k| %i[cursor errors].include?(k) }
          @data = Struct.new(*data.keys).new(*data.values) if data.keys.any?
        end
      else
        @data = data
        @body = data
      end
    end

    # returns true if status_code is between 200-300
    def success?
      status_code >= 200 && status_code < 300
    end

    # returns true if status_code is between 400-600
    def error?
      status_code >= 400 && status_code < 600
    end
  end
end
