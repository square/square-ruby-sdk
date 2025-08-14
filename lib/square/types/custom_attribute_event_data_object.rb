# frozen_string_literal: true

module Square
    module Types
        class CustomAttributeEventDataObject < Internal::Types::Model
            field :custom_attribute, Square::CustomAttribute, optional: true, nullable: false
        end
    end
end
