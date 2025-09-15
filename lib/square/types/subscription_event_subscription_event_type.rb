# frozen_string_literal: true

module Square
  module Types
    module SubscriptionEventSubscriptionEventType
      extend Square::Internal::Types::Enum

      START_SUBSCRIPTION = "START_SUBSCRIPTION"
      PLAN_CHANGE = "PLAN_CHANGE"
      STOP_SUBSCRIPTION = "STOP_SUBSCRIPTION"
      DEACTIVATE_SUBSCRIPTION = "DEACTIVATE_SUBSCRIPTION"
      RESUME_SUBSCRIPTION = "RESUME_SUBSCRIPTION"
      PAUSE_SUBSCRIPTION = "PAUSE_SUBSCRIPTION"
      BILLING_ANCHOR_DATE_CHANGED = "BILLING_ANCHOR_DATE_CHANGED"
    end
  end
end
