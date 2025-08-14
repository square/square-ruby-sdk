# frozen_string_literal: true

module Square
    module Types
        # Represents information about the application used to generate a change.
        class SourceApplication < Internal::Types::Model
            field :product, Square::Product, optional: true, nullable: false
            field :application_id, String, optional: true, nullable: false
            field :name, String, optional: true, nullable: false
        end
    end
end
