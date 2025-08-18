
module Square
  module Subscriptions
    module Types
      class ChangeBillingAnchorDateRequest < Internal::Types::Model
        field :subscription_id, String, optional: false, nullable: false
        field :monthly_billing_anchor_date, Integer, optional: true, nullable: false
        field :effective_date, String, optional: true, nullable: false

      end
    end
  end
end
