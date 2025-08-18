
module Square
  module Subscriptions
    module Types
      class ResumeSubscriptionRequest < Internal::Types::Model
        field :subscription_id, -> { String }, optional: false, nullable: false
        field :resume_effective_date, -> { String }, optional: true, nullable: false
        field :resume_change_timing, -> { Square::Types::ChangeTiming }, optional: true, nullable: false

      end
    end
  end
end
