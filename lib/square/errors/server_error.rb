module Square
  module Errors
    class ServerError < ApiError
    end

    class ServiceUnavailableError < ApiError
    end
  end
end
