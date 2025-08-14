# frozen_string_literal: true

module Square
    module Types
        # Provides information about the subscription event.
        class SubscriptionEventInfo < Internal::Types::Model
            field :detail, String, optional: true, nullable: false
            field :code, Square::SubscriptionEventInfoCode, optional: true, nullable: false
        end
    end
end
