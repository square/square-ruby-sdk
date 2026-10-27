# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    class OrderCreated < Internal::Types::Model
      field :order_id, -> { String }, optional: true, nullable: true

      field :version, -> { Integer }, optional: true, nullable: false

      field :location_id, -> { String }, optional: true, nullable: true

      field :state, -> { Square::Types::OrderState }, optional: true, nullable: false

      field :created_at, -> { String }, optional: true, nullable: false
    end
  end
end
