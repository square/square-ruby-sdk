
module Square
  module Catalog
    module Types
      class SearchCatalogObjectsRequest < Internal::Types::Model
        field :cursor, String, optional: true, nullable: false
        field :object_types, Internal::Types::Array[Square::Types::CatalogObjectType], optional: true, nullable: false
        field :include_deleted_objects, Internal::Types::Boolean, optional: true, nullable: false
        field :include_related_objects, Internal::Types::Boolean, optional: true, nullable: false
        field :begin_time, String, optional: true, nullable: false
        field :query, Square::Types::CatalogQuery, optional: true, nullable: false
        field :limit, Integer, optional: true, nullable: false
        field :include_category_path_to_root, Internal::Types::Boolean, optional: true, nullable: false

      end
    end
  end
end
