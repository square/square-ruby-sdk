# frozen_string_literal: true

module Square
  module Catalog
    module Object_
      module Types
        class GetObjectRequest < Internal::Types::Model
          field :object_id_, -> { String }, optional: false, nullable: false, api_name: "object_id"

          field :include_related_objects, -> { Internal::Types::Boolean }, optional: true, nullable: true

          field :catalog_version, -> { Integer }, optional: true, nullable: true

          field :include_category_path_to_root, -> { Internal::Types::Boolean }, optional: true, nullable: true
        end
      end
    end
  end
end
