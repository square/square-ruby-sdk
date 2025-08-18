
module Square
  module Catalog
    module Types
      class ListCatalogRequest < Internal::Types::Model
        field :cursor, String, optional: true, nullable: false
        field :types, String, optional: true, nullable: false
        field :catalog_version, Integer, optional: true, nullable: false

      end
    end
  end
end
