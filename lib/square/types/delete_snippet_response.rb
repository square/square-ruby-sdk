# frozen_string_literal: true

module Square
  # Represents a `DeleteSnippet` response.
  class DeleteSnippetResponse < Internal::Types::Model
    field :errors, Internal::Types::Array[Square::Error], optional: true, nullable: false

  end
end
