module Square
  module Errors
    class ClientError < ApiError
    end

    class UnauthorizedError < ClientError
    end

    class ForbiddenError < ClientError
    end

    class NotFoundError < ClientError
    end
  end
end
