# frozen_string_literal: true

module Square
    module Types
        # Defines output parameters in a response of the
        # [BulkSwapPlan](api-endpoint:Subscriptions-BulkSwapPlan) endpoint.
        class BulkSwapPlanResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :affected_subscriptions, Integer, optional: true, nullable: false
        end
    end
end
