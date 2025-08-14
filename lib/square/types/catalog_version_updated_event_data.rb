# frozen_string_literal: true

module Square
    module Types
        class CatalogVersionUpdatedEventData < Square::Internal::Types::Model
            field :type, String, optional: true, nullable: false
            field :object, Square::CatalogVersionUpdatedEventObject, optional: true, nullable: false
        end
    end
end
