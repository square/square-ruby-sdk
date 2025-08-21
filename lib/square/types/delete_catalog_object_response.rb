# frozen_string_literal: true

module Square
  module Types
    class DeleteCatalogObjectResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
      field :deleted_object_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      field :deleted_at, -> { String }, optional: true, nullable: false
    end
  end
end
