# frozen_string_literal: true

module Square
    module Types
        # Represents an `UpsertSnippet` response. The response can include either `snippet` or `errors`.
        class UpsertSnippetResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Error], optional: true, nullable: false
            field :snippet, Square::Snippet, optional: true, nullable: false
        end
    end
end
