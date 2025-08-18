
module Square
  module Terminal
    module Checkouts
      module Types
        class GetCheckoutsRequest < Internal::Types::Model
          field :checkout_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
