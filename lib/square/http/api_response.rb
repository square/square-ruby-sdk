module Square
  # Http response received.
  class ApiResponse < CoreLibrary::ApiResponse
    attr_reader :body, :cursor

    # The constructor
    # @param [HttpResponse] http_response The original, raw response from the api.
    # @param [Object] data The data field specified for the response.
    # @param [Array<String>] errors Any errors returned by the server.
    def initialize(http_response,
                   data: nil,
                   errors: nil)
      super
      @errors = errors

      if (data.is_a? Hash) && data.keys.any?
        @body = Struct.new(*data.keys) do
          define_method(:to_s) { http_response.raw_body }
        end.new(*data.values)

        @cursor = data.fetch(:cursor, nil)
        data.reject! { |k| %i[cursor errors].include?(k) }
        @data = data.keys.any? ? Struct.new(*data.keys).new(*data.values) : nil
      else
        @data = data
        @body = data
      end
    end

    # The factory method for creating the API Response instance of the SDK from its parent instance in the core lirbary.
    # @param [CoreLibrary::HttpResponse] parent_instance The Api Response instance from core library.
    def self.create(parent_instance)
      ApiResponse.new(CoreLibrary::HttpResponse
                           .new(parent_instance.status_code, parent_instance.reason_phrase,
                                parent_instance.headers, parent_instance.raw_body, parent_instance.request),
                      data: parent_instance.data, errors: parent_instance.errors)
    end
  end
end
