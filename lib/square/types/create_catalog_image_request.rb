# frozen_string_literal: true

module Square
  module Types
    class CreateCatalogImageRequest < Internal::Types::Model
      field :idempotency_key, -> { String }, optional: false, nullable: false
      field :object_id_, -> { String }, optional: true, nullable: false, api_name: "object_id"
      field :image, -> { Square::Types::CatalogObject }, optional: false, nullable: false
      field :is_primary, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
