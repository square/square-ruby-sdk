# frozen_string_literal: true

module Square
  module Disputes
    module Types
      class ListDisputesRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true

        field :states, -> { Square::Types::DisputeState }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true
      end
    end
  end
end
