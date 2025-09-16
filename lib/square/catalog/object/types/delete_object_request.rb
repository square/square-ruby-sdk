# frozen_string_literal: true

module Square
  module Catalog
    module Object_
      module Types
        class DeleteObjectRequest < Internal::Types::Model
          field :object_id_, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
