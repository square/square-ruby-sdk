# frozen_string_literal: true

module Square
  module Types
    class CatalogInfoResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :limits, Square::Types::CatalogInfoResponseLimits, optional: true, nullable: false
      field :standard_unit_description_group, Square::Types::StandardUnitDescriptionGroup, optional: true, nullable: false

    end
  end
end
