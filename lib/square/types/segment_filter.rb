# frozen_string_literal: true

module Square
    module Types
        # A query filter to search for buyer-accessible appointment segments by.
        class SegmentFilter < Internal::Types::Model
            field :service_variation_id, String, optional: false, nullable: false
            field :team_member_id_filter, Square::FilterValue, optional: true, nullable: false
        end
    end
end
