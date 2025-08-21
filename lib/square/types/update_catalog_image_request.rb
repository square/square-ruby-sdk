# frozen_string_literal: true

module Square
  module Types
    class UpdateCatalogImageRequest < Internal::Types::Model
      field :idempotency_key, -> { String }, optional: false, nullable: false
    end
  end
end
