# frozen_string_literal: true

module Square
  module Refunds
    module Types
      class ListRefundsRequest < Internal::Types::Model
        field :begin_time, -> { String }, optional: true, nullable: true

        field :end_time, -> { String }, optional: true, nullable: true

        field :sort_order, -> { String }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true

        field :status, -> { String }, optional: true, nullable: true

        field :source_type, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :updated_at_begin_time, -> { String }, optional: true, nullable: true

        field :updated_at_end_time, -> { String }, optional: true, nullable: true

        field :sort_field, -> { Square::Types::ListPaymentRefundsRequestSortField }, optional: true, nullable: true
      end
    end
  end
end
