# frozen_string_literal: true

module Square
  module Types
    # Represents a `DeleteSnippet` response.
    class DeleteSnippetResponse < Internal::Types::Model
      field :errors, -> { Internal::Types::Array[Square::Types::Error] }, optional: true, nullable: false
    end
  end
end
