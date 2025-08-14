
module Square
    module GiftCards
        module Activities
            class ListActivitiesRequest
                field :gift_card_id, String, optional: true, nullable: false
                field :type, String, optional: true, nullable: false
                field :location_id, String, optional: true, nullable: false
                field :begin_time, String, optional: true, nullable: false
                field :end_time, String, optional: true, nullable: false
                field :limit, Integer, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
                field :sort_order, String, optional: true, nullable: false
            end
        end
    end
end
