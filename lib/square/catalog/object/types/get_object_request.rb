
module Square
    module Catalog
        module Object_
            class GetObjectRequest
                field :object_id, String, optional: false, nullable: false
                field :include_related_objects, Internal::Types::Boolean, optional: true, nullable: false
                field :catalog_version, Integer, optional: true, nullable: false
                field :include_category_path_to_root, Internal::Types::Boolean, optional: true, nullable: false
            end
        end
    end
end
