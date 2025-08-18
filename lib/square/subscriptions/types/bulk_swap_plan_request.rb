
module Square
  module Subscriptions
    module Types
      class BulkSwapPlanRequest < Internal::Types::Model
        field :new_plan_variation_id, -> { String }, optional: false, nullable: false
        field :old_plan_variation_id, -> { String }, optional: false, nullable: false
        field :location_id, -> { String }, optional: false, nullable: false

      end
    end
  end
end
