# frozen_string_literal: true

module Square
  module V1Transactions
    module Types
      class V1UpdateOrderRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false

        field :order_id, -> { String }, optional: false, nullable: false

        field :action, -> { Square::Types::V1UpdateOrderRequestAction }, optional: false, nullable: false

        field :shipped_tracking_number, -> { String }, optional: true, nullable: true

        field :completed_note, -> { String }, optional: true, nullable: true

        field :refunded_note, -> { String }, optional: true, nullable: true

        field :canceled_note, -> { String }, optional: true, nullable: true
      end
    end
  end
end
