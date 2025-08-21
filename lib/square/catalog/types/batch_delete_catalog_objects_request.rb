# frozen_string_literal: true

module Square
  module Catalog
    module Types
      class BatchDeleteCatalogObjectsRequest < Internal::Types::Model
        field :object_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
