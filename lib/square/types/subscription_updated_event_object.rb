# frozen_string_literal: true

module Square
    module Types
        class SubscriptionUpdatedEventObject < Square::Internal::Types::Model
            field :subscription, Square::Subscription, optional: true, nullable: false
        end
    end
end
