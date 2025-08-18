
module Square
  module Disputes
    module Types
      class ListDisputesRequest < Internal::Types::Model
        field :cursor, String, optional: true, nullable: false
        field :states, Square::Types::DisputeState, optional: true, nullable: false
        field :location_id, String, optional: true, nullable: false

      end
    end
  end
end
