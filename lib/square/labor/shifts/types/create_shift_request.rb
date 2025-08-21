# frozen_string_literal: true

module Square
  module Labor
    module Shifts
      module Types
        class CreateShiftRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: true, nullable: false
          field :shift, -> { Square::Types::Shift }, optional: false, nullable: false
        end
      end
    end
  end
end
