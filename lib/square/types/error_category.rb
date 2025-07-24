# frozen_string_literal: true

module square.rb
# Indicates which high-level category of error has occurred during a
#  request to the Connect API.
  class ErrorCategory

    API_ERROR = "API_ERROR"
    AUTHENTICATION_ERROR = "AUTHENTICATION_ERROR"
    INVALID_REQUEST_ERROR = "INVALID_REQUEST_ERROR"
    RATE_LIMIT_ERROR = "RATE_LIMIT_ERROR"
    PAYMENT_METHOD_ERROR = "PAYMENT_METHOD_ERROR"
    REFUND_ERROR = "REFUND_ERROR"
    MERCHANT_SUBSCRIPTION_ERROR = "MERCHANT_SUBSCRIPTION_ERROR"
    EXTERNAL_VENDOR_ERROR = "EXTERNAL_VENDOR_ERROR"

  end
end