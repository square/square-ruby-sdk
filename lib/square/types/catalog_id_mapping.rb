# frozen_string_literal: true

module Square
    module Types
        # A mapping between a temporary client-supplied ID and a permanent server-generated ID.
        # 
        # When calling [UpsertCatalogObject](api-endpoint:Catalog-UpsertCatalogObject) or
        # [BatchUpsertCatalogObjects](api-endpoint:Catalog-BatchUpsertCatalogObjects) to
        # create a [CatalogObject](entity:CatalogObject) instance, you can supply
        # a temporary ID for the to-be-created object, especially when the object is to be referenced
        # elsewhere in the same request body. This temporary ID can be any string unique within
        # the call, but must be prefixed by "#".
        # 
        # After the request is submitted and the object created, a permanent server-generated ID is assigned
        # to the new object. The permanent ID is unique across the Square catalog.
        class CatalogIdMapping < Internal::Types::Model
            field :client_object_id, String, optional: true, nullable: false
            field :object_id, String, optional: true, nullable: false
        end
    end
end
