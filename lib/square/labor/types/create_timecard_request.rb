
module Square
  module Labor
    module Types
      class CreateTimecardRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: true, nullable: false
        field :timecard, -> { Square::Types::Timecard }, optional: false, nullable: false

      end
    end
  end
end
