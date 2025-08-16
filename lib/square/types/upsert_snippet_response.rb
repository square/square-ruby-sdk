# frozen_string_literal: true

module Square
  module Types
    # Represents an `UpsertSnippet` response. The response can include either `snippet` or `errors`.
    class UpsertSnippetResponse < Internal::Types::Model
      field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false
      field :snippet, Square::Snippet, optional: true, nullable: false

    end
  end
end
