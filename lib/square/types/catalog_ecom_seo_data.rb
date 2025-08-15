# frozen_string_literal: true

module Square
  # SEO data for for a seller's Square Online store.
  class CatalogEcomSeoData < Internal::Types::Model
    field :page_title, String, optional: true, nullable: false
    field :page_description, String, optional: true, nullable: false
    field :permalink, String, optional: true, nullable: false

  end
end
