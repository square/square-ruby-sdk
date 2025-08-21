# frozen_string_literal: true

module Square
  module Catalog
    module Object_
      module Types
        class UpsertCatalogObjectRequest < Internal::Types::Model
          field :idempotency_key, -> { String }, optional: false, nullable: false
          field :object, -> { Square::Types::CatalogObject }, optional: false, nullable: false
        end
      end
    end
  end
end
