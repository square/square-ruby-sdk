# frozen_string_literal: true

module Square
  module Types
    # V1OrderHistoryEntry
    class V1OrderHistoryEntry < Internal::Types::Model
      field :action, Square::V1OrderHistoryEntryAction, optional: true, nullable: false
      field :created_at, String, optional: true, nullable: false

    end
  end
end
