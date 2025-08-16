# frozen_string_literal: true

module Square
  module Types
    class GetCatalogObjectResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :object, Square::CatalogObject, optional: true, nullable: false
      field :related_objects, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false

    end
  end
end
