# frozen_string_literal: true

module Square
    module Types
        class LaborTimecardDeletedEventData < Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :deleted, Internal::Types::Boolean, optional: true, nullable: false
        end
    end
end
