# frozen_string_literal: true

module Square
  module V1Transactions
    module Types
      class V1RetrieveOrderRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false
        field :order_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
