
module Square
  module V1Transactions
    module Types
      class V1ListOrdersRequest < Internal::Types::Model
        field :location_id, -> { String }, optional: false, nullable: false
        field :order, -> { Square::Types::SortOrder }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :batch_token, -> { String }, optional: true, nullable: false

      end
    end
  end
end
