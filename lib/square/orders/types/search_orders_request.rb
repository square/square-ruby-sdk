# frozen_string_literal: true

module Square
  module Orders
    module Types
      class SearchOrdersRequest < Internal::Types::Model
        field :location_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :cursor, -> { String }, optional: true, nullable: false
        field :query, -> { Square::Types::SearchOrdersQuery }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :return_entries, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
