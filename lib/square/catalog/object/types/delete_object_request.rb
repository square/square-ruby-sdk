# frozen_string_literal: true

module Square
  module Catalog
    module Object_
      module Types
        class DeleteObjectRequest < Internal::Types::Model
          field :object_id_, -> { String }, optional: false, nullable: false, api_name: "object_id"
        end
      end
    end
  end
end
