# frozen_string_literal: true

module Square
    module Types
        class EventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :id, String, optional: true, nullable: false
            field :deleted, Square::Internal::Types::Boolean, optional: true, nullable: false
            field :object, Square::Internal::Types::Hash[String, Square::Internal::Types::Hash[String, ]], optional: true, nullable: false
        end
    end
end
