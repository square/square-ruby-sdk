# frozen_string_literal: true

module Square
  module Bookings
    module Types
      class ListBookingsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: true

        field :cursor, -> { String }, optional: true, nullable: true

        field :customer_id, -> { String }, optional: true, nullable: true

        field :team_member_id, -> { String }, optional: true, nullable: true

        field :location_id, -> { String }, optional: true, nullable: true

        field :start_at_min, -> { String }, optional: true, nullable: true

        field :start_at_max, -> { String }, optional: true, nullable: true
      end
    end
  end
end
