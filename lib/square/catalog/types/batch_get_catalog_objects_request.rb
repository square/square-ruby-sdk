# frozen_string_literal: true

module Square
  module Catalog
    module Types
      class BatchGetCatalogObjectsRequest < Internal::Types::Model
        field :object_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false

        field :include_related_objects, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :catalog_version, -> { Integer }, optional: true, nullable: true

        field :include_deleted_objects, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :include_category_path_to_root, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :include_options, -> { Square::Types::IncludeOptions }, optional: true, nullable: false
      end
    end
  end
end
