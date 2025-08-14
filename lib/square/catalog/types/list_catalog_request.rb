
module Square
    module Catalog
        class ListCatalogRequest < Square::Internal::Types::Model
            field :cursor, String, optional: true, nullable: false
            field :types, String, optional: true, nullable: false
            field :catalog_version, Integer, optional: true, nullable: false
        end
    end
end
