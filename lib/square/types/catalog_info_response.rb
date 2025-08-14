# frozen_string_literal: true

module Square
    module Types
        class CatalogInfoResponse < Internal::Types::Model
            field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :limits, Square::CatalogInfoResponseLimits, optional: true, nullable: false
            field :standard_unit_description_group, Square::StandardUnitDescriptionGroup, optional: true, nullable: false
        end
    end
end
