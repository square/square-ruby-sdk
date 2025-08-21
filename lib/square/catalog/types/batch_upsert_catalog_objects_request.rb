# frozen_string_literal: true

module Square
  module Catalog
    module Types
      class BatchUpsertCatalogObjectsRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false
        field :batches, lambda {
          Internal::Types::Array[Square::Types::CatalogObjectBatch]
        }, optional: false, nullable: false
      end
    end
  end
end
