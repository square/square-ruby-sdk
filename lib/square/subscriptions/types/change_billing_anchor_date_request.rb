# frozen_string_literal: true

module Square
  module Subscriptions
    module Types
      class ChangeBillingAnchorDateRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false

        field :monthly_billing_anchor_date, -> { Integer }, optional: true, nullable: true

        field :effective_date, -> { String }, optional: true, nullable: true
      end
    end
  end
end
