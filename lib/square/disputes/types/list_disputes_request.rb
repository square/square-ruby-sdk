
module Square
  module Disputes
    class ListDisputesRequest
      field :cursor, String, optional: true, nullable: false
      field :states, Square::DisputeState, optional: true, nullable: false
      field :location_id, String, optional: true, nullable: false

    end
  end
end
