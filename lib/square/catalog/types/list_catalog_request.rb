
module Square
  module Catalog
    class ListCatalogRequest
      field :cursor, String, optional: true, nullable: false
      field :types, String, optional: true, nullable: false
      field :catalog_version, Integer, optional: true, nullable: false

    end
  end
end
