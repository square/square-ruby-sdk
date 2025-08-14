
module Square
    module Disputes
        module Evidence
            class ListEvidenceRequest < Internal::Types::Model
                field :dispute_id, String, optional: false, nullable: false
                field :cursor, String, optional: true, nullable: false
            end
        end
    end
end
