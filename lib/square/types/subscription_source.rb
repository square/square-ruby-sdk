# frozen_string_literal: true

module Square
    module Types
        # The origination details of the subscription.
        class SubscriptionSource < Internal::Types::Model
            field :name, String, optional: true, nullable: false
        end
    end
end
