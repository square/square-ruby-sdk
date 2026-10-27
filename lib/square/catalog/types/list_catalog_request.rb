# frozen_string_literal: true

module Square
  module Catalog
    module Types
      class ListCatalogRequest < Internal::Types::Model
        field :cursor, -> { String }, optional: true, nullable: true

        field :types, -> { String }, optional: true, nullable: true

        field :catalog_version, -> { Integer }, optional: true, nullable: true
      end
    end
  end
end
