
module Square
    module Labor
        module WorkweekConfigs
            class ListWorkweekConfigsRequest < Internal::Types::Model
                field :limit, Integer, optional: true, nullable: false
                field :cursor, String, optional: true, nullable: false
            end
        end
    end
end
