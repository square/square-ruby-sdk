# frozen_string_literal: true

module Square
    module Types
        class UpdateCatalogImageRequest < Square::Internal::Types::Model
            field :idempotency_key, String, optional: false, nullable: false
        end
    end
end
