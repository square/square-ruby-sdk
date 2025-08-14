# frozen_string_literal: true

module Square
    module Types
        # Represents a `RetrieveSnippet` response. The response can include either `snippet` or `errors`.
        class GetSnippetResponse < Square::Internal::Types::Model
            field :errors, Square::Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
            field :snippet, Square::Snippet, optional: true, nullable: false
        end
    end
end
