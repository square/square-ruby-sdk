# frozen_string_literal: true

module Square
  module Snippets
    module Types
      class UpsertSnippetRequest < Internal::Types::Model
        field :site_id, -> { String }, optional: false, nullable: false
        field :snippet, -> { Square::Types::Snippet }, optional: false, nullable: false
      end
    end
  end
end
