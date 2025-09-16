# frozen_string_literal: true

module Square
  module Types
    # A reference to a Catalog object at a specific version. In general this is
    # used as an entry point into a graph of catalog objects, where the objects exist
    # at a specific version.
    class CatalogObjectReference < Internal::Types::Model
      field :object_id_, -> { String }, optional: true, nullable: false
      field :catalog_version, -> { Integer }, optional: true, nullable: false
    end
  end
end
