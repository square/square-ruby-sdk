
module Square
  module Labor
    module Types
      class SearchTimecardsRequest < Internal::Types::Model
        field :query, Square::Types::TimecardQuery, optional: true, nullable: false
        field :limit, Integer, optional: true, nullable: false
        field :cursor, String, optional: true, nullable: false

      end
    end
  end
end
