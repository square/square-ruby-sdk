# frozen_string_literal: true

module Square
  module Types
    # Represents a `RetrieveSnippet` response. The response can include either `snippet` or `errors`.
    class GetSnippetResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Types::Error], optional: true, nullable: false
      field :snippet, Square::Types::Snippet, optional: true, nullable: false

    end
  end
end
