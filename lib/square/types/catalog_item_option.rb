# frozen_string_literal: true

module Square
  module Types
    # A group of variations for a `CatalogItem`.
    class CatalogItemOption < Internal::Types::Model
      field :name, String, optional: true, nullable: false
      field :display_name, String, optional: true, nullable: false
      field :description, String, optional: true, nullable: false
      field :show_colors, Internal::Types::Boolean, optional: true, nullable: false
      field :values, Internal::Types::Array[Square::CatalogObject], optional: true, nullable: false

    end
  end
end
