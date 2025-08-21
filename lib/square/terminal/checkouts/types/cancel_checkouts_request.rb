# frozen_string_literal: true

module Square
  module Terminal
    module Checkouts
      module Types
        class CancelCheckoutsRequest < Internal::Types::Model
          field :checkout_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
