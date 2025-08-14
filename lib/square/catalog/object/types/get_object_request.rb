
module Square
    module Catalog
        module Object_
            class GetObjectRequest < Internal::Types::Model
                field :object_id, String, optional: false, nullable: false
                field :include_related_objects, Square::Internal::Types::Boolean, optional: true, nullable: false
                field :catalog_version, Integer, optional: true, nullable: false
                field :include_category_path_to_root, Square::Internal::Types::Boolean, optional: true, nullable: false
            end
        end
    end
end
