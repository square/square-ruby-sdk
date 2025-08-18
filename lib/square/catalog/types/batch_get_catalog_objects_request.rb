
module Square
  module Catalog
    module Types
      class BatchGetCatalogObjectsRequest < Internal::Types::Model
        field :object_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :include_related_objects, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :catalog_version, -> { Integer }, optional: true, nullable: false
        field :include_deleted_objects, -> { Internal::Types::Boolean }, optional: true, nullable: false
        field :include_category_path_to_root, -> { Internal::Types::Boolean }, optional: true, nullable: false

      end
    end
  end
end
