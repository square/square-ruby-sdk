# frozen_string_literal: true

module Square
  module Types
    # Defines output parameters in a response of the
    # [BulkSwapPlan](api-endpoint:Subscriptions-BulkSwapPlan) endpoint.
    class BulkSwapPlanResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :affected_subscriptions, -> { Integer }, optional: true, nullable: false

    end
  end
end
