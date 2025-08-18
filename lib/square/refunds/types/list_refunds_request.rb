
module Square
  module Refunds
    module Types
      class ListRefundsRequest < Internal::Types::Model
        field :begin_time, -> { String }, optional: true, nullable: false
        field :end_time, -> { String }, optional: true, nullable: false
        field :sort_order, -> { String }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :location_id, -> { String }, optional: true, nullable: false
        field :status, -> { String }, optional: true, nullable: false
        field :source_type, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :updated_at_begin_time, -> { String }, optional: true, nullable: false
        field :updated_at_end_time, -> { String }, optional: true, nullable: false
        field :sort_field, -> { Square::Types::ListPaymentRefundsRequestSortField }, optional: true, nullable: false

      end
    end
  end
end
