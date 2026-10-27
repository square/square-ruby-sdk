# frozen_string_literal: true

require_relative "../../square"

module Square
  module Types
    # SEO data for for a seller's Square Online store.
    class CatalogEcomSeoData < Internal::Types::Model
      field :page_title, -> { String }, optional: true, nullable: true

      field :page_description, -> { String }, optional: true, nullable: true

      field :permalink, -> { String }, optional: true, nullable: true
    end
  end
end
