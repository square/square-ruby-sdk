# frozen_string_literal: true

module Square
  module V1Transactions
    module Types
      class V1ListOrdersRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false

        field :order, -> { Square::Types::SortOrder }, optional: true, nullable: true

        field :limit, -> { Integer }, optional: true, nullable: true

        field :batch_token, -> { String }, optional: true, nullable: true
      end
    end
  end
end
