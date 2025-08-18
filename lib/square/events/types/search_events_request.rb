
module Square
  module Events
    module Types
      class SearchEventsRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: false
        field :limit, -> { Integer }, optional: true, nullable: false
        field :query, -> { Square::Types::SearchEventsQuery }, optional: true, nullable: false

      end
    end
  end
end
