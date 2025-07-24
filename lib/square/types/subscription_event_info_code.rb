# frozen_string_literal: true

module square.rb
# Supported info codes of a subscription event.
  class SubscriptionEventInfoCode

    LOCATION_NOT_ACTIVE = "LOCATION_NOT_ACTIVE"
    LOCATION_CANNOT_ACCEPT_PAYMENT = "LOCATION_CANNOT_ACCEPT_PAYMENT"
    CUSTOMER_DELETED = "CUSTOMER_DELETED"
    CUSTOMER_NO_EMAIL = "CUSTOMER_NO_EMAIL"
    CUSTOMER_NO_NAME = "CUSTOMER_NO_NAME"
    USER_PROVIDED = "USER_PROVIDED"

  end
end