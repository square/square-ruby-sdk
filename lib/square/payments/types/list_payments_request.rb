# frozen_string_literal: true

module Square
  module Payments
    module Types
      class ListPaymentsRequest < Internal::Types::Model
        field :begin_time, -> { String }, optional: true, nullable: true

        field :end_time, -> { String }, optional: true, nullable: true

        field :sort_order, -> { String }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true

        field :total, -> { Integer }, optional: true, nullable: true

        field :last_4, -> { String }, optional: true, nullable: true

        field :card_brand, -> { String }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :is_offline_payment, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :offline_begin_time, -> { String }, optional: true, nullable: true

        field :offline_end_time, -> { String }, optional: true, nullable: true

        field :updated_at_begin_time, -> { String }, optional: true, nullable: true

        field :updated_at_end_time, -> { String }, optional: true, nullable: true

        field :sort_field, -> { Square::Types::ListPaymentsRequestSortField }, optional: true, nullable: true
      end
    end
  end
end
