
module Square
  module Payouts
    class ListPayoutsRequest < Internal::Types::Model
      field :location_id, String, optional: true, nullable: false
      field :status, Square::PayoutStatus, optional: true, nullable: false
      field :begin_time, String, optional: true, nullable: false
      field :end_time, String, optional: true, nullable: false
      field :sort_order, Square::SortOrder, optional: true, nullable: false
      field :cursor, String, optional: true, nullable: false
      field :limit, Integer, optional: true, nullable: false

    end
  end
end
