# frozen_string_literal: true

module Square
    module Types
        # An image file to use in Square catalogs. It can be associated with
        # `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, and `CatalogModifierList` objects.
        # Only the images on items and item variations are exposed in Dashboard.
        # Only the first image on an item is displayed in Square Point of Sale (SPOS).
        # Images on items and variations are displayed through Square Online Store.
        # Images on other object types are for use by 3rd party application developers.
        class CatalogImage < Internal::Types::Model
            field :name, String, optional: true, nullable: false
            field :url, String, optional: true, nullable: false
            field :caption, String, optional: true, nullable: false
            field :photo_studio_order_id, String, optional: true, nullable: false
        end
    end
end
