# frozen_string_literal: true

module Square
  module Catalog
    module Images
      module Types
        class UpdateImagesRequest < Internal::Types::Model
          field :image_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
